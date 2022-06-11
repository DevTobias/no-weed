import * as authController from '@Controllers/auth.controller';
import { Router } from 'express';

export const router = Router();
router.route('/signup').post(authController.signUp);
router.route('/signin').post(authController.signIn);
router.route('/refresh-token').post(authController.refreshToken);
