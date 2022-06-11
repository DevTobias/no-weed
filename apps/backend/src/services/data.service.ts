import { prisma } from '@Config/index';
import { data } from '@Controllers/data.controller';
import { ApiError } from '@infotition/express-error-handler';
import httpStatus from 'http-status';

/*
export const getUser = async (id: string | undefined) => {
    try {
      return prisma.user.findUnique({
        where: { id },
        select: { username: true, email: true, payload: true },
      });
    } catch (_) {
      throw new ApiError(httpStatus.BAD_REQUEST, 'user with id not found');
    }
  };*/

async function getData(obj: any, limit: number, id: String){

  let data = await obj.findMany({where: {plantid: id}, orderBy: {date: 'desc'}, take: limit});
  return data;

}

export async function compileData(limit: number=5){

    try{
        
      let plant = await prisma.plant.findFirst({});
      let lightData = null;
      let humData = null
      let fluidData = null
      let tempData = null

      if(plant != null){
        lightData = await getData(prisma.lightVal, limit, plant.id);
      }

      if(plant != null){
        humData = await getData(prisma.humidityVal, limit, plant.id);
      }

      if(plant != null){
        fluidData = await getData(prisma.fluidsVal, limit, plant.id);
      }

      if(plant != null){
        tempData = await getData(prisma.tempVal, limit, plant.id);
      }

      let data = {lightValues: lightData, humidityData: humData, fluidityData: fluidData, temperatureData: tempData};

      return data;

    } catch(_) {
        throw new ApiError(httpStatus.BAD_REQUEST, '');
    }


}


export async function compileNames(){


    try{

      // get all of the plants
      const plants = await prisma.plant.findMany();
      return plants;

    } catch(_) {
        throw new ApiError(httpStatus.BAD_REQUEST, '');
    }


}