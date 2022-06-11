import { config, prisma } from '@Config/index';
import { SignIn, SignUp } from '@Validations/auth.validation';
import { ApiError } from '@infotition/express-error-handler';
import { compareSync, hashSync } from 'bcrypt';
import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { generateToken, verifyToken } from './token.service';

/**
 * Creates a new user in the database. If the email or username already exists, an
 * error is thrown.
 *
 * @param body The sign up credentials.
 * @returns The created user after successful sign up.
 */
export const signUp = async (body: SignUp) => {
  const { email, password, username, payload } = body;

  const user = {
    email,
    password: hashSync(password, config.hashing.saltRounds),
    username,
    payload,
  };

  try {
    const createdUser = await prisma.user.create({
      data: user,
      select: { id: true, email: true, username: true, payload: true },
    });

    return createdUser;
  } catch (_) {
    throw new ApiError(httpStatus.BAD_REQUEST, 'email already taken');
  }
};

/**
 * Tries to sign in the user with the provided credentials. If the credentials dont match
 * or weren't found, an error is returned. If the credentials are valid, an refresh tokens
 * gets saved in client cookies and an access token is returned. If this service is called
 * with an given refresh token cookie, which was already invalidated, all tokens get invalidated.
 *
 * @param req   The express request object.
 * @param res   The express response object.
 * @param body  The sign up credentials.
 *
 * @returns An access token if credentials are correct. Also sets a refresh token to the `rTOken` cookie.
 */
export const signIn = async (req: Request, res: Response, body: SignIn) => {
  const { REFRESHTOKEN }: { REFRESHTOKEN: string } = req.cookies;
  const { email, password } = body;

  const foundUser = await prisma.user.findUnique({ where: { email } });

  if (!foundUser) {
    throw new ApiError(httpStatus.UNAUTHORIZED, 'incorrect email or password');
  }

  const passwordMatches = compareSync(password, foundUser.password);

  if (!passwordMatches) {
    throw new ApiError(httpStatus.UNAUTHORIZED, 'incorrect email or password');
  }

  // Generate a fresh token pair to send to the user
  const accessToken = generateToken(foundUser.id, config.jwt.secret, {
    expires: config.jwt.accessExpirationMinutes,
    unit: 'minutes',
  });

  const nRefreshToken = generateToken(foundUser.id, config.jwt.refreshSecret, {
    expires: config.jwt.refreshExpirationDays,
    unit: 'days',
  });

  // Generate the new token list based of the cookie and the already persisted tokens.
  let refreshTokenArray = REFRESHTOKEN
    ? foundUser.tokens
    : foundUser.tokens.filter((token) => token !== REFRESHTOKEN);

  // If an refresh token exists in sign in process, just delete it
  // Try to find the tokens user in the database, if no token is found, but the
  // cookie was provided, it means, that the token was reused after invalidation.
  // If this reuse detection fires, invalidate all other refresh tokens.
  if (REFRESHTOKEN) {
    const foundUser = await prisma.user.findFirst({
      where: { tokens: { has: REFRESHTOKEN } },
    });

    if (!foundUser) {
      refreshTokenArray = [];
    }

    res.clearCookie('REFRESHTOKEN', config.jwt.tokenClearCookie);
  }

  // Persist the new refresh token in the database to validate it
  await prisma.user.update({
    where: { id: foundUser.id },
    data: { tokens: [...refreshTokenArray, nRefreshToken] },
  });

  // Creates secure refresh token cookie and returns the generated access token
  res.cookie('REFRESHTOKEN', nRefreshToken, config.jwt.tokenSetCookie);

  return { accessToken };
};

/**
 * Signs out the currently authenticated user. Because the access token is short lived,
 * there is no need to invalidate it on server side. This token should just get deleted
 * in the client. However the rToken cookie is a long live token. So ensure security,
 * this token must get invalidated server side.
 *
 * @param req   The express request object.
 * @param res   The express response object.
 *
 */
export const signOut = async (req: Request, res: Response) => {
  const { REFRESHTOKEN }: { REFRESHTOKEN: string } = req.cookies;

  if (!REFRESHTOKEN) {
    throw new ApiError(httpStatus.UNAUTHORIZED, 'not authenticated');
  }

  // Search the user with the specific token
  const foundUser = await prisma.user.findFirst({
    where: { tokens: { has: REFRESHTOKEN } },
  });

  res.clearCookie('REFRESHTOKEN', config.jwt.tokenClearCookie);

  if (!foundUser) {
    throw new ApiError(httpStatus.UNAUTHORIZED, 'not authenticated');
  }

  // Invalidate the refresh token to sign user out
  const filteredTokens = foundUser.tokens.filter(
    (token) => token !== REFRESHTOKEN,
  );

  // Persist the new refresh token in the database to validate it
  await prisma.user.update({
    where: { id: foundUser.id },
    data: { tokens: filteredTokens },
  });
};

/**
 * Refresh the access token with the provided refresh token. The old one gets
 * invalidated. If an token reuse is detected, all refresh tokens get invalidated.
 * After every refresh, a key rotation is done by regenerating a new refresh
 * token.
 *
 * @param req   The express request object.
 * @param res   The express response object.
 *
 */
export const refreshToken = async (req: Request, res: Response) => {
  const { REFRESHTOKEN }: { REFRESHTOKEN: string } = req.cookies;

  if (!REFRESHTOKEN) {
    throw new ApiError(httpStatus.UNAUTHORIZED, 'not authenticated');
  }

  res.clearCookie('REFRESHTOKEN', config.jwt.tokenClearCookie);

  // Search the user with the specific token
  const foundUser = await prisma.user.findFirst({
    where: { tokens: { has: REFRESHTOKEN } },
  });

  const decoded = verifyToken(REFRESHTOKEN, config.jwt.refreshPublicSecret);

  // If the refresh token is not found, this means and old token is reused.
  // If this is the case, find the hacked user and invalidate all his refresh tokens.
  if (!foundUser) {
    await prisma.user.update({
      where: { id: decoded.payload.sub },
      data: { tokens: [] },
    });

    throw new ApiError(httpStatus.UNAUTHORIZED, 'not authenticated');
  }

  // Generate the new token list based of the cookie and the already persisted tokens.
  const refreshTokenArray = REFRESHTOKEN
    ? foundUser.tokens
    : foundUser.tokens.filter((token) => token !== REFRESHTOKEN);

  // Generate a fresh token pair to send to the user
  const accessToken = generateToken(foundUser.id, config.jwt.secret, {
    expires: config.jwt.accessExpirationMinutes,
    unit: 'minutes',
  });

  const nRefreshToken = generateToken(foundUser.id, config.jwt.refreshSecret, {
    expires: config.jwt.refreshExpirationDays,
    unit: 'days',
  });

  // Persist the new refresh token in the database to validate it
  await prisma.user.update({
    where: { id: decoded.payload.sub },
    data: { tokens: [...refreshTokenArray, nRefreshToken] },
  });

  res.cookie('rToken', nRefreshToken, config.jwt.tokenSetCookie);

  return { accessToken };
};
