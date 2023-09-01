import { Pharmacy } from "../schema/Pharmacy"

export class PharmacyService{
   static async getAllPharmacy(){
      let result = await Pharmacy.getAllPharmacy();
      return result;
   }
}