import * as controlService from '@Services/control.service';
import { catchAsync } from '@infotition/express-error-handler';
import httpStatus from 'http-status';

export const getControlCenterData = catchAsync(async (req, res) => {
  const data = await controlService.getControlData(req.params.id);
  res.status(httpStatus.OK).send(data);
});

export const toggleLight = catchAsync(async (req, res) => {
  const { id, value } = req.body;
  await controlService.toggleLight(id, value);
  res.status(httpStatus.OK).send();
});

export const waterPlant = catchAsync(async (_, res) => {
  await controlService.waterPlant();
  res.status(httpStatus.OK).send();
});

export const persistLightInterval = catchAsync(async (req, res) => {
  const { id, isStart, time } = req.body;
  await controlService.saveLightInterval(id, isStart, time);
  res.status(httpStatus.OK).send();
});
