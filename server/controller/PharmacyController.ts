import express, { Express, Request, Response , Application, NextFunction } from 'express';
import { PharmacyService } from '../service/PharmacyService';

export class PharmacyController{

   static async getAllPharmacy(req:Request, res:Response, next:NextFunction){
      let answer = await PharmacyService.getAllPharmacy();
      console.log(answer[0].place_name);
      res.statusCode = 200;
      res.json(answer);
   }
}
