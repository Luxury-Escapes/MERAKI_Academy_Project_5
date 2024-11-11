const express = require("express");

const tour_packagesRouter = express.Router();

const { createTour_Packages } = require("../controllers/tourPages");

tour_packagesRouter.post("/createTour", createTour_Packages);

module.exports = tour_packagesRouter;