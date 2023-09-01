import {pool} from '../config/config';
import { PharmacyQuery } from './sql/Pharmacy_query';
export class Pharmacy{
   private pid:number;
   private name:string;
   private longitude:number;
   private latitude:number;

   constructor(pid:number,name:string,longitude:number,latitude:number){
       this.pid=pid;
       this.name=name;
       this.longitude=longitude;
       this.latitude=latitude;
   }

   static async getAllPharmacy(){
      const query = PharmacyQuery.getAllPharmacyQuery();
      try{
         let result = await pool.query(query);
         //delete Object(Object(result).rows).pid;
         return result.rows;
      }catch(error){
         return {msg:error}
      }
   }

}