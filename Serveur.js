/*
mkdir controllers models views
npm init -y
npm install express express-session body-parser passport dotenv ejs
>> https://www.npmjs.com/package/body-parser
edit/copy files, then ... node server.js 
*/
//console.log('wolololo');
//return;
/*
console.log('wolololo');


const mysql = require('mysql2/promise');
const conn = mysql.createConnection({
    host:'localhost', user: 'root', database: 'Jewelry', password: 'Ad0f9e83f10', debug: false
});
conn.then(function(conn) {
    conn.execute('SELECT * FROM Jewels').then(function(result){ const [rows, fields]=result; console.log(rows); });
    conn.execute('SELECT * FROM Orders').then(function(result){ const [rows, fields]=result; console.log(rows); });
    conn.execute('SELECT * FROM Users').then(function(result){ const [rows, fields]=result; console.log(rows); process.exit(); });
});
return;
*/

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
    response.send('Hello, dear ${clientIp}. I am a nodejs website...');
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
    //cookie: { maxAge: 1000 60*60*24 }, // 1 day in msec
    resave: false
}));

const auth = require("./utils/usersAuth");
auth.initialization(app);

// app.use(routeBase, callback);
app.use("/static", express.static(__dirname + '/static'));
//app.use("/hello", require("./controllers/hello.route"));
app.use("/Jewels", require("./controllers/jewelsControls"));
app.use("/Users", require("./controllers/usersControllers"));

app.use(express.static(__dirname + '/public'));
app.use('/css', express.static(__dirname + 'public/css'));
app.get('', (req, res) => {
    res.render('home', { text: 'This is EJS'})
});

app.use(express.static('files'));

app.use('/static', express.static('public'));
app.use('/static', express.static(__dirname + '/public'));

