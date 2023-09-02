import express from 'express';
import { University } from '../schema/University';
import { Parser } from '../utilities/Parser';
export class UniversityService{
   static async getAllUniversity(){
      let result = await University.getAllUniversity();
      
      let parsedUniversity = Parser.universityParser(result);
      
      return parsedUniversity;
   }
}