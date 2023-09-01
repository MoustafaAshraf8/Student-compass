import express, { Express, Request, Response , Application, NextFunction } from 'express';
import {User} from '../schema/User';
import { StudentService } from '../service/StudentService';
import { User_interface } from '../interface/User_interface';
import { SignIn_interface } from '../interface/SignIn_interface';

export class StudentController{

   static async signUp(req:Request, res:Response, next:NextFunction){
      const userInfo:User_interface = {
         name:req.body.name,
         email:req.body.email,
         password:req.body.password,
         universityId: req.body.universityId == undefined ? 1 : Number(req.body.universityId)
      }
       console.log(userInfo);
       let answer =await StudentService.signUp(userInfo);
       if(Array(answer)[0].id){

         //generate jwt
          res.statusCode = 200;
         }else{
            res.statusCode = 401
         }
      console.log(answer);
      res.json(answer);
   }

   static async signIn(req:Request, res:Response, next:NextFunction){
      //console.log(req.body);
      let userInfo:SignIn_interface = {
         email: req.body.username,
         password: req.body.password
      }
      let answer:Object = await StudentService.signIn(userInfo);
      if(Object(answer).id){
         res.statusCode = 200;
      }else{
         res.statusCode = 403
      }
      console.log(answer);
      res.json(answer);
   }

   static async rentPlace(req:Request, res:Response, next:NextFunction){
      console.log(req.body);
      let studentId = req.body.studentId;
      let placeId = req.body.placeId;
      let result = await StudentService.rentPlace(studentId, placeId);
      res.json(result);
   }
}
