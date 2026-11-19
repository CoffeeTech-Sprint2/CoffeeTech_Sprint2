var usuarioModel = require("../models/usuarioModel")

var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {
        usuarioModel.autenticar(email, senha)
            .then(function (resultado) {
                console.log(`Resultados encontrados: ${resultado.length}`);

                if (resultado.length == 1) {
                    res.json({
                        id: resultado[0].id,
                        email: resultado[0].email,
                        nome: resultado[0].nome,
                        empresaId: resultado[0].empresaId
                    });
                } else if (resultado.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                } else {
                    res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                }
            })
            .catch(function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var cnpj = req.body.cnpjServer;
    var telefone = req.body.telefoneServer;
    var celular = req.body.celularServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    }else if (telefone == undefined) {
        res.status(400).send("Seu telefone está undefined!");
    }else if (celular == undefined) {
        res.status(400).send("Seu celular está undefined!");
    } else if (cnpj == undefined) {
    res.status(400).send("Seu código de verificação está undefined!");
}else{

        usuarioModel.buscarEmpresa(cnpj)
            .then(function (empresas) {
                if(empresas.length == 0){
                res.status(400).send("Essa empresa não está cadastrada no nosso sistema!");
                return;
                }              

            var fkEmpresa = empresas[0].idEmpresa;

            // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
            return usuarioModel.cadastrar(nome, email, senha, fkEmpresa, telefone, celular)
            .then(function(resultado){
                res.json(resultado);
            
            });
        }).catch(function(erro){
            console.log(erro);
            console.log("\nHouve um erro ao realizar o cadastro! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage)
        })
        
        
        
    }
    
}

function carregarKpis(req, res){
    usuarioModel.carregarKpis()
    .then(function(resultado){
        if(resultado.length > 0){
            res.json(resultado[0]);
        }else{
            res.status(400).send("Nenhuma leitura encontrada!");
        };
    })
    .catch(function(erro){
        console.log(erro)
        res.status(500).json(erro.sqlMessage)
    })
}

module.exports = {
    autenticar,
    cadastrar,
    carregarUmidadeAtual,
    carregarKpis
}