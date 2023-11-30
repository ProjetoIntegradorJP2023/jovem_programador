require('dotenv').config();
const pg = require('pg');
const bodyParser = require('body-parser');
const express = require('express');
const jsonWebToken = require('jsonwebtoken');
const cors = require('cors')

const {Sequelize, DataTypes, Op, where, NOW } = require('sequelize');

const app = express();
app.use(bodyParser.json());
app.use(cors());
const corsOptions = {
  origin: '*',
  methods: ['DELETE', 'PATCH', 'POST', 'GET'],
};

app.use(cors(corsOptions));

const sequelize = new Sequelize({
    dialect: 'postgres',
    database: 'api',
    host: 'localhost',
    username: 'postgres',
    password: '1234'
    
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
    dt_cadastro: {
      type: DataTypes.DATE,
      defaultValue: NOW(),
    },
  });

 


  async function cadastrarUsuario(req, res) {
    const usuario = await Usuario.create({
      id_cidade: req.body.id_cidade,
      cep: req.body.cep,
      nome: req.body.nome,
      dt_nascimento: req.body.dt_nascimento,
      endereco_usuario: req.body.endereco_usuarios,
      bairro_usuario: req.body.bairro_usuario,
      email: req.body.email,
      senha: req.body.senha,
      cpf_cnpj: req.body.cpf_cnpj,
      tipo_usuario: 'U',
      status: 'A',
    });
    res.json(usuario);
  }

  async function cadastrarUsuarioAdm(req, res) {
    const usuario = await Usuario.create({
      id_cidade: req.body.id_cidade,
      cep: req.body.cep,
      nome: req.body.nome,
      dt_nascimento: req.body.dt_nascimento,
      endereco_usuario: req.body.endereco_usuarios,
      bairro_usuario: req.body.bairro_usuario,
      email: req.body.email,
      senha: req.body.senha,
      cpf_cnpj: req.body.cpf_cnpj,
      tipo_usuario: 'M',
      status: 'A',
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
        type: DataTypes.STRING
      },
      unid_medida_produto: {
        type: DataTypes.STRING,
      },
    });
    Usuario.hasMany(Produtos, { foreignKey: 'id' });
    Produtos.belongsTo(Usuario, { foreignKey: 'id_mercado' });



    

    const Cidades = sequelize.define('cidades', {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      nome_cidade: {
        type: Sequelize.STRING,
      },
      sg_estado: {
        type: Sequelize.STRING,
      },
    });

    Usuario.belongsTo(Cidades, {
      foreignKey: {
        name: "id_cidade",
      },
    });


    async function cadastrarProdutos(req, res) {
      const usuario = await Produtos.create({
        id_mercado: 1,
        descricao_produto: req.body.descricao_produto,
        preco_produto: req.body.preco_produto,
        observacao_produto: req.body.observacao_produto,
        marca_produto: req.body.marca_produto,
        peso_produto: req.body.peso_produto,
        imagem: req.body.imagem,
        cod_referencial: req.body.cod_referencial,
        unid_medida_produto: req.body.unid_medida_produto,
      });
      res.json(usuario);
    }

    async function buscarProdutos(req, res) {
      const produtos = await Produtos.findAll();
      res.json(produtos);
    };

    async function deletarCliente(req, res) {
      const cliente = await Usuario.findByPk(req.params.id);
      cliente.destroy();
      res.json({message: 'Cliente excluido com sucesso'});
    }

    async function deltetarProduto(req, res) {
      const produto = await Produtos.findByPk(req.params.id);
      produto.destroy();
      res.json({message: 'Produto excluido com sucesso'});
    }

    async function editarProduto(req, res) {
      try {
        const produto = await Produtos.findByPk(req.params.id);
    
        if (produto) {
          await produto.update({
            descricao_produto: req.body.descricao_produto,
            preco_produto: req.body.preco_produto,
            observacao_produto: req.body.observacao_produto,
            marca_produto: req.body.marca_produto,
            peso_produto: req.body.peso_produto,
            imagem: req.body.imagem,
            cod_referencial: req.body.cod_referencial,
            unid_medida_produto: req.body.unid_medida_produto,
          });
    
          res.json(produto);
        } else {
          res.status(404).json({ error: "Produto não encontrado" });
        }
      } catch (error) {
        console.error("Erro ao atualizar o produto:", error);
        res.status(500).json({ error: "Erro interno do servidor" });
      }
    }
    

async function editarUsuario(req, res) {
  try {
    const usuario = await Usuario.findByPk(req.params.id);
    if (usuario) {
      await usuario.update({
        id_cidade: req.body.id_cidade,
        cep: req.body.cep,
        nome: req.body.nome,
        dt_nascimento: req.body.dt_nascimento,
        endereco_usuario: req.body.endereco_usuarios,
        bairro_usuario: req.body.bairro_usuario,
        email: req.body.email,
        senha: req.body.senha,
        cpf_cnpj: req.body.cpf_cnpj,
        tipo_usuario: req.body.tipo_usuario,
        status: req.body.status,
      });
      res.json(usuario);
    } else {
      res.status(404).json({ error: "Usuário não encontrado" });
    }
  } catch (error) {
    console.error("Erro ao atualizar o usuário:", error);
    res.status(500).json({ error: "Erro interno do servidor" });
  }
}


    app.get('/api/buscarCidadePorCodigo/:codigoCidade', async (req, res) => {
      const codigoCidade = req.params.codigoCidade;
      console.log(codigoCidade)
    
      try {
        // Consulta o banco de dados para buscar o nome da cidade com base no código
        const cidade = await Cidades.findOne({ where: { id: codigoCidade } });
        console.log(cidade)
    
        if (cidade) {
          res.json({ nomeCidade: cidade.nome_cidade, sgEstado: cidade.sg_estado });
        } else {
          res.status(404).json({ mensagem: 'Cidade não encontrada' });
        }
      } catch (error) {
        res.status(500).json({ mensagem: 'Erro ao buscar cidade' });
      }
    });
 
    
    
    

app.post('/cadastrar', cadastrarUsuario);
app.post('/login', login);
//app.use(authMiddleware);
app.get('/buscarClientes', buscarUsuarios);
app.post('/createProdutos', cadastrarProdutos);
app.get('/getProdutos', buscarProdutos);
app.delete('/deleteUsuario/:id', deletarCliente);
app.delete('/deletePrduto/:id', deltetarProduto);
app.patch('/editarProduto/:id', editarProduto);
app.patch('/editarUsuario/:id', editarUsuario);
app.post('/cadastrarAdm', cadastrarUsuarioAdm);

const valores = [];

for (let i = 0; i < 100; i++) {
  const id_mercado = Math.floor(Math.random() * (4 - 1) + 1);
  const descricao_produto = `Produto ${i + 1}`;
  const preco_produto = Math.random() * 100;
  const observacao_produto = `Observação ${i + 1}`;
  const dt_cadastro = new Date();
  const marca_produto = `Marca ${i + 1}`;
  const peso_produto = Math.random() * 10;
  var unid_medida_produto;
  const numero_random = Math.floor(Math.random() * 4);
  if (numero_random == 1) {
    unid_medida_produto = "g";
  } else if (numero_random == 2) {
    unid_medida_produto = "Kg";
  } else if (numero_random == 3) {
    unid_medida_produto = "ml";
  } else if (numero_random == 4) {
    unid_medida_produto = "L";
  }

  valores.push({
    id_mercado,
    descricao_produto,
    preco_produto,
    observacao_produto,
    dt_cadastro,
    marca_produto,
    peso_produto,
    unid_medida_produto,
  });
}


async function buscaProdutos(req, res) {
  const { descricao_produto, id_mercado, sg_estado, id_cidade, marca_produto } =
    req.query;
  try {
    const whereClause = {};

    whereClause.descricao_produto = {
      [Op.like]: `%${descricao_produto}%` || null,
    };

    whereClause.marca_produto = {
      [Op.like]: `%${marca_produto}%` || null,
    };

    if (id_mercado) {
      whereClause.id_mercado = id_mercado;
    }

    const usuariosWhere = {};
    if (id_cidade) {
      usuariosWhere.id_cidade = id_cidade;
    }

    const produtos = await Produtos.findAll({
      where: whereClause,
      include: [
        {
          model: Usuario,
          where: usuariosWhere,
          include: [

          ],
        },
      ],
      limit: 25,
      order: sequelize.col('preco_produto', 'ASC'),
    });

    res.json(produtos);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Erro ao buscar produtos" });
  }
}

//async function buscaMercados (id_cidade) {
async function buscaMercados(req, res) {
  const mercado = await Usuario.findAll({
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