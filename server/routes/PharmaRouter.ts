import express from 'express';
import { PharmaController } from '../controller/PharmaController';
let pharmaRouter = express.Router();

pharmaRouter.route("/pharma/map_page").get(PharmaController.getlocation);

export {pharmaRouter};