import express from 'express';
import { SuppliesController } from '../controller/SuppliesController';
let SuppliesRouter = express.Router();

SuppliesRouter.route("/restaurants/map_page").get(SuppliesController.getlocation);

export {SuppliesRouter};