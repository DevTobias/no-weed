import { prisma } from '@Config/index';
import { ApiError } from '@infotition/express-error-handler';
import httpStatus from 'http-status';
import { sendEvent } from './arduino.service';

export const getControlData = async (glassHouseId: string) => {
  const raw = await prisma.glasshouse.findUnique({
    where: { id: glassHouseId },
    select: {
      lightPhaseHourEnd: true,
      lightPhaseHourStart: true,
      lightPhaseMinuteEnd: true,
      lightPhaseMinuteStart: true,
      waterLevel: true,
      lightOn: true,
      humidityValues: {
        orderBy: { date: 'asc' },
        take: 1,
        select: { value: true, date: true },
      },
      lightValues: {
        orderBy: { date: 'asc' },
        take: 1,
        select: { value: true, date: true },
      },
      temperatureValues: {
        orderBy: { date: 'asc' },
        take: 1,
        select: { value: true, date: true },
      },
    },
  });

  if (!raw)
    throw new ApiError(httpStatus.BAD_REQUEST, 'glasshouse id not registered');

  return {
    start_hour: raw.lightPhaseHourStart,
    start_minute: raw.lightPhaseMinuteStart,
    end_hour: raw.lightPhaseHourEnd,
    end_minute: raw.lightPhaseMinuteEnd,
    water_level: raw.waterLevel,
    humidity: raw.humidityValues[0].value,
    light_level: raw.lightValues[0].value,
    temperature: raw.temperatureValues[0].value,
    light_on: raw.lightOn,
  };
};

export const saveLightInterval = async (
  glassHouseId: string,
  isStart: boolean,
  time: { hours: number; minutes: number },
) => {
  // TODO: ADJUST CRON JOB FOR ARDUINO INTERVAL

  try {
    if (isStart)
      return prisma.glasshouse.update({
        where: { id: glassHouseId },
        data: {
          lightPhaseHourStart: time.hours,
          lightPhaseMinuteStart: time.minutes,
        },
      });

    return prisma.glasshouse.update({
      where: { id: glassHouseId },
      data: {
        lightPhaseHourEnd: time.hours,
        lightPhaseMinuteEnd: time.minutes,
      },
    });
  } catch (_) {
    throw new ApiError(httpStatus.BAD_REQUEST, 'glasshouse not found');
  }
};

export const toggleLight = async (glassHouseId: string, value: boolean) => {
  sendEvent(value ? 'lighton' : 'lightoff');

  try {
    return prisma.glasshouse.update({
      where: { id: glassHouseId },
      data: { lightOn: value },
    });
  } catch (_) {
    throw new ApiError(httpStatus.BAD_REQUEST, 'glasshouse not found');
  }
};

export const waterPlant = async () => {
  sendEvent('water');
};
