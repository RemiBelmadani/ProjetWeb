const express = require('express');
const router = express.Router();
const JewelRepo = require('../utils/repositoryJewels.js');
router.get('/', JewelRootAction);
router.get('/list', JewelListAction);
router.get('/show/:Jewel_ID', JewelShowAction);
//router.get('/del/:Jewel_ID', JewelDelAction);
router.get('/edit/:Jewel_ID', JewelEditAction);
router.post('/update/:Jewel_ID', JewelUpdateAction);

function JewelRootAction(request, response) {
    //response.send("ROOT ACTION");
    response.redirect("/Jewels/list");
}
async function JewelListAction(request, response) {
    // response.send("LIST ACTION");
    var Jewels = await JewelRepo.getAllJewels();
    // console.log(cars);
    var flashMessage = request.session.flashMessage;
    request.session.flashMessage = "";
    response.render("Jewels_list", { "Jewels": Jewels, "flashMessage": flashMessage });
}
async function JewelShowAction(request, response) {
    // response.send("SHOW ACTION");
    var oneJewel = await JewelRepo.getOneJewel(request.params.Jewel_ID);
    response.render("Jewel_show", { "oneJewel": oneJewel });
}
async function JewelEditAction(request, response) {
    // response.send("EDIT ACTION");
    var AllJewels = await JewelRepo.getAllJewels();
    var Jewel_ID = request.params.Jewel_ID;
    if (Jewel_ID!=="0")
        var Jewels = await JewelRepo.getOneJewel(Jewel_ID);
    else
        var Jewels = JewelRepo.getBlankJewels();
    response.render("Jewel_edit", { "Jewel": Jewel_ID, "Name": Jewel_name });
}
/*
async function JewelDelAction(request, response) {
    // response.send("DEL ACTION");
    // TODO: remove extras for car, unless the car cannot be removed!!!
    var numRows = await JewelRepo.delOneCar(request.params.Jewel_ID);
    request.session.flashMessage = "ROWS DELETED: "+numRows;
    response.redirect("/cars/list");
}*/ 

async function JewelUpdateAction(request, response) {
    // response.send("UPDATE ACTION");
    var Jewel_ID = request.params.Jewel_ID;
    if (Jewel_ID==="0") Jewel_ID = await JewelRepo.addOneJewel(request.body.Jewel_name);
    // var isFancy = request.body.car_isFancy === undefined ? 0 : 1; 
    var numRows = await JewelRepo.editOneJewel(
        Jewel_ID, 
        request.body.Jewel_material, 
        request.body.size, 
        request.body.price, 
        request.body.Jewel_name,
        request.body.Stone,
        request.body.Jewel_category);
    request.session.flashMessage = "ROWS UPDATED: "+numRows;
    response.redirect("/Jewels/list");
}
module.exports = router;
