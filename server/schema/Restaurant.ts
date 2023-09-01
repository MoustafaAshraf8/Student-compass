import { pool } from "../config/config";
import { RestaurantQuery } from "./sql/Restaurant_query";
export class Restaurant{
   private pid:number;
   private name:string;
   private description:string;
   private longitude:number;
   private latitude:number;

   constructor(pid:number,name:string,description:string, longitude:number,latitude:number){
       this.pid=pid;
       this.name=name;
       this.longitude=longitude;
       this.latitude=latitude;
      this.description=description;
   }

   public static async getAllRestaurant(){
      const query = RestaurantQuery.getAllRestaurantQuery();

      try{
         let result = await pool.query(query);

         return JSON.stringify(result.rows);

      }catch(error){
         throw error;
      }
   }



}