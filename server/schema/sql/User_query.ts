export class UserQuery{

   public static signupQuery(name:string, email:string, password:string){
      const query = `
      begin;
      insert into person (name,email,password) values ('${name}','${email}','${password}');
      insert into client (pid) values((SELECT currval(pg_get_serial_sequence('person','id'))));
      insert into payment (pid) values ((SELECT currval(pg_get_serial_sequence('person','id'))));
      
      select
      person.id as person_id,
      person.name as person_name,
      person.email as person_email,
      client.universityId as client_universityId,
      client.rentalId as client_rentalId
      from person
      inner join client
      on person.id=client.pid
      where person.id=(SELECT currval(pg_get_serial_sequence('person','id')));
      
      commit;`;

      return query;
   }
   
   public static signinQuery(email:string){
      let query = `select
      person.id as person_id,
      person.name as person_name,
      person.email as person_email,
      person.password as person_password
      
      from person
      inner join client
      on person.id=client.pid
      where person.email='${email}';`;

      return query;
   }

   public static updateUniversityQuery(userid:number, universityid:number){

      const query = `update client
      set universityid=${universityid}
      where pid=${userid};`;

      return query;
   }


}