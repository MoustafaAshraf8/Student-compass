import {pool} from '../config/config';
import { University_interface } from '../interface/University_interface';
import { UniversityQuery } from './sql/University_query';
export class University{
   private university:University_interface;
   constructor(university:University_interface){
      this.university = university;
   }

   static async getAllUniversity(): Promise<string>{
      const query = UniversityQuery.getAllUniversity();

      try{
         let result = await pool.query(query);
         return JSON.stringify(result.rows);
      }catch(error){
         throw error;
      }
      
   }
}