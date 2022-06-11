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


export async function compileData(limit: number=5){

    try{
        
      let plant = await prisma.plant.findFirst({});
      let lightData = null;
      if(plant != null){
          lightData = await prisma.lightVal.findMany({where: {plantid: plant.id}, orderBy: {date: 'desc'}, take: limit});
      }

      return lightData;

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