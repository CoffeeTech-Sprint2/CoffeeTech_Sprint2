var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.get("/carregarKpis", function (req, res){
    usuarioController.carregarKpis(req, res)
})

router.get("/carregarUmidadeAtual", function (req, res){
    usuarioController.carregarUmidadeAtual(req, res)
})

router.get("/carregarGrafico", function (req, res){
    usuarioController.carregarGrafico(req, res)
})
module.exports = router;