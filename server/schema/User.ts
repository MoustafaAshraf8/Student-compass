import {pool} from '../config/config';
import { User_interface } from '../interface/User_interface';
import { UserQuery } from './sql/User_query';
import { SignIn_interface } from '../interface/SignIn_interface';
import { type } from 'os';
import { Encryptor } from '../utilities/Encryptor';
export class User{
   private name:string;
   private email:string;
   private password:string;
   private universityId:number;

   constructor(name:string,
      email:string,
      password:string,
      universityId:number){
      this.name = name;
      this.email = email;
      this.password = password;
      this.universityId = universityId;
   }

   public async signup() {
      this.password = await Encryptor.hashPassword(this.password);
      const query = UserQuery.signupQuery(this.name, this.email, this.password);
      try{
         let result = await pool.query(query);
         let selectResult = JSON.stringify(Object(result)[4].rows);
         return selectResult;
      }catch(error){
         console.log(error);
         //return {msg:error};
         throw error;
      }
   }

   public static async signin(user:SignIn_interface) {
      
      let query = UserQuery.signinQuery(user.email, user.password);

      try{
         let answer = await pool.query(query);
         console.log('##############');
         console.log(answer);
         console.log('##############');
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