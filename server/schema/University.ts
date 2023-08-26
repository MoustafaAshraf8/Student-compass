import {pool} from '../config/config';
import { University_interface } from '../interface/University_interface';

export class University{
   private university:University_interface;
   constructor(university:University_interface){
      this.university = university;
   }

   static async getAllUniversity(){
      const query = "select * from university;";

      try{
         let result = await pool.query(query);
         return result.rows;
      }catch(error){
         return error;
      }

   }

}