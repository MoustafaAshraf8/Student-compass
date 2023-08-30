import express from 'express';
import { StudentController } from '../controller/StudentController';
let studentRouter = express.Router();

studentRouter.route("/signup").post(StudentController.signUp);

studentRouter.route("/signin").post(StudentController.signIn);

studentRouter.route("/rent").post(StudentController.rentPlace);

export {studentRouter};