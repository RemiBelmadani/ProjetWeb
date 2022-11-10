const MySQL = require("MySQLWorkbench");
const pool = MySQLWorkbench.createPool({
    host: "localhost", user: "root", password: "123Layla", database: "ProjetL3"
});
pool.getConnection().then(function(conn){
    conn.query("SELECT * FROM Clients").then(function(rows){ console.log(rows) });
    conn.query("SELECT * FROM Jewels").then(function(rows){ console.log(rows); process.exit(); });
    conn.query("SELECT * FROM Orders").then(function(rows){ console.log(rows) });
});
return;


const dotenv = require('dotenv');
dotenv.config();

const express = require('express');
const app = express();
app.set("view engine", "ejs");
app.set("views", "views");
app.listen(process.env.WEB_PORT, '0.0.0.0',
    function() { console.log("Listening on "+process.env.WEB_PORT); }
);

app.get('/', (request, response) => { // 'GET' as a HTTP VERB, not as a 'getter'!
    let clientIp = request.ip;
    response.send(`Hello, dear ${clientIp}. I am a nodejs website...`);
    response.end(); // optional
});

// MIDDLEWARE REGISTRATIONS
// app.use(callback1, callback2, callback3)
const bodyParser = require("body-parser");
app.use(bodyParser.json(), bodyParser.urlencoded({ extended: true }));

const session = require("express-session");
app.use(session({
    secret: "SecretRandomStringDskghadslkghdlkghdghaksdghdksh",
    saveUninitialized: true,
    cookie: { maxAge: 1000 * 60 * 60 * 24 }, // 1 day in msec
    resave: false
}));

const auth = require("./utils/users.auth");
auth.initialization(app);

// app.use(routeBase, callback);
app.use("/static", express.static(__dirname + '/static'));
app.use("/hello", require("./controllers/hello.route"));
app.use("/cars", require("./controllers/cars.route"));
app.use("/auth", require("./controllers/auth.route"));
