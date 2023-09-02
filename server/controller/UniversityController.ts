import express,{Request,Response,NextFunction} from 'express';
import { UniversityService } from '../service/UniversityService';


export class UniversityController{

   static async getUniversity(req:Request,res:Response,next:NextFunction){
      let result = await UniversityService.getAllUniversity();
      console.log(result[0]);
      res.statusCode = 200;
      res.json(result);
   }

}