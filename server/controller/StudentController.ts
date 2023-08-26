import express, { Express, Request, Response , Application, NextFunction } from 'express';
import {User} from '../schema/User';
import { StudentService } from '../service/StudentService';
import { User_interface } from '../interface/User_interface';

export class StudentController{

   static async signUp(req:Request, res:Response, next:NextFunction){
      console.log(req.body);
      const userInfo:User_interface = {
         name:req.body.name,
         email:req.body.email,
         password:req.body.password,
         universityId:Number(req.body.universityId)
      }
       
      let result =await StudentService.signUp(userInfo);
      res.json(result);
   }
   static signIn(req:Request, res:Response, next:NextFunction){
      let answer:Object = StudentService.signIn();
      res.json(answer);
   }
}
