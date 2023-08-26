import express,{Request,Response,NextFunction} from 'express';
import {User} from '../schema/User';
import { User_interface } from '../interface/User_interface';
export class StudentService{
   static async signUp(userInfo:User_interface){
      const newUser:User = new User(userInfo);
      let result = await newUser.signup();
      return {msg:result};
   }
   static signIn(){
      return {
         msg:"student signin succeed!"
      }
   }
}