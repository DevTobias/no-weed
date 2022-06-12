import { Router } from 'express';
import { router as controlRouter } from './control.route';

export const routes = Router();

const defaultRoutes = [{ path: '/control', route: controlRouter }];

defaultRoutes.forEach(({ path, route }) => routes.use(path, route));
