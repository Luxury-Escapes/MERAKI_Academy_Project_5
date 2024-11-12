const express = require("express");
const { createTour_Packages } = require("../controllers/tourPages");


const tour_packagesRouter = express.Router();



tour_packagesRouter.post("/createTour", createTour_Packages);

module.exports = tour_packagesRouter;