import { port } from '@Config/arduino';
import { prisma } from '@Config/prisma';

type EventData = {
  code: 1 | 2 | 3 | 4;
  value: number;
};

export const handleArduinoEvent = (line: string) => {
  const data: EventData = JSON.parse(line);
  const id = 'dc7521a9-c17c-4194-8ba3-eae27f99be34';

  // 1 = light intensity
  // 2 = humidity
  // 3 = water level
  // 4 = temperature
  switch (data.code) {
    case 1:
      return prisma.lightValue.create({
        data: { glasshouseId: id, value: data.value },
      });
    case 2:
      return prisma.humidityValue.create({
        data: { glasshouseId: id, value: data.value },
      });
    case 3:
      return prisma.glasshouse.update({
        where: { id },
        data: { waterLevel: data.value },
      });
    case 4:
      return prisma.temperatureValue.create({
        data: { glasshouseId: id, value: data.value },
      });
  }
};

export const sendEvent = (msg: string) => port.write(msg);
