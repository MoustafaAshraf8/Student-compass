import express, { Express, Request, Response , Application, NextFunction } from 'express';
import { RestaurantService } from '../service/RestaurantService';

export class RestaurantController{

   static getlocation(req:Request, res:Response, next:NextFunction){
      console.log(req.body);
      let answer:Object = RestaurantService.getlocation();
      res.json(req.body);
   }
}
