var express = require("express");
var router = express.Router();

var dadosController = require("../controllers/dadosController");

router.get("/pegarDados/:idUsuario", function (req, res) {
    dadosController.pegarDados(req, res);
});

router.get("/pegarRanking", function (req, res) {
    dadosController.pegarRanking(req, res);
});

router.get("/pegarTentativas/:idUsuario", function (req, res) {
    dadosController.pegarTentativas(req, res);
});

module.exports = router;