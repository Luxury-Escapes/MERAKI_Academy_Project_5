const express = require("express");

require("dotenv").config();

const db = require('./models/db');
const app = express();
const PORT = 5000;


app.use(express.json());


app.listen(PORT , ()=>{
    console.log(`Server is run at https://localhost:${PORT}`);
    
})