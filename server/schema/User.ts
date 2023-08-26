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
         return result;
      }catch(error){
         console.log(error);
         return error;
      }
   }

   public static signin(user:SignIn_interface) {
      console.log(user);
      return 5;
   }

}