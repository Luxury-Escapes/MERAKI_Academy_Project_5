const express = require("express");

const { createFlights, bookFlight } = require("../controllers/flights");
const { authentication } = require("../middlewares/authentication");
const flightsRouter = express.Router();
flightsRouter.post("/", createFlights);
flightsRouter.post("/flightBookings", bookFlight);
module.exports = flightsRouter;
