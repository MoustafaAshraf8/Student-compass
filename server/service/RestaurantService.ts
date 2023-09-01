import express,{Request,Response,NextFunction} from 'express';
import { Parser } from '../utilities/Parser';
import { Restaurant } from '../schema/Restaurant';
export class RestaurantService{
    public static async getAllRestaurant(){
      let result:string = await Restaurant.getAllRestaurant();
      let parsedRestaurant: any[] = Parser.restaurantParser(result);
      // console.log(typeof(result));
      // console.log(typeof(JSON.stringify(result)));
      // console.log(JSON.parse(JSON.stringify(result))[0].restaurant_description);

      // console.log(typeof(parsedRestaurant));
      // console.log(parsedRestaurant);

      return parsedRestaurant;
   }
}