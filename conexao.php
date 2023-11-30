<?php 
@$conexao = pg_connect("host=localhost port=5432 dbname=projeto_mercado user=postgres password=masterkey");
pg_set_client_encoding($conexao, 'UNICODE');
?>