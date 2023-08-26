import express,{Request,Response,NextFunction} from 'express';
import { UniversityService } from '../service/UniversityService';


export class UniversityController{

   static async getUniversity(req:Request,res:Response,next:NextFunction){
      let result = await UniversityService.getAllUniversity();
      res.json(result);
   }

}