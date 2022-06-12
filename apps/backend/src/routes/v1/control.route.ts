import * as controlController from '@Controllers/control.controller';
import { Router } from 'express';

export const router = Router();

router.route('/:id').get(controlController.getControlCenterData);
router.route('/light').post(controlController.toggleLight);
router.route('/water-plant').post(controlController.waterPlant);
router.route('/light-interval').post(controlController.persistLightInterval);
