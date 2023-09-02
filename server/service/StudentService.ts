import express,{Request,Response,NextFunction} from 'express';
import {User} from '../schema/User';
import { User_interface } from '../interface/User_interface';
import { SignIn_interface } from '../interface/SignIn_interface';
import { Parser } from '../utilities/Parser';
export class StudentService{
   static async signUp(userInfo:User_interface){
      const newUser:User = new User(userInfo.name,userInfo.email,userInfo.password,userInfo.universityId);
      let result = await newUser.signup();
      let parsedUser = Parser.userParser(result);
      console.log('sssseeeeerrviccccceeeeee');
      return parsedUser;
   }

   static async signIn(userInfo:SignIn_interface){
      let result = await User.signin(userInfo);
      return result;
   }

   static async rentPlace(studentId:number, placeId:number){
      console.log(studentId, placeId);
      let result = await User.rentPlace(studentId, placeId);
      return result;
   }
}