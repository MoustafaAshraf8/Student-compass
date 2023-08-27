import express from 'express';
import { PharmaController } from '../controller/PharmaController';
let PharmaRouter = express.Router();

PharmaRouter.route("/pharma/map_page").get(PharmaController.getlocation);

export {PharmaRouter};