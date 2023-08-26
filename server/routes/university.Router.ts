import express, { Router } from 'express'
import { UniversityController } from '../controller/UniversityController';
const universityRouter:Router = express.Router();

universityRouter.route("/").get(UniversityController.getUniversity);
export {universityRouter};