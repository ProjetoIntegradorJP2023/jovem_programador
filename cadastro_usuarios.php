<!DOCTYPE html>
<html lang="en">
<head>
<style>
  .minhaDiv {
    display: none;
  }
</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Economizando</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" type="text/css" href="styles1.css" />
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<?php include "conexao.php"; ?>
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
         <!-- <i class="far fa-comments"></i>-->
          <img src="img/person-circle.svg" alt="" width="37px">
          <!--<span class="badge badge-danger navbar-badge">3</span>-->
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-white-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="img/shop.svg" alt="AdminLTE Logo" classs="brand-image img-circle elevation-3" style="opacity: .8" height="50" width="50">
      <span class="brand-text font-weight-light">&nbsp;&nbsp;&nbsp;<b>ECONOMIZANDO</b></span>
    </a>
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-header">_______________________________</li>
          <li class="nav-item">
            <a href="consulta_produtos.html" class="nav-link">
              <img src="img/currency-dollar.svg" alt="">
              <p>Consultar Preço</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <img src="img/basket.svg" alt="">
              <p>
                Produtos
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="cadastro_produtos.html" class="nav-link">
                  <i class="far nav-icon"></i>
                  <img src="img/pencil.svg" alt="">
                  <p>Cadastrar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="lista_produtos.html" class="nav-link">
                  <i class="far nav-icon"></i>
                  <img src="img/list-ul.svg" alt="">
                  <p>Lista de produtos</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <img src="img/gear.svg" alt="">
              <p>
                Painel Administrativo
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="cadastro_usuarios.php" class="nav-link">
                  <i class="far nav-icon"></i>
                  <img src="img/pencil.svg" alt="">
                  <p>Novo Cadastro</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="lista_cadastros.html" class="nav-link">
                   <i class="far nav-icon"></i>
                   <img src="img/list-ul.svg" alt="">
                  <p>Lista de Cadastros</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <div class="content-wrapper">
    <!-- /.card-header -->
    <div class="card card-primary">
      <div class="card-header">
        <h3 class="card-title">USUARIOS</h3>
      </div>
      <!-- /.card-header -->
      <!-- form start -->
      <form id="formsUsuario">
        <div class="card-body">
        <div class="form-group minhaDiv">
            <label for="exampleInputEmail1">Id</label>
            <input type="text" class="form-control" id="id" placeholder="Nome">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Nome</label>
            <input type="text" class="form-control" id="nome" placeholder="Nome">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Email</label>
            <input type="email" class="form-control" id="email" placeholder="Email">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Senha</label>
            <input type="password" class="form-control" id="senha" placeholder="Senha">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Nascimento</label>
            <input type="date" class="form-control" id="nascimento" placeholder="Nascimento">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">CEP</label>
            <input type="text" class="form-control" id="cep" placeholder="cep">
          </div>
          <div class="form-group">
          <label for="exampleInputEmail1">Cidade</label>
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
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Bairro</label>
            <input type="text" class="form-control" id="bairro" placeholder="Bairro">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Endereço</label>
            <input type="text" class="form-control" id="endereco" placeholder="Endereço">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">CFP/CNPJ</label>
            <input type="text" class="form-control" id="cpf_cnpj" placeholder="CPF/CNPJ" maxlength="18">
          </div>
        </div>
        <!-- /.card-body -->

        <div class="card-footer">
          <button type="submit" class="btn btn-primary">Cadastrar</button>
          <a href="lista_cadastros.html">
          <input type="" class="btn btn-primary" value="Ver Lista">
          </a>  
        </div>

      </form>
    </div>
    <!-- /.card-body -->
  </div>
  </div>
 
  <footer class="main-footer">

  </footer>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
</body>

<script>
  function preecherForulario(usuario) {
    document.getElementById("nome").value = usuario.nome;
    document.getElementById('email').value = usuario.email;
    document.getElementById('senha').value = usuario.senha;
    document.getElementById('nascimento').value = usuario.dt_nascimento;
    document.getElementById('cep').value = usuario.cep;
    document.getElementById('cidade').value = usuario.id_cidade;
    document.getElementById('bairro').value = usuario.bairro_usuario;
    document.getElementById('endereco').value = usuario.endereco_usuarios;
    document.getElementById('cpf_cnpj').value = usuario.cpf_cnpj;
  };

  function usuarioFormulario() {
    return {
      nome: document.getElementById('nome').value,
      email: document.getElementById('email').value,
      senha: document.getElementById('senha').value,
      dt_nascimento: document.getElementById('nascimento').value,
      cep: document.getElementById('cep').value,
      id_cidade: document.getElementById('cidade').value,
      bairro_usuario: document.getElementById('bairro').value,
      endereco_usuarios: document.getElementById('endereco').value,
      cpf_cnpj: document.getElementById('cpf_cnpj').value
    }
  };

  async function cadastrarUsuario(usuario) {
    const resposta = await fetch('http://localhost:3000/cadastrarAdm', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(usuario),
    });
    const respostaJson = await resposta.json();
    alert('Cliente cadastrado com sucesso')
    window.location.reload();
  }

  //EDIÇÃO
  async function editarUsuario(id, data) {
    const resposta = await fetch(`http://localhost:3000/editarUsuario/${id}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data),
    });
    const respostaJson = await resposta.json();
    alert('Cliente editado com sucesso')
    window.location.href = 'lista_cadastros.html';
  }
  //FIM EDIÇÃO

  document.getElementById('formsUsuario').addEventListener('submit', function(event){
    event.preventDefault();

    const usuario = usuarioFormulario();
    cadastrarUsuario(usuario);
  })

  //EDIÇÃO
document.getElementById('buttonEditar').addEventListener('click', function (event) {
  event.preventDefault();

  const idUsuario = document.getElementById("id").value;
  const id_cidade = document.getElementById("cidade").value;
  const cep = document.getElementById("cep").value;
  const nome = document.getElementById("nome").value;
  const dt_nascimento = document.getElementById("nascimento").value;
  const endereco_usuarios = document.getElementById("endereco").value;
  const bairro_usuario = document.getElementById("bairro").value;
  const email = document.getElementById("email").value;
  const senha = document.getElementById("senha").value;
  const cpf_cnpj = document.getElementById("cpf_cnpj").value;
  const data = {
    id: idUsuario,
    id_cidade: id_cidade,
    cep: cep,
    nome: nome,
    dt_nascimento: dt_nascimento,
    endereco_usuarios: endereco_usuarios,
    bairro_usuario: bairro_usuario,
    email: email,
    senha: senha,
    cpf_cnpj: cpf_cnpj,
  };
  console.log(data);
  editarUsuario(idUsuario, data);
});
  //FIM EDIÇÃO

//FORMATAÇÃO DO INPUT CEP
 const cepInput = document.getElementById('cep');
 cepInput.addEventListener('input', function() {
      let value = cepInput.value.replace(/\D/g, '');
      if (value.length > 5) {
        value = value.slice(0, 5) + '-' + value.slice(5, 8);
      }
      cepInput.value = value;
    });

//FORMATAÇÃO INPUT CPF/CNPJ
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


document.addEventListener('DOMContentLoaded', function() {
    console.log('OK')
    const clienteParaEdicao = localStorage.getItem('clienteParaEdicao');
    if (clienteParaEdicao) {
      const clientes = JSON.parse(clienteParaEdicao);
      preencherCampos(clientes);
    }
  });

function preencherCampos(cliente) {
    document.getElementById('id').value = cliente.id;
    document.getElementById('nome').value = cliente.nome;
    document.getElementById('email').value = cliente.email;
    document.getElementById('senha').value = cliente.senha;
    document.getElementById('nascimento').value = cliente.dt_nascimento;
    document.getElementById('cep').value = cliente.cep;
    document.getElementById('cidade').value = cliente.id_cidade;
    document.getElementById('bairro').value = cliente.bairro_usuario;
    document.getElementById('endereco').value = cliente.endereco_usuarios;
    document.getElementById('cpf_cnpj').value = cliente.cpf_cnpj;
    localStorage.removeItem('clienteParaEdicao');
  }

</script>
</html>
