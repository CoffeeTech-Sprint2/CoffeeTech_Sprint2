var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT idUsuario as id, nome, email, fkEmpresa as empresaId FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, fkEmpresa, telefone, celular) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, fkEmpresa, telefone, celular);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO usuario (nome, email, senha, fkEmpresa, telefone, celular) VALUES ('${nome}', '${email}', '${senha}', ${fkEmpresa} , '${telefone}', '${celular}'   );
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function carregarKpis(){
    var instrucaoSql = `
    SELECT
        MIN(umidade) AS menorUmidade,
        MAX(umidade) AS maiorUmidade,
        ROUND(AVG(umidade), 1) AS mediaUmidade
    FROM leitura
    WHERE DATE(dataHora) = CURDATE();`
    return database.executar(instrucaoSql)
};

function carregarUmidadeAtual(){
    var instrucaoSql = `
    SELECT 
        umidade as umidadeAtual
    FROM leitura
        order by dataHora DESC limit 1`;
    return database.executar(instrucaoSql)
}

function buscarEmpresa(cnpj){
    var buscarEmpresa = `
        select idEmpresa from empresa 
        where cnpj = '${cnpj}' limit 1;
        `;

    console.log("Executando a instrução SQL: \n" + buscarEmpresa);
    return database.executar(buscarEmpresa)
}

// Busca as últimas 9 leituras para montar o gráfico
function carregarGrafico() {
    var instrucaoSql = `
        SELECT
            DATE_FORMAT(dataHora, '%Hh%i') AS hora,  -- formata como "20h00" para o eixo X
            umidade
        FROM (
            -- Subquery: pega as 9 leituras MAIS RECENTES (ordem decrescente)
            SELECT umidade, dataHora
            FROM leitura
            ORDER BY dataHora DESC
            LIMIT 9
        ) AS ultimas
        -- Query externa: reordena da mais antiga para a mais nova,
        -- porque o gráfico precisa da hora mais antiga à esquerda
        ORDER BY dataHora ASC;`;
    return database.executar(instrucaoSql);
}

// Versão atualizada: agora retorna também a hora da última leitura
// function carregarUmidadeAtual() {
//     var instrucaoSql = `
//         SELECT
//             umidade AS umidadeAtual,
//             DATE_FORMAT(dataHora, '%Hh%i') AS horaAtual
//         FROM leitura
//         ORDER BY dataHora DESC
//         LIMIT 1;`;
//     return database.executar(instrucaoSql);
// }


module.exports = {
    autenticar,
    cadastrar,
    carregarUmidadeAtual,
    carregarKpis,
    buscarEmpresa,
    carregarGrafico
};

