import { prisma } from '@Config/index';
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
        

    } catch(_) {
        throw new ApiError(httpStatus.BAD_REQUEST, 'user with id not found');
    }


    return {data: 'amongus'}
}


export async function compileNames(){


    try{
        

    } catch(_) {
        throw new ApiError(httpStatus.BAD_REQUEST, 'user with id not found');
    }


    return {data: 'amongus'}

}