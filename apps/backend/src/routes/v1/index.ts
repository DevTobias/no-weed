import { Router } from 'express';
import { router as authRoute } from './auth.route';

export const routes = Router();

const defaultRoutes = [
  { path: '/auth', route: authRoute },
];

defaultRoutes.forEach(({ path, route }) => routes.use(path, route));
