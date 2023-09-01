import express,{Request,Response,NextFunction} from 'express';
import { Parser } from '../utilities/Parser';
import { Restaurant } from '../schema/Restaurant';
export class RestaurantService{
    public static async getAllRestaurant(){
      let result:string = await Restaurant.getAllRestaurant();
      let parsedRestaurant: any[] = Parser.restaurantParser(result);
      return parsedRestaurant;
   }
}