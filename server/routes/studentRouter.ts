import express from 'express';
import { StudentController } from '../controller/studentController';
let studentRouter = express.Router();

studentRouter.route("/signup").post(StudentController.signUp);
studentRouter.route("/signin").post(StudentController.signIn);

export {studentRouter};