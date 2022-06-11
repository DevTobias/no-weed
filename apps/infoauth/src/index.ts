import { config, logger } from '@Config/index';
import { app } from './app';

const server = app.listen(config.port, () => {
  logger.info(`Listening to port ${config.port}`);
});

const exitHandler = () => {
  if (!server) process.exit(1);

  server.close(() => {
    logger.info('Server closed');
    process.exit(1);
  });
};

const unexpectedErrorHandler = (error: Error) => {
  logger.error(error);
  exitHandler();
};

process.on('uncaughtException', unexpectedErrorHandler);
process.on('unhandledRejection', unexpectedErrorHandler);

process.on('SIGTERM', () => {
  logger.info('SIGTERM received');
  if (server) server.close();
});
