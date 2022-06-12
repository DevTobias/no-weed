import {
  config,
  logger,
  successHandler as morganSuccessHandler,
  errorHandler as morganErrorHandler,
  corsOptions,
} from '@Config/index';
import { routes } from '@Routes/v1';
//import { setListener } from '@arduino_controller/arduino_controller';
import {
  errorConverter,
  errorHandler,
  ApiError,
} from '@infotition/express-error-handler';
import compression from 'compression';
import cookieParser from 'cookie-parser';
import cors from 'cors';
import express, {
  json,
  urlencoded,
  Request,
  Response,
  NextFunction,
} from 'express';
import helmet from 'helmet';
import httpStatus from 'http-status';

export const app = express();

// set up morgan handlers
if (config.env !== 'test') {
  app.use(morganSuccessHandler);
  app.use(morganErrorHandler);
}

// set security HTTP headers
app.use(helmet());

// parse json request body
app.use(json());

// parse urlencoded request body
app.use(urlencoded({ extended: true }));

// middleware for cookies
app.use(cookieParser());

// gzip compression
app.use(compression());

// enable cors
app.use(cors(corsOptions));

// v1 api routes
app.use('/v1', routes);

// simple ping command to test uptime
app.get('/ping', (_req: Request, res: Response) => res.send('pong'));

// send back a 404 error for any unknown api request
app.use((_, __, next) => next(new ApiError(httpStatus.NOT_FOUND, 'Not found')));

// convert error to ApiError, if needed
app.use((err: ApiError, _: Request, __: Response, next: NextFunction) =>
  errorConverter(err, next),
);

// handle error
app.use((err: ApiError, _: Request, res: Response, __: NextFunction) =>
  errorHandler(err, logger, res),
);

//setListener();
