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

    async function authMiddleware(req, res, next) {
      const token = req.headers.authorization;
      try {
        jsonWebToken.verify(token, process.env.JWT_SECRET);
        next();
        } catch (error) {
          res.status(401).send(error.message);
        }
    }

    async function buscarUsuarios(req, res) {
      const usuarios = await Usuario.findAll();
      res.json(usuarios);
    }

    const Produtos = sequelize.define('produtos', {
      id_usuariom: {
        type: DataTypes.INTEGER,
      },
      descricao_produto: {
        type: DataTypes.STRING,
      },
      preco_produto: {
        type: DataTypes.FLOAT,
      },
      observacao_produto: {
        type: DataTypes.STRING,
      },
      marca_produto: {
        type: DataTypes.STRING,
      },
      peso_produto: {
        type: DataTypes.FLOAT,
      },
      imagem: {
        type: DataTypes.STRING,
      },
      cod_referencial: {
        type: DataTypes.INTEGER
      },
    });

    async function cadastrarProdutos(req, res) {
      const usuario = await Produtos.create({
        id_usuariom: req.body.id_usuariom,
        descricao_produto: req.body.descricao_produto,
        preco_produto: req.body.preco_produto,
        observacao_produto: req.body.observacao_produto,
        marca_produto: req.body.marca_produto,
        peso_produto: req.body.peso_produto,
        imagem: req.body.imagem,
        cod_referencial: req.body.cod_referencial,
      });
      res.json(usuario);
    }

    async function buscarProdutos(req, res) {
      const produtos = await Produtos.findAll();
      res.json(produtos);
    };

   




app.post('/cadastrar', cadastrarUsuario);
app.post('/login', login);
app.use(authMiddleware);
app.get('/buscarClientes', buscarUsuarios);
app.post('/createProdutos', cadastrarProdutos);
app.get('/getProdutos', buscarProdutos);