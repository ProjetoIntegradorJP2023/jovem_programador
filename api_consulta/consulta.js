require("dotenv").config();
const pg = require("pg");
const bodyParser = require("body-parser");
const express = require("express");
const jsonWebToken = require("jsonwebtoken");
const axios = require("axios");
const cors = require("cors");

//npm install dotenv pg body-parser express jsonwebtoken sequelize

const { Sequelize, DataTypes, Op, where, NOW } = require("sequelize");

const app = express();
app.use(bodyParser.json());

//const router = express.Router();
//router.get('/', (req, res) => res.json({ message: 'Funcionando'}));
//router.get('/buscaMercados/:cidade', (req, res) => {
//    const cidade = req.params.cidade;
//    res.json(buscaMercados(cidade));
//})

//app.use('/', router);

const sequelize = new Sequelize({
  dialect: "postgres",
  database: "api",
  host: "localhost",
  username: "postgres",
  password: "JovemP*2023",
});

app.listen(3000, async () => {
  await sequelize.authenticate();
  await sequelize.sync({ alter: true });
});

app.use(cors());

const Usuarios = sequelize.define("usuarios", {
  id_cidade: {
    type: DataTypes.INTEGER,
  },
  cep: {
    type: DataTypes.STRING,
  },
  nome: {
    type: DataTypes.STRING(100),
  },
  dt_nascimento: {
    type: DataTypes.DATE,
  },
  endereco_usuario: {
    type: DataTypes.STRING,
  },
  bairro_usuario: {
    type: DataTypes.STRING,
  },
  email: {
    type: DataTypes.STRING,
  },
  senha: {
    type: DataTypes.STRING(50),
  },
  cpf_cnpj: {
    type: DataTypes.STRING(14),
  },
  tipo_usuario: {
    type: DataTypes.STRING(1),
  },
  status: {
    type: DataTypes.STRING(1),
  },
  dt_cadastro: {
    type: DataTypes.DATE,
    defaultValue: NOW(),
  },
});

const Produto = sequelize.define("produtos", {
  id_mercado: {
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
  dt_cadastro: {
    type: DataTypes.DATE,
  },
  marca_produto: {
    type: DataTypes.STRING,
  },
  peso_produto: {
    type: DataTypes.FLOAT,
  },
  imagem: {
    type: DataTypes.BLOB,
  },
});

const Cidades = sequelize.define("cidades", {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
  },
  uf: {
    type: DataTypes.TEXT(2),
  },
  ds_cidade: {
    type: DataTypes.TEXT,
  },
});

// const valores = [];

// for (let i = 0; i < 100; i++) {
//     const id_mercado = Math.floor(Math.random() * 100);
//     const descricao_produto = `Produto ${i + 1}`;
//     const preco_produto = Math.floor(Math.random() * 10000);
//     const observacao_produto = `Observação ${i + 1}`;
//     const dt_cadastro = new Date();
//     const marca_produto = `Marca ${i + 1}`;
//     const peso_produto = Math.floor(Math.random() * 1000);

//     valores.push({
//         id_mercado,
//         descricao_produto,
//         preco_produto,
//         observacao_produto,
//         dt_cadastro,
//         marca_produto,
//         peso_produto,
//     });
// }
// criarValores()
// async function criarValores() {
//     await Produto.bulkCreate(valores);
// }

async function buscaProdutos(req, res) {
  const { nome, id_mercado, uf, id_cidade, marca } = req.query;
  try {
    const produtos = await Produto.findAll({
      where: {
        descricao_produto: {
          [Op.like]: `%${nome}%`,
        },
        marca_produto: {
          [Op.like]: `%${marca}%`,
        },
        id_mercado: id_mercado,
      },
      include: [
        {
          model: Usuarios,
          where: {
            id_cidade: id_cidade,
          },
          include: [
            {
              model: Cidades,
              where: {
                uf: uf,
              },
            },
          ],
        },
      ],
      limit: 10,
    });

    res.json(produtos);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Erro ao buscar produtos" });
  }
}

//async function buscaMercados (id_cidade) {
async function buscaMercados(req, res) {
  const mercado = await Usuarios.findAll({
    where: {
      [Op.and]: [
        {
          id_cidade: `${req.query.id_cidade}`,
        },
        {
          status: "A",
        },
        {
          tipo_usuario: "M",
        },
      ],
    },
  });
  res.json(mercado);
  //return mercado;
}

app.get("/produtos", buscaProdutos);
app.get("/mercados", buscaMercados);

module.exports = app;