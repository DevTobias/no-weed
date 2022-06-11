import { config } from './config';

export const corsOptions = {
  origin: (origin: string | undefined, callback: CallableFunction) => {
    if (!origin || config.origins.indexOf(origin) !== -1) {
      return callback(null, true);
    }

    return callback(new Error('Not allowed by CORS'));
  },
  optionsSuccessStatus: 200,
};
