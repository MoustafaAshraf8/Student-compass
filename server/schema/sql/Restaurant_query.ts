export class RestaurantQuery{
   public static getAllRestaurantQuery(){

      const query:string = `
      select person.id as person_id, person.name person_name, person.email person_email, restaurant_place_business.place_id, restaurant_place_business.place_name, restaurant_place_business.restaurant_description, restaurant_place_business.place_longtitude, restaurant_place_business.place_latitude
      from person
      inner join
      (select business.pid as business_id, restaurant_place.place_id, restaurant_place.place_name, restaurant_place.restaurant_description, restaurant_place.place_longtitude, restaurant_place.place_latitude
      from business
      inner join
      
      (select place.id as place_id, place.pid as owner_id, place.name as place_name, restaurant.description as restaurant_description, place.longtitude as place_longtitude, place.latitude as place_latitude
      from restaurant
      inner join place
      on restaurant.pid=place.id) restaurant_place
      
      on restaurant_place.owner_id=business.pid) as restaurant_place_business
      
      on person.id=restaurant_place_business.business_id;`

      return query;
   }


}