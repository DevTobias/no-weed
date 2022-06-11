import { catchAsync } from '@infotition/express-error-handler';
import httpStatus from 'http-status';
import * as dataService from '@Services/data.service';
import { Prisma, prisma as prismaclient} from '@prisma/client';
import { prisma } from '@Config/index';

export const data = catchAsync(async (req, res) => {

    let limit = req.params.limit;
    let limitNum: number = +limit;
    const data = await dataService.compileData(limitNum);
    res.status(httpStatus.OK).send(data);


  });

export const names = catchAsync(async (req, res) => {

    const data = await dataService.compileNames();
    res.status(httpStatus.OK).send(data);
    });


export const rules = catchAsync(async (req, res) => {

    let hourStartInput = req.body.hourStart;
    let minuteStartInput = req.body.minuteStart;
    let secondStartInput = req.body.secondStart;

    let hourEndInput = req.body.hourEnd;
    let minuteEndInput = req.body.minuteEnd;
    let secondEndInput = req.body.secondEnd;

    prisma.lightRule.create({hourStart: hourStartInput, minuteStart: minuteStartInput, secondStart: secondStartInput, hourEnd: hourEndInput, minuteEnd: minuteEndInput, secondEnd: secondEndInput});

    res.status(httpStatus.OK);


    });