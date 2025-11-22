var tentativaModel = require("../models/tentativaModel");

function registrarTentativa(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var idTentativa = req.body.idTentativaServer;
    var fkUsuario = req.body.fkUsuarioServer;
    var fkQuiz = req.body.fkQuizServer;
    var certas = req.body.certasServer;
    var erradas = req.body.erradasServer;
    var porcentagem = req.body.porcentagemServer; /* COMENTAR */

    // Faça as validações dos valores
    if (fkUsuario == undefined) {
        res.status(400).send("Seu fkUsuario está undefined!");
    } else if (fkQuiz == undefined) {
        res.status(400).send("Seu fkQuiz está undefined!");
    } else if (certas == undefined) {
        res.status(400).send("Sua certas está undefined!");
    } else if (erradas == undefined) {
        res.status(400).send("Sua erradas está undefined!");
    } else if (porcentagem == undefined) { /* COMENTAR */
        res.status(400).send("Sua porcentagem está undefined!")
    } else if (idTentativa == undefined) {
        res.status(400).send("Sua idTentativa está undefined!")
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        tentativaModel.registrarTentativa(idTentativa, fkUsuario, fkQuiz, certas, erradas, porcentagem)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o Registro da Tentativa! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    registrarTentativa
}