import express from'express';
import { RentalHomeController } from '../controller/RentalHomeController';
const rentalHomeRouter:express.Router = express.Router();

rentalHomeRouter.route('/').get(RentalHomeController.getAllRentalHome);


export {rentalHomeRouter};