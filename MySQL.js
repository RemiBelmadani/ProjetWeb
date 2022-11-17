MySQL.js
// utils/db.js

const MySQL = require("MySQL");

const pool = MySQL.createPool({
    host: process.env.localhost,
    user: process.env.root,
    password: process.env.123Layla,
    database: process.env.ProjetL3
});

module.exports = {
   getConnection(){
       return new Promise(function(result, reject){
           pool.getConnection().
           then(function(conn){
              result(conn);
           }).
           catch(function(error){
               reject(error);
           });
       });
       // return pool.GetConnection();
   }
};
