<!DOCTYPE html>
<html lang="en">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php include "conexao.php"; ?>


<link rel="stylesheet" type="text/css" href="styles.css" />
<!------ Include the above in your HEAD tag ---------->

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="img/people.svg" id="icon" alt="User Icon" width="70" height="70"/>
    </div>

    <!-- Login Form -->
    <form id="formCliente">
      <br>
      <input type="text" id="nome" class="fadeIn second" name="nome" placeholder="Nome">
      <input type="text" id="cpf_cnpj" class="fadeIn third" name="cpf_cnpj" placeholder="CFP/CNPJ" maxlength="18
      ">
      <input type="email" id="email" class="fadeIn third" name="email" placeholder="Email">
      <input type="password" id="senha" class="fadeIn third" name="senha" placeholder="Senha">
      <input type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="dt_nascimento" class="fadeIn third" name="dt_nascimento" placeholder="Data Nascimento">
      <input type="text" id="cep" class="fadeIn third" name="cep" placeholder="CEP" oninput="formatarCEPInput()">
      <select id="cidade" name="cidade" required class="fadeIn third">
        <option value="" selected>Selecione sua cidade</option>
            <?php
                $select = "SELECT id_cidade, nome_cidade
                FROM cidades 
                ORDER BY nome_cidade";
                    
                $resultado = pg_query($conexao, $select);
                while ($linha = pg_fetch_array($resultado)){
                    $idcidade = $linha[0];
                    $nomecidade = $linha[1];
                    echo "<option value='$idcidade'>$nomecidade</option>";
                }
            ?>
      </select><br>
      <input type="text" id="bairro" class="fadeIn third" name="bairro" placeholder="Bairro">
      <input type="text" id="endereco" class="fadeIn third" name="endereco" placeholder="Endereço"><br><br>
      <input type="submit" class="fadeIn fourth" value="Cadastrar" href="index.html">
     
    </form>
    <a href="index.html"><input type="submit" class="fadeIn fourth" value="Já tenho Cadastro" href="index.html"></a>


  </div>
</div>
</body>
<script>
  
  function preecherForulario(cliente) {
    document.getElementById("nome").value = cliente.nome;
    document.getElementById("cpf_cnpj").value = cliente.cpf_cnpj;
    document.getElementById("email").value = cliente.email;
    document.getElementById("senha").value = cliente.senha;
    document.getElementById("dt_nascimento").value = cliente.dt_nascimento;
    document.getElementById("cep").value = cliente.cep;
    document.getElementById("cidade").value = cliente.id_cidade;
    document.getElementById("bairro").value = cliente.bairro_usuario;
    document.getElementById("endereco").value = cliente.endereco_usuarios;
  };

  function clienteDoFormulario(cliente) {
    return{
    nome: document.getElementById("nome").value,
    cpf_cnpj: document.getElementById("cpf_cnpj").value,
    email: document.getElementById("email").value,
    senha: document.getElementById("senha").value,
    dt_nascimento: document.getElementById("dt_nascimento").value,
    cep: document.getElementById("cep").value,
    id_cidade: document.getElementById("cidade").value,
    bairro_usuario: document.getElementById("bairro").value,
    endereco_usuarios: document.getElementById("endereco").value
    }
  };

  async function cadastrarCliente(cliente) {
    console.log(cliente)
    const resposta = await fetch('http://localhost:3000/cadastrar', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(cliente),
    });
    const respostaJson = await resposta.json();
    console.log(respostaJson)
    alert('Usuário Cadastrado com sucesso')
    window.location.href = "index.html"

  }



  document.getElementById('formCliente').addEventListener('submit', function(event){
      const cliente = clienteDoFormulario()
      cadastrarCliente(cliente);
      
  });

//FORMATAÇÃO DO INPUT CEP
 const cepInput = document.getElementById('cep');
 cepInput.addEventListener('input', function() {
      let value = cepInput.value.replace(/\D/g, '');
      
      if (value.length > 5) {
        value = value.slice(0, 5) + '-' + value.slice(5, 8);
      }
      
      cepInput.value = value;
    });

//FORMATAÇÃO IMPUT CPF/CNPJ
const cpfCnpjInput = document.getElementById('cpf_cnpj');

cpfCnpjInput.addEventListener('input', function() {
  let value = cpfCnpjInput.value.replace(/\D/g, '');

  if (value.length <= 11) {
    value = value.replace(/(\d{3})(\d{3})(\d{3})(\d{0,2})/, '$1.$2.$3-$4');
  } else {
    value = value.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, '$1.$2.$3/$4-$5');
  }

  cpfCnpjInput.value = value;
});

</script>
</html>

