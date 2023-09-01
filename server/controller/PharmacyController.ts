import express, { Express, Request, Response , Application, NextFunction } from 'express';
import { PharmacyService } from '../service/PharmacyService';

export class PharmacyController{

   static async getAllPharmacy(req:Request, res:Response, next:NextFunction){
      let answer:Object = await PharmacyService.getAllPharmacy();
      if(Object(Array(answer)).id){
         res.status(200);
      }else{
         res.status(404);
      }
      res.json(answer);
   }
}
