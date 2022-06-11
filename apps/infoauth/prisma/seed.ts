import { PrismaClient, Prisma } from '@prisma/client';
import { hashSync } from 'bcrypt';

const prisma = new PrismaClient();
const saltRounds = 10;

const userData: Prisma.UserCreateInput[] = [
  {
    username: 'AliceClements',
    email: 'alice.clements@prisma.io',
    password: hashSync('password', saltRounds),
  },
  {
    username: 'MadelineHarding',
    email: 'madeline.harding@prisma.io',
    password: hashSync('Harding1310', saltRounds),
  },
  {
    username: 'XeniaKeith',
    email: 'xenia.Springer@prisma.io',
    password: hashSync('password', saltRounds),
  },
];

async function main() {
  console.log(`Start seeding ...`);

  userData.forEach(async (user) => {
    const { id } = await prisma.user.create({ data: user });
    console.log(`Created user with id: ${id}`);
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
