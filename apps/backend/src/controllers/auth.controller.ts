import * as authService from '@Services/auth.service';
import * as userValidation from '@Validations/auth.validation';
import { catchAsync } from '@infotition/express-error-handler';
import httpStatus from 'http-status';

export const signUp = catchAsync(async (req, res) => {
  const { body } = userValidation.signup.parse(req);
  const user = await authService.signUp(body);
  res.status(httpStatus.CREATED).send(user);
});

export const signIn = catchAsync(async (req, res) => {
  const { body } = userValidation.signin.parse(req);
  const { accessToken } = await authService.signIn(req, res, body);
  res.status(httpStatus.OK).send({ accessToken });
});

export const signOut = catchAsync(async (req, res) => {
  await authService.signOut(req, res);
  res.status(httpStatus.OK).send('logged out');
});

export const refreshToken = catchAsync(async (req, res) => {
  const { accessToken } = await authService.refreshToken(req, res);
  res.status(httpStatus.OK).send({ accessToken });
});
