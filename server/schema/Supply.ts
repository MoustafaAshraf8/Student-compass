import { pool } from "../config/config";
import { Supply_query } from "./sql/Supply_query";

export class Supply{
   private name:string;
   private longtitude:number;
   private latitude:number;

   constructor(name:string, longtitude:number, latitude:number){
       this.name = name;
       this.longtitude = longtitude;
       this.latitude = latitude;
   }

   static async getAllSupply(){
      const query = Supply_query.getAllSupplyQuery();
      try{
         let result = await pool.query(query);
         //delete Object(Object(result).rows).pid;
         console.log(result.rows);
         return result.rows;
      }catch(error){
         return {msg:error}
      }
   }


}