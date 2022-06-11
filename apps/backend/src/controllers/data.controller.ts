import { catchAsync } from '@infotition/express-error-handler';
import httpStatus from 'http-status';
import * as dataService from '@Services/data.service';


export const data = catchAsync(async (req, res) => {

    let limit = req.params.limit;
    let limitNum: number = +limit;
    const data = await dataService.compileData(limitNum);
    res.status(httpStatus.OK).send(data);


  });