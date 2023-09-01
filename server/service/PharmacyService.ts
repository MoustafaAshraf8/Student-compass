import { Pharmacy } from "../schema/Pharmacy"
import { Parser } from "../utilities/Parser";
export class PharmacyService{
   static async getAllPharmacy(){
      let result = await Pharmacy.getAllPharmacy();
      let parsedPharmacy: any[] = Parser.pharmacyParser(result);
      return parsedPharmacy;
   }
}