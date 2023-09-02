export class UniversityQuery{

   public static getAllUniversity(){
      const query = `
      select
      university.id as university_id,
      university.name as university_name,
      university.longtitude as university_longtitude,
      university.latitude as university_latitude
      
      from university;`;

      return query;
   }

}