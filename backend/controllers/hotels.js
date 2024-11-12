const { pool } = require("../models/db");

const createHotel = (req, res) => {
  const { name, location, price_per_night, image_url } = req.body;
  console.log(req.body);
  pool
    .query(
      `INSERT INTO hotels (name,location,price_per_night,image_url) VALUES ($1,$2,$3,$4) RETURNING *`,
      [name, location, price_per_night, image_url]
    )
    .then((result) => {
      res.status(202).json({
        success: true,
        message: "Hotel added successfully",
        result: result.rows,
      });
    })
    .catch((err) => {
      res.status(500).json({
        success: false,
        message: "Server error",
        err: err,
      });
    });
};

module.exports = {
  createHotel,
};
