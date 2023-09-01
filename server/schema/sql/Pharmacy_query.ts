export class PharmacyQuery{


   public static getAllPharmacyQuery(){

      const query:string = `
      select person.id as person_id, person.name person_name, person.email person_email, supply_place_business.place_id, supply_place_business.place_name, supply_place_business.place_longtitude, supply_place_business.place_latitude
      from person
      inner join
      (select business.pid as business_id, supply_place.place_id, supply_place.place_name, supply_place.place_longtitude, supply_place.place_latitude
      from business
      inner join
      
      (select place.id as place_id, place.pid as owner_id, place.name as place_name, place.longtitude as place_longtitude, place.latitude as place_latitude
      from pharmacy
      inner join place
      on pharmacy.pid=place.id) supply_place
      
      on supply_place.owner_id=business.pid) as supply_place_business
      
      on person.id=supply_place_business.business_id;`

      return query;
   }


}