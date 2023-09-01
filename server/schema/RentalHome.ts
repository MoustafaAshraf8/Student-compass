import { log } from "console";
import { pool } from "../config/config";
export class RentalHome{
   // private name:String;
   // private logtitude:Number;
   // private latitude:Number;
   // private space:Number;
   // private room:Number;
   // private pricepernight:Number;
   // private duration:Number;
   // private available:boolean;


   constructor(name:String, longtitude:number, latitude:number, space:number, room:number, pricepernight:number, duration:number, available:boolean){
      // this.name = name;
      // this.longtitude = longtitude;
   }

   static async getAllRentalHome(){
      const query = `select * from place inner join rentalhome on place.id=rentalhome.pid;`;
      try{
         let result = await pool.query(query);
         //delete Object(Object(result).rows).pid;
         console.log(result.rows[0]);
         return result.rows;
      }catch(error){
         return {msg:error}
      }
   }
}