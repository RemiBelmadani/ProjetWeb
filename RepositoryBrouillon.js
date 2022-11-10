pool = require("../utils/db.js");
// JS include = relative to CONTROLLERS 
// VIEW include = relative to VIEWS
module.exports = {
    getBlankJewels(){ // defines the entity model
        return {
            "Jewel_ID": 0,
            "Jewel_material": "XXXX",
            "size": 0,
            "price": 0,
            "Jewel_name": "XXXX",
            "Stone": "XXXX",
            "Jewel_category": "XXXX"
        };
    },
    async getAllJewels(){ // TODO? move to brands.repository.js
        try {
            let conn = await pool.getConnection();
            let sql = "SELECT * FROM Jewels";
            const rows = await conn.query(sql);
            conn.end();
            return rows;
        }
        catch (err) {
            // TODO: log/send error ... 
            console.log(err);
            throw err; // return false ???
        }
    },

    /*async getAllCars(){ 
        try {
            let conn = await pool.getConnection();
            let sql = "SELECT * FROM cars INNER JOIN brands ON car_brand=brand_id";
            const rows = await conn.query(sql);
            conn.end();
            console.log("ROWS FETCHED: "+rows.length);
            return rows;
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    },*/

        async getOneCategory(Jewel_ID,Jewel_name){ 
        try {
            let conn = await pool.getConnection();
            // sql = "SELECT * FROM cars INNER JOIN brands ON car_brand=brand_id WHERE car_id = "+carId; // SQL INJECTION => !!!!ALWAYS!!!! sanitize user input!
            // escape input OR prepared statements OR use orm
            let sql = "SELECT Jewel_ID,Jewel_name FROM Jewels WHERE Jewel_category = ?";
            const rows = await conn.query(sql, Jewel_ID, Jewel_name);
            conn.end();
            console.log("ROWS FETCHED: "+rows.length);
            if (rows.length == 1) {
                return rows[0];
            } else {
                return false;
            }
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    },

    async getOneMaterial(Jewel_ID,Jewel_name){ 
        try {
            let conn = await pool.getConnection();
            // sql = "SELECT * FROM cars INNER JOIN brands ON car_brand=brand_id WHERE car_id = "+carId; // SQL INJECTION => !!!!ALWAYS!!!! sanitize user input!
            // escape input OR prepared statements OR use orm
            let sql = "SELECT Jewel_ID,Jewel_name FROM Jewels WHERE Jewel_material = ?";
            const rows = await conn.query(sql, Jewel_ID, Jewel_name);
            conn.end();
            console.log("ROWS FETCHED: "+rows.length);
            if (rows.length == 1) {
                return rows[0];
            } else {
                return false;
            }
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    },

    async getOneCar(carId){ 
        try {
            let conn = await pool.getConnection();
            // sql = "SELECT * FROM cars INNER JOIN brands ON car_brand=brand_id WHERE car_id = "+carId; // SQL INJECTION => !!!!ALWAYS!!!! sanitize user input!
            // escape input OR prepared statements OR use orm
            let sql = "SELECT * FROM cars INNER JOIN brands ON car_brand=brand_id WHERE car_id = ?";
            const rows = await conn.query(sql, carId);
            conn.end();
            console.log("ROWS FETCHED: "+rows.length);
            if (rows.length == 1) {
                return rows[0];
            } else {
                return false;
            }
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    },
    async delOneCar(carId){ 
        try {
            let conn = await pool.getConnection();
            let sql = "DELETE FROM cars WHERE car_id = ?";
            const okPacket = await conn.query(sql, carId); // affectedRows, insertId
            conn.end();
            console.log(okPacket);
            return okPacket.affectedRows;
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    },
    async addOneCar(brandId){ 
        try {
            let conn = await pool.getConnection();
            let sql = "INSERT INTO cars (car_id, car_brand) VALUES (NULL, ?) ";
            const okPacket = await conn.query(sql, brandId); // affectedRows, insertId
            conn.end();
            console.log(okPacket);
            return okPacket.insertId;
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    },
    async editOneCar(carId, carBrand, carName, carBaseprice, carIsfancy, carRealprice){ 
        try {
            let conn = await pool.getConnection();
            let sql = "UPDATE cars SET car_brand=?, car_name=?, car_baseprice=?, car_isFancy=?, car_realPrice=? WHERE car_id=? "; // TODO: named parameters? :something
            const okPacket = await conn.query(sql, 
                        [carBrand, carName, carBaseprice, carIsfancy, carRealprice, carId]);
            conn.end();
            console.log(okPacket);
            return okPacket.affectedRows;
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    }
};
