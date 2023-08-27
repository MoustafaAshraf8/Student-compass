import express from 'express';
import { RestaurantController } from '../controller/RestaurantController';
let RestaurantRouter = express.Router();

RestaurantRouter.route("/restaurants/map_page").get(RestaurantController.getlocation);

export {RestaurantRouter};