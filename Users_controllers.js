Users.controllers.js

// controllers/auth.route.js
const express = require('express');
const router = express.Router();
const auth = require("/Userss/steveitte/Desktop/L3/Advanced Web programming/Projet web/Code web projet L3/utils/Userss.auth.js");
const UsersRepo = require("/Userss/steveitte/Desktop/L3/Advanced Web programming/Projet web/Code web projet L3/utils/Usersss_Repository.js");

// http://localhost:9000/auth
router.get('/', (req, res) => res.render('auth_view', { extraContent: "" }) );
router.get("/Users", auth.checkAuthentication("Users"), UsersAction);
router.get("/admin", auth.checkAuthentication("ADMIN"), UsersAction);
router.get("/protected", protectedGetAction);
router.post("/login", loginPostAction);
router.get("/logout", logoutAction);

async function UsersAction(request, response) {
  let UsersData = await UsersRepo.getOneUser(request.Users.Users_name);
  let UsersJson = JSON.stringify(UsersData); // if  UsersData.Users_role ...
  response.render("auth_view", { "extraContent": UsersJson });
}

async function protectedGetAction(request, response) {
  if (request.isAuthenticated()) {
    if (request.Users.Users_role === "ADMIN") {
      response.redirect("/auth/admin");
    } else {
      response.redirect("/auth/Users");
    }
  } else {
      response.redirect("/auth");
  }
}

async function loginPostAction(request, response) {
  areValid = await UsersRepo.areValidCredentials(request.body.Users_name, request.body.Users_passwords);

  if (areValid) {
    Users = await UsersRepo.getOneUsers(request.body.Users_name);
    request.login(Users, function (err) { 
        if (err) { console.log("ERROR"); console.log(err); return next(err); }

        if (request.Users.Users_role === "ADMIN") {
            return response.redirect("/auth/admin");
        } else {
            return response.redirect("/auth/Users");
        }
    });
  } else {
    response.send("Invalid credentials provided");
    // TODO redirect/normal error message
  }
}

function logoutAction(request, response) {
    request.logout(function(err) {
        if (err) { return next(err); }
        response.redirect('/auth');
    });
}

module.exports = router;