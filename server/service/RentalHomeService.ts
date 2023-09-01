import {RentalHome} from "../schema/RentalHome";
export class RentalHomeService{
   static async getAllRentalHome(){
      let result = await RentalHome.getAllRentalHome();
      return result;
   }
}