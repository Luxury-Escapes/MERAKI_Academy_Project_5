const express = require("express");
const cors = require("cors");
require("dotenv").config();

require("./models/db");

const app = express();

//built-in middleware
app.use(express.json());
app.use(cors());

const PORT =  5000;

app.use(express.json());
//required userRoter 
const userRouter = require('./routes/users');
app.use('/user',userRouter);
//required roleRoter 
const roleRoter = require('./routes/roles');

app.use('/role' , roleRoter);
const tour_packagesRouter = require('./routes/tourPagesRoute');
app.use('/Tour',tour_packagesRouter);

app.listen(PORT, () => {
  console.log(`Server is run at https://localhost:${PORT}`);
});
