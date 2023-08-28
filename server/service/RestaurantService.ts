import express,{Request,Response,NextFunction} from 'express';
export class RestaurantService{
   static getlocation(){
      return {
         msg:"Location has been get successfully"
      }
   }
}