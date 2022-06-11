import { Router } from 'express';
import * as dataController from '@Controllers/data.controller';

export const router = Router()

router.route('/data/:limit').get(dataController.data);
