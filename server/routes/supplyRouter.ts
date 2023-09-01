import express from 'express';
import { SupplyController } from '../controller/SupplyController';
let supplyRouter = express.Router();

supplyRouter.route("/").get(SupplyController.getAllSupply);

export {supplyRouter};