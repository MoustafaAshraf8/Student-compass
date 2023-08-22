import express,{Request,Response,NextFunction} from 'express';
export class StudentService{
   static signUp(){
      return {
         msg:"student signup succeed!"
      }
   }
   static signIn(){
      return {
         msg:"student signin succeed!"
      }
   }
}