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

   public static universityParser(university:string): any[]{
      let parsed = JSON.parse(university);
      let result = [];

      for(let i=0;i<parsed.length;i++){
         let university = {
            university_id: parsed[i].university_id,
            university_name: parsed[i].university_name,
            university_longtitude: parsed[i].university_longtitude,
            university_latitude: parsed[i].university_latitude
         }
         result.push(university);
      }
      return result;
   }

   public static userParser(user:string): any[]{
      let parsed = JSON.parse(user);
      let result = [];

      for(let i=0;i<parsed.length;i++){
         let user = {
            person_id: parsed[i].person_id,
            person_name: parsed[i].person_name,
            person_email: parsed[i].person_email,
            client_universityid: parsed[i].client_universityid,
            client_rentalid: parsed[i].client_rentalid
         }
         result.push(user);
      }
      return result;
   }


}