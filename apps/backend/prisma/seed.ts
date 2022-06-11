import { PrismaClient, Prisma } from '@prisma/client';
import { hashSync } from 'bcrypt';

const prisma = new PrismaClient();
const saltRounds = 10;



const plantData: Prisma.PlantCreateInput[] = [
  {
    name: 'Herribert',
    lightVals: {create: [{ val: '0.1', date: '2022-02-03T12:11:30.111Z'},{ val: '0.2', date: '2022-02-08T12:11:30.111Z'}]},
  },
];



async function main() {
  console.log(`Start seeding ...`);

  await prisma.plant.deleteMany({});
  await prisma.lightVal.deleteMany({});
  await prisma.humidityVal.deleteMany({});
  await prisma.fluidsVal.deleteMany({});
  await prisma.lightVal.deleteMany({});




  plantData.forEach(async (plant) => {
    const { id } = await prisma.plant.create({ data: plant});
    console.log(`Created plant with id: ${id}`);

  });


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
