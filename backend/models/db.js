const pg = require('pg');

const pool = new pg.Pool({
   
})

pool.connect().then(()=>{
    console.log("The Database is Run");
    
}).catch((error)=>{
    console.log(error);
    
})

module.exports = pool;
