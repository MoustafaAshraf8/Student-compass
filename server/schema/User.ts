import {pool} from '../config/config';
import { User_interface } from '../interface/User_interface';
import { SignIn_interface } from '../interface/SignIn_interface';
export class User{
   private user:User_interface;

   constructor(user:User_interface){
      this.user = user
   }

   public async signup() {
      
      const query = `insert into client
      (pid,universityId)
      values
      (
         (insert into person (name,email,password) values ('${this.user.name}','${this.user.email}','${this.user.password}') returning id;),
         ${this.user.universityId}
      ) returning *;`;
      try{
         let result = await pool.query(query);
         console.log(result.rows);
         return result.rows;
      }catch(error){
         console.log(error);
         return error;
      }
   }

   public static async signin(user:SignIn_interface) {
      
      let query = `select *
      from person
      inner join client on person.id=client.pid
      where person.email='${user.email}' and person.password='${user.password}';`;

      try{
         let answer = await pool.query(query);
         return answer.rows[0];
      }catch(error){
         return {
            msg:error
         }
      }
   }

   public static async rentPlace(studentId:number, placeId:number){
      let query = `update client set rentalId=${placeId} where pid=${studentId} returning *;`
      try{
         let result = await pool.query(query);
         return result;
      }catch(error){
         return {msg:error}
      }
   }

}