import express from 'express';
import { StudentController } from '../controller/StudentController';
import { verifyAccessToken } from '../middleware/verifyToken_middleware';
let studentRouter = express.Router();

studentRouter.route("/signup").post(StudentController.signUp);

studentRouter.route("/signin").post(StudentController.signIn);

studentRouter.route("/rent").post(StudentController.rentPlace);

studentRouter.route("/university").patch(verifyAccessToken, StudentController.updateUniversity);

export {studentRouter};