require('dotenv').config();
const pg = require('pg');
const bodyParser = require('body-parser');
const express = require('express');
const jsonWebToken = require('jsonwebtoken');

const {Sequelize, DataTypes} = require('sequelize');

const app = express();
app.use(bodyParser.json());

const sequelize = new Sequelize({
    dialect: 'postgres',
    database: 'projeto_mercado',
    host: 'localhost',
    username: 'postgres',
    password: 'masterkey'
    
  });

  app.listen(3000, async () => {
    await sequelize.authenticate();
    await sequelize.sync({ alter: true });
  });

  const Usuario = sequelize.define('usuario', {
    id_cidade: {
      type: DataTypes.INTEGER,
    },
    cep: {
      type: DataTypes.STRING,
    },
    nome: {
      type: DataTypes.STRING,
    },
    dt_nascimento: {
        type: DataTypes.STRING,
    },
    endereco_usuarios: {
        type: DataTypes.STRING,
    },
    bairro_usuario: {
        type: DataTypes.STRING,
    },
    email: {
        type: DataTypes.STRING,
    },
    senha: {
        type: DataTypes.STRING,
    },
    cpf_cnpj: {
        type: DataTypes.STRING,
    },
    tipo_usuario: {
        type: DataTypes.STRING,
    },
    status: {
        type: DataTypes.STRING,
    },
  });


  async function cadastrarUsuario(req, res) {
    const usuario = await Usuario.create({
      id_cidade: req.body.id_cidade,
      cep: req.body.cep,
      nome: req.body.nome,
      dt_nascimento: req.body.dt_nascimento,
      endereco_usuarios: req.body.endereco_usuarios,
      bairro_usuario: req.body.bairro_usuario,
      email: req.body.email,
      senha: req.body.senha,
      cpf_cnpj: req.body.cpf_cnpj,
      tipo_usuario: req.body.tipo_usuario,
      status: req.body.status,
    });
    res.json(usuario);
  }

  async function login(req, res) {
    const usuario = await Usuario.findOne({
      where: {
        email: req.body.email,
        senha: req.body.senha,
      },
    });
    if (usuario.senha === req.body.senha) {
        const token = jsonWebToken.sign(
          {
            usuario: usuario,
          },
          process.env.JWT_SECRET
        );
        res.json({
          token: token,
        });
      }
    }

app.post('/cadastrar', cadastrarUsuario);
app.post('/login', login);