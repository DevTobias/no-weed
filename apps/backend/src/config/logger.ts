import { format, createLogger, transports } from 'winston';
import { config } from './config';

const enumerateErrorFormat = format((info) => {
  if (info instanceof Error) {
    Object.assign(info, { message: info.stack });
  }
  return info;
});

const idDev = config.env === 'development';

export const logger = createLogger({
  level: idDev ? 'debug' : 'info',

  format: format.combine(
    enumerateErrorFormat(),
    idDev ? format.colorize() : format.uncolorize(),
    format.splat(),
    format.printf(({ level, message }) => `${level}: ${message}`),
  ),

  transports: [
    new transports.Console({
      stderrLevels: ['error'],
    }),
  ],
});
