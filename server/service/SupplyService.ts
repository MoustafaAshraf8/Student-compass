import express,{Request,Response,NextFunction} from 'express';
import { Supply } from '../schema/Supply';
export class SupplyService{
   static async getAllSupply(){
      let result = await Supply.getAllSupply();
      return result;
   }
}