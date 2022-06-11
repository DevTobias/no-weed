import { Prisma, prisma as prismaclient} from '@prisma/client';
import { prisma } from '@Config/index';



async function writeToDB(obj:any, scheme:any){

    await scheme.create(obj);

}

export async function handleArduinoInput(line:any){
  console.log(line);
  
  let object:any = JSON.parse(line);
  
  // choose which type this is
  // 1 = light 
  // 2 = humid
  // 3 = fluids
  // 4 = temp

  let plant:any = await prisma.plant.findFirst({});

  switch ( object.type ) {
    case 1:
        // light
        writeToDB({plant: plant, val: object.val}, prisma.lightVal);
        break;
    case 2:
        // humidity
        writeToDB({plant: plant, val: object.val}, prisma.humidityVal);
        break;
    case 3:
        // fluids
        writeToDB({plant: plant, val: object.val}, prisma.fluidsVal);
        break;
    case 4: 
        //  temperature
        writeToDB({plant: plant, val: object.val}, prisma.tempVal); 
        break;
 }

}