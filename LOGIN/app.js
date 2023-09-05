require('dotenv').config();
const pg = require('pg');
const bodyParser = require('body-parser');
const express = require('express');
const jsonwebtoken = require('jsonwebtoken');
//const {Sequelize, DataTypes} = require('sequelize');

const app = express();
app.use(bodyParser.json());

app.listen(3000, async () => {
    console.log('Rodando.')
})

async function connect() {
    if (global.connection)
        return global.connection.connect();
 
    const { Pool } = require('pg');
    const pool = new Pool({
        connectionString: process.env.CONNECTION_STRING
    });
 
    //apenas testando a conexão
    const client = await pool.connect();
    console.log("Criou pool de conexões no PostgreSQL!");
 
    // const res = await client.query('select * from cidades where id_cidade = $1', ['1100114']);
    // console.log(res.rows[0]);
    // client.release();
 
    //guardando para usar sempre o mesmo
    global.connection = pool;
    return pool.connect();
}

async function cadastroUsuario(req, res){
    const client = await connect();
    const sqlConsulta = await client.query("select id_usuario from usuarios where email = $1", [req.body.email])

    if (sqlConsulta.rowCount == 0){
        const sql = "INSERT INTO usuarios(id_cidade, cep, nome, dt_nascimento, endereco_usuario, bairro_usuario, email, senha, cpf_cnpj, tipo_usuario, status) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,'U','A');";
        const values = [
            req.body.cidade, 
            req.body.cep, 
            req.body.nome,
            req.body.dt_nascimento,
            req.body.endereco,
            req.body.bairro,
            req.body.email,
            req.body.senha,
            req.body.cpf
        ];
        client.query(sql, values);
        res.json({message: "cadastro realizado"});
    } else {
        res.json({message: "o email informado já existe!"});
    }
}

async function login(req, res){
    const client = await connect();
    const sqlConsulta = await client.query("select id_usuario from usuarios where email = $1 and senha = $2", [req.body.email, req.body.senha]);

    if (sqlConsulta.rowCount === 1) {
        res.json({message: "login efetuado com sucesso."})
    } else {
        res.json({message: "algum parâmetro informado está incorreto, tente novamente."})
    }
}

app.post('/cadastrar', cadastroUsuario);
app.post('/login', login);