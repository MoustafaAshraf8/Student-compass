import express from 'express';
import { RestaurantController } from '../controller/RestaurantController';
let restaurantRouter = express.Router();

restaurantRouter.route("/").get(RestaurantController.getAllRestaurant);

export {restaurantRouter};