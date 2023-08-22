import express, { Express, Request, Response , Application, NextFunction } from 'express';
import { StudentService } from '../service/StudentService';

export class StudentController{

   static signUp(req:Request, res:Response, next:NextFunction){
      let answer:Object = StudentService.signUp();
      res.json(answer);
   }
   static signIn(req:Request, res:Response, next:NextFunction){
      let answer:Object = StudentService.signIn();
      res.json(answer);
   }

}

