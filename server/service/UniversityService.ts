import express from 'express';
import { University } from '../schema/University';

export class UniversityService{
   static async getAllUniversity(){
      let result = await University.getAllUniversity();
      return result;
   }
}