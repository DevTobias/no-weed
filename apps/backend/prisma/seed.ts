import { PrismaClient, Prisma } from '@prisma/client';
import { hashSync } from 'bcrypt';

const prisma = new PrismaClient();
const saltRounds = 10;

const plantData: Prisma.PlantCreateInput[] = [
  {
    name: 'Herribert',
  },
  {
    name: 'Sosenbert',
  },

];

const lightvalData: Prisma.LightValCreateInput[] = [
  {
    val: '0',
    date: '2022-02-03T12:11:30.111Z'
  },
  {
    val: '0.1',
    date: '2022-02-02T12:01:30.111Z'
  },
];

async function main() {
  console.log(`Start seeding ...`);

  plantData.forEach(async (plant) => {
    const { id } = await prisma.plant.create({ data: plant });
    console.log(`Created plant with id: ${id}`);

    lightvalData.forEach(async (lightVal) => {

      await prisma.plant.create({ data: plant });
      console.log(`Created light value.....`);

    });  

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
