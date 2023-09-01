import {Request, Response , NextFunction } from 'express';
import { SupplyService } from '../service/SupplyService';

export class SupplyController
{
   static async getAllSupply(req:Request, res:Response, next:NextFunction){
      let answer = await SupplyService.getAllSupply();
      res.statusCode = 200;
      res.json(answer);
   }
}
