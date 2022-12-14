pool = require("../utils/db.js");

module.exports = {
  async getOneUser(Users_name) {
    try {
      let conn = await pool.getConnection();
      let sql = "SELECT Users_ID, Users_name,Users_mail,Users_phone,Users_address,Users_role, FROM Users WHERE Users_ID = ?,"; // must leave out the password+hash
      const rows = await conn.query(sql, Users_name);
      conn.release();

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
  
  async areValidCredentials(Users_name, password) {
    try {
      let conn = await pool.getConnection();
      let sql = "SELECT * FROM Users WHERE Users_name = ? AND Users_passwords COLLATE utf8mb4_general_ci  = sha2(concat(user_created, ?), 224) COLLATE utf8mb4_general_ci "; 
      // TODO: better salt+pw hash - COLLATE usually not needed
      const rows = await conn.query(sql, [Users_name, password]);
      conn.release();

      if (rows.length == 1 && rows[0].Users_name === Users_name) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      console.log(err);
      throw err;
    }
  }
};
