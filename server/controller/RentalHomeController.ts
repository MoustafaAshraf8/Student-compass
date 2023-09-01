import {Request,Response,NextFunction} from "express";
import {RentalHomeService} from "../service/RentalHomeService";

export class RentalHomeController{
    static async getAllRentalHome(req:Request,res:Response,next:NextFunction){
        let result = await RentalHomeService.getAllRentalHome();
        console.log(Array(result)[0]);
        res.statusCode = 200;
        res.json(result);
    }
}