import express, { Express, Request, Response , Application, NextFunction } from 'express';
import { SuppliesService } from '../service/SuppliesService';

export class SuppliesController{

   static getlocation(req:Request, res:Response, next:NextFunction){
      console.log(req.body);
      let answer:Object = SuppliesService.getlocation();
      res.json(req.body);
   }
}
