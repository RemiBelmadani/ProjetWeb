pool = require("...");
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
            "Stock":0
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

        async getOneCategory(Jewel_ID,Jewel_name){ 
        try {
            let conn = await pool.getConnection();
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

    async delOneJewel(Jewel_ID){ 
        try {
            let conn = await pool.getConnection();
            let sql = "UPDATE Jewels SET Jewel_material="Indisponibe", size=NULL, price=NULL, Jewel_name="Victime de son succés", Stone="Indisponible", Jewel_category = "Indisponible",Stock =0 WHERE Jewel_ID=?";
            const okPacket = await conn.query(sql,Jewel_material,size,price,Jewel_name, stone,Jewel_category,Stock,Jewel_ID); //
            conn.end();
            console.log(okPacket);
            return okPacket.affectedRows;
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    },

    async addOnejewel(Jewel_material,size,price,Jewel_name, stone,Jewel_category,Stock,Jewel_ID){ 
        try {
            let conn = await pool.getConnection();
            let sql = "INSERT INTO Jewels (Jewel_material,size,price,Jewel_name, stone,Jewel_category,Stock,Jewel_ID ) VALUES ("NULL",0,0,"NULL","NULL","NULL",0,0);";
            const okPacket = await conn.query(sql,[Jewel_material,size,price,Jewel_name, stone,Jewel_category,Stock,Jewel_ID]); // affectedRows, insertId
            conn.end();
            console.log(okPacket);
            return okPacket.insertId;
        }
        catch (err) {
            console.log(err);
            throw err; 
        }
    },
    async editOnejewel(Jewel_ID, Jewel_material, size, price, Jewel_name, Stone, Jewel_category){ 
        try {
            let conn = await pool.getConnection();
            let sql = "UPDATE Jewels SET Jewel_material="?", size=?, price=?, Jewel_name="?", Stone="?", Jewel_category = "?",Stock =? WHERE Jewel_ID=?;"; // TODO: named parameters? :something
            const okPacket = await conn.query(sql,[Jewel_material, size, price, Jewel_name, Stone, Jewel_category,Stock,Jewel_ID]);
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
