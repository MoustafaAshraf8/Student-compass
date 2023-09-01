import express from 'express';
import { PharmacyController } from '../controller/PharmacyController';
let pharmacyRouter = express.Router();

pharmacyRouter.route("/").get(PharmacyController.getAllPharmacy);

export {pharmacyRouter};