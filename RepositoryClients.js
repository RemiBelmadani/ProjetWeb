RepositoryClients.js 

pool = require("/Users/steveitte/Desktop/L3/Advanced Web programming/Projet web/Code web projet L3/utils/MySQL.js");

module.exports = {
  async getOneUser(username) {
    try {
      let conn = await pool.getConnection();
      let sql = "SELECT Client_name,Client_mail,Client_phone, Client_address, FROM Clients WHERE Client_ID = ? "; // must leave out the password+hash
      const rows = await conn.query(sql, Client_name);
      conn.end();

      if (rows.length == 1) {
        return rows[0];
      } else {
        return false;
      }
    } catch (err) {
      console.log(err);
      throw err;
    }
  },
  
  /*
  async areValidCredentials(username, password) {
    try {
      let conn = await pool.getConnection();
      let sql = "SELECT * FROM USERS WHERE user_name = ? AND user_pass COLLATE utf8mb4_general_ci  = sha2(concat(user_created, ?), 224) COLLATE utf8mb4_general_ci "; 
      // TODO: better salt+pw hash - COLLATE usually not needed
      const rows = await conn.query(sql, [username, password]);
      conn.end();

      if (rows.length == 1 && rows[0].user_name === username) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      console.log(err);
      throw err;
    }
  }
}; */
