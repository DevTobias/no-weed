import { sendEvent } from '@Services/arduino.service';

import { schedule } from 'node-cron';
import { prisma } from './prisma';

// ask arduino every 5 minutes for fresh data to receive
schedule('*/5 * * * *', () => {
  sendEvent('datarequest');
});

const toggleLight = async (glassHouseId: string, value: boolean) => {
  sendEvent(value ? 'lighton' : 'lightoff');

  return prisma.glasshouse.update({
    where: { id: glassHouseId },
    data: { lightOn: value },
  });
};
// disable light at given time
let disableLightTask = schedule('0 19 * * *', async () => {
  console.log('disable');
  const id = 'dc7521a9-c17c-4194-8ba3-eae27f99be34';
  await toggleLight(id, false);
});

// enable light at given time
let enableLightTask = schedule('0 8 * * *', async () => {
  console.log('enable');
  const id = 'dc7521a9-c17c-4194-8ba3-eae27f99be34';
  await toggleLight(id, true);
});

export const updateLightTask = (
  value: boolean,
  hour: number,
  minute: number,
) => {
  if (!value) {
    disableLightTask.stop();
    disableLightTask = schedule(`${minute} ${hour} * * *`, async () => {
      const id = 'dc7521a9-c17c-4194-8ba3-eae27f99be34';
      await toggleLight(id, false);
    });
    return;
  }

  enableLightTask.stop();
  enableLightTask = schedule(`${minute} ${hour} * * *`, async () => {
    const id = 'dc7521a9-c17c-4194-8ba3-eae27f99be34';
    await toggleLight(id, true);
  });
};
