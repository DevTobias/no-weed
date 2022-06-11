import { Router } from 'express';
import { router as dataRouter } from './data.route';

export const routes = Router();

const defaultRoutes = [
  { path: '/', route: dataRouter },
];

defaultRoutes.forEach(({ path, route }) => routes.use(path, route));
