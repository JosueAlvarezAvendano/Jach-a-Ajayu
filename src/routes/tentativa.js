var express = require("express");
var router = express.Router();

var tentativaController = require("../controllers/tentativaController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js


router.post("/registrarTentativa", function (req, res) {
    tentativaController.registrarTentativa(req, res);
})


module.exports = router;