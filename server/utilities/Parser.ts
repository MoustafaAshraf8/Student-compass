export class Parser{
   public static restaurantParser(restaurant:string): any[]{
      let parsed = JSON.parse(restaurant);
      let result = [];
      for(let i=0;i<parsed.length;i++){
         let restaurant = {
            person_id: parsed[i].person_id,
            person_name: parsed[i].person_name,
            person_email: parsed[i].person_email,
            place_id: parsed[i].place_id,
            place_name: parsed[i].place_name,
            restaurant_description: parsed[i].restaurant_description,
            place_longtitude: parsed[i].place_longtitude,
            place_latitude: parsed[i].place_latitude
         }
         result.push(restaurant);
      }
      return result;
   }

   public static pharmacyParser(pharmacy:string): any[]{
      let parsed = JSON.parse(pharmacy);
      let result = [];

      for(let i=0;i<parsed.length;i++){
         let pharmacy = {
            person_id: parsed[i].person_id,
            person_name: parsed[i].person_name,
            person_email: parsed[i].person_email,
            place_id: parsed[i].place_id,
            place_name: parsed[i].place_name,
            place_longtitude: parsed[i].place_longtitude,
            place_latitude: parsed[i].place_latitude
         }
         result.push(pharmacy);
      }


      return result;
   }

}