import express,{Request,Response,NextFunction} from 'express';
export class PharmaService{
   static getlocation(){
      return {
         msg:"Location has been get successfully"
      }
   }
}