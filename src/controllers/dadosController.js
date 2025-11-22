var dadosModel = require("../models/dadosModel");


function pegarDados(req, res) {
    var idUsuario = req.params.idUsuario;

    dadosModel.pegarDados(idUsuario)
        .then((resultado)=>{
    
            if (resultado.length == 1) {
                console.log(resultado);
    
                res.status(200).send(resultado[0]);
    
            } else {
                res.status(204).json([])
            }
        }

        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );

}

function pegarRanking(req, res) {

    dadosModel.pegarRanking()
        .then((resultado)=>{
    
            if (resultado.length > 0) {
                console.log(resultado);
    
                res.status(200).send(resultado);

            } else {
                res.status(204).json([])
                
            }
        }

        ).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );


}


module.exports = {
    pegarDados,
    pegarRanking
}