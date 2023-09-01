import express, { Express, Request, Response , Application, NextFunction } from 'express';
import { RestaurantService } from '../service/RestaurantService';

export class RestaurantController{

   public static async getAllRestaurant(req:Request, res:Response, next:NextFunction){
      let answer = await RestaurantService.getAllRestaurant();
      console.log(typeof(answer));
      console.log(answer[0].place_name);
      res.statusCode = 200;
      res.json(answer);
   }
}
