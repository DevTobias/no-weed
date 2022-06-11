import { ApiError } from '@infotition/express-error-handler';
import dayjs from 'dayjs';
import httpStatus from 'http-status';
import { JwtPayload, sign, verify } from 'jsonwebtoken';

type Expiration = {
  expires: number;
  unit: 'seconds' | 'minutes' | 'days';
};

/**
 * Takes an uuid and an expiration time in minutes, and returns a JWT token.
 * The jwt algorithm uses the rsa256 algorithm. The token must get signed with
 * the private key of the auth server.
 *
 * @param uuid        The uuid we want to generate a token for.
 * @param secret      The private key the token should get signed from.
 * @param expiration  The number of minutes the token will be valid for.
 * @returns           A signed JWT token.
 */
export const generateToken = (
  uuid: string,
  secret: string,
  expiration: Expiration,
) => {
  const now = dayjs().unix();
  const expiresIn = dayjs().add(expiration.expires, expiration.unit).unix();
  const payload = { sub: uuid, iat: now, exp: expiresIn };
  return sign(payload, secret, { algorithm: 'RS256' });
};

/**
 * It takes the token and a secret and returns the decoded payload if the token is valid, or throws an
 * error if the token is invalid or expired. The jwt algorithm uses the rsa256 algorithm. The token
 * must get verified with the public key of the auth server.
 *
 * @param token   The token to be verified.
 * @param secret  The secret key used to verify the token.
 * @returns       The payload of the token and a boolean value indicating whether the token has expired.
 */
export const verifyToken = (token: string, secret: string) => {
  try {
    const decoded = verify(token, secret) as JwtPayload;
    return { payload: decoded, expired: false };
  } catch (_) {
    throw new ApiError(
      httpStatus.UNAUTHORIZED,
      'provided token is invalid or has expired',
    );
  }
};
