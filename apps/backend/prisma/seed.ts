import { PrismaClient, Prisma } from '@prisma/client';

const prisma = new PrismaClient();

const glasshouseData: Prisma.GlasshouseCreateInput = {
  id: 'dc7521a9-c17c-4194-8ba3-eae27f99be34',
  lightPhaseHourStart: 7,
  lightPhaseMinuteStart: 0,
  lightPhaseHourEnd: 19,
  lightPhaseMinuteEnd: 0,
  waterLevel: 42,
  lightOn: false,
  lightValues: {
    create: [
      { value: 16 },
      { value: 18 },
      { value: 20 },
      { value: 40 },
      { value: 56 },
      { value: 70 },
      { value: 72 },
      { value: 65 },
      { value: 54 },
    ],
  },
  temperatureValues: {
    create: [
      { value: 25.4 },
      { value: 25.7 },
      { value: 26.2 },
      { value: 26.1 },
      { value: 26.7 },
      { value: 27.4 },
      { value: 28.1 },
      { value: 26.3 },
      { value: 25.2 },
    ],
  },
  humidityValues: {
    create: [
      { value: 60 },
      { value: 54 },
      { value: 47 },
      { value: 45 },
      { value: 36 },
      { value: 47 },
      { value: 53 },
      { value: 58 },
      { value: 65 },
    ],
  },
};

async function main() {
  await prisma.glasshouse.deleteMany({});

  console.log(`Start seeding ...`);

  const { id } = await prisma.glasshouse.create({ data: glasshouseData });
  console.log(`Created glasshouseData with id: ${id}`);

  console.log(`Seeding finished.`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
