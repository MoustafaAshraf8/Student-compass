import express, { Express, Request, Response , Application, NextFunction } from 'express';
import { PharmaService } from '../service/PharmaService';

export class PharmaController{

   static getlocation(req:Request, res:Response, next:NextFunction){
      console.log(req.body);
      let answer:Object = PharmaService.getlocation();
      res.json(req.body);
   }
}
