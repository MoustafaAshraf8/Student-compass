import express,{Request,Response,NextFunction} from 'express';
import {User} from '../schema/User';
import { User_interface } from '../interface/User_interface';
import { SignIn_interface } from '../interface/SignIn_interface';
import { Parser } from '../utilities/Parser';
import { JwtClass } from '../utilities/JWT_Class';
export class StudentService{
   static async signUp(userInfo:User_interface){
      const newUser:User = new User(userInfo.name,userInfo.email,userInfo.password,userInfo.universityId);
      let result = await newUser.signup();
      let parsedUser = Parser.userParser(result);
      let accessToken = JwtClass.createAccessToken(parsedUser[0].person_id);
      parsedUser[0].accessToken = accessToken;
      return parsedUser;
   }

   static async signIn(userInfo:SignIn_interface){
      let result = await User.signin(userInfo);
      let parsedUser = Parser.userParser(result);
      let accessToken = JwtClass.createAccessToken(parsedUser[0].person_id);
      parsedUser[0].accessToken = accessToken;
      return parsedUser;
   }

   static async rentPlace(studentId:number, placeId:number){
      console.log(studentId, placeId);
      let result = await User.rentPlace(studentId, placeId);
      return result;
   }

   static async updateUniversity(userId:number, universityId:number){
      let result: String = await User.updateUniversity(userId, universityId);
      return result;
   }

}