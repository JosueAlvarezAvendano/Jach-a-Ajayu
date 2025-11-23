var database = require("../database/config")

function pegarDados(idUsuario) {
    console.log("ACESSEI O DADOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", idUsuario)
    var instrucaoSql = `
        SELECT MAX(qtdAcertos) AS maior_acerto, AVG(qtdAcertos) AS media_acertos FROM tentativa where fkUsuario = ${idUsuario};
    `;
    // SELECT qtdAcertos, qtdErros FROM tentativa WHERE fkUsuario = ${idUsuario} ORDER BY idTentativa LIMIT 1;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function pegarRanking() {
    console.log("ACESSEI O DADOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ")
    var instrucaoSql = `
        SELECT u.nome AS nome, MAX(t.porcentagem) AS porcentagem FROM Usuario u JOIN Tentativa t ON u.idUsuario = t.fkUsuario GROUP BY u.idUsuario, u.nome ORDER BY MAX(t.porcentagem) DESC LIMIT 5;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function pegarTentativas(idUsuario) {
    console.log("ACESSEI O DADOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", idUsuario)
    var instrucaoSql = `
        SELECT COUNT(idTentativa) AS qtdTentativas FROM tentativa WHERE fkUsuario = ${idUsuario}; 
    `;
    // SELECT qtdAcertos, qtdErros FROM tentativa WHERE fkUsuario = ${idUsuario} ORDER BY idTentativa LIMIT 1;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function pegarGrafico(idUsuario) {
    console.log("ACESSEI O DADOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", idUsuario);
    var instrucaoSql = `
        SELECT qtdAcertos FROM tentativa WHERE fkUsuario = ${idUsuario} ORDER BY idTentativa DESC LIMIT 5;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    pegarDados,
    pegarRanking,
    pegarTentativas,
    pegarGrafico
};