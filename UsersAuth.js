const passport = require("passport");
const UsersRepo = require("../utils/userRepository.js");

module.exports = {
  initialization(app) {
    app.use(passport.initialize());
    app.use(passport.session());
    passport.serializeUser(function (user, done) {
      done(null, user.Users_name);
    });
    passport.deserializeUser(async function (Users_name, done) {
      let User = await UsersRepo.getOneUser(Users_name);
      done(null,user);
    });
  },

checkAuthentication(Users_role) {
    return function (request, response, next) {
      if (request.isAuthenticated()) {
        if (Users_role) {
          if (Users_role === request.user.Users_role) { 
            return next();
          } else {
            return response.end("401 Unautorized (bad user level)"); // TODO: Hierarchy
          }
        } else { // No special role needed for page -> next middleware
          return next();
        }
      } else {
        return response.end("401 Unautorized (not authenticated)");
        // response.redirect("/auth"); // not authenticated at all
      }
    }
  }
};
