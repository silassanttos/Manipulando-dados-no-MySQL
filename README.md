DML e DQL

<!DOCTYPE html>
<html>
<head>
</head>
<body>

<h1># Manipulando-dados-no-MySQL </h1>
  <p>Data Manipulation Language <i>Linguagem de Manipulação de Dados</i>(DML)</p>
  
![image](https://user-images.githubusercontent.com/69328711/163718565-c6c085f0-a847-488f-ac86-59ee75cd7b9b.png)

  <p>Para acessar o script do banco de dados utilizado, <a href="https://github.com/silassanttos/curso_sql" target="_blank">clique aqui</a></p>
  
  <h2> 1 - Inserção de dados na tabela funcionários</h2>
INSERT INTO FUNCIONARIOS  (ID, NOME, SALARIO, DEPARTAMENTO) VALUES(1, 'FERNANDO', 1400, 'TI');    <br>
INSERT INTO FUNCIONARIOS  (NOME, SALARIO, DEPARTAMENTO)     VALUES('GUILHERME', 2500, 'JÚRIDICO');    <br>
INSERT INTO FUNCIONARIOS  (NOME, SALARIO, DEPARTAMENTO)     VALUES('FABIO', 1700, 'TI');              <br>
INSERT INTO FUNCIONARIOS  (NOME, SALARIO, DEPARTAMENTO)     VALUES('JOSE', 1800, 'MARKETING');        <br>
INSERT INTO FUNCIONARIOS  (NOME, SALARIO, DEPARTAMENTO)     VALUES('ISABELA', 2200, 'JÚRIDICO');      <br>
  
  <h2> 2 - Declarando SELECT'S para retornar conjunto de resultados dos registros que foram realizado na tabela Funcionarios.</h2>
 
  <li>SELECT * FROM FUNCIONARIOS;</li>
  <i> Comando retorna todos os registrados na tabela funcionarios.</i>
  
![image](https://user-images.githubusercontent.com/69328711/163718599-636bee89-6d2d-4470-9c79-38853a9a14f5.png)

 <hr> 
  <li>SELECT * FROM FUNCIONARIOS WHERE SALARIO > 2000; </li>
   <i> Comando retorna todos os registrados na tabela funcionarios onde o salário seja maior que 2.000.</i>
  
![image](https://user-images.githubusercontent.com/69328711/163718755-3796a4af-8738-468d-b2fc-579a148939bc.png)
  
 <hr>
  <li>SELECT * FROM FUNCIONARIOS WHERE NOME = 'JOSE';</li>
  <i>Retorna registro da tabela funcionários onde na coluna nome tenha cadastro igual com nome igual a josé</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163719104-484c1589-cf21-41b0-8304-313c76fef57f.png)

  <hr>
   <li>SELECT * FROM FUNCIONARIOS WHERE ID = 3;</li>
  <i>Retorna da tabela funcionarios o funcionario onde o seu ID seja 3</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163719123-38a37000-8b5d-4de3-880b-dc6f11a9cb03.png)

  <hr>
  <li> UPDATE FUNCIONARIOS SET SALARIO = SALARIO * 1.1;</li>
  <i>O comando ira alterar a coluna salário, sendo que os funcionários receberão um aumento de 10%:</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163721074-d61ec994-cd57-4eb6-bf6d-d8b749c47863.png)
  
  <hr>
  <li>UPDATE FUNCIONARIOS SET SALARIO = SALARIO * 1.1 WHERE ID = 2;</li>
  <i>Diferente do comando anterior somente o funcionário que possui o seu ID = 2 receberá um aumento de 10%:</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163721152-5b32367a-ec4b-40c0-947e-d062d8091615.png)

  <hr>
  <li>SET SQL_SAFE_UPDATES =0; </li>
  <i>Instrução SQL para liberar atualização da tabela sem precisar liberar informação do ID</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163721174-8eb3e545-af62-47f1-9472-e2643675867a.png)
 
  <hr>
  <li>UPDATE FUNCIONARIOS SET SALARIO = ROUND(salario * 1.1, 2);</li>
<i>Instrução para aredondar as casas decimais em ROUND o numero dois indica que sera mostrado a quantidade de casas decimais depois da virgula.</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163721307-1e70fbce-0bbf-432d-99a9-a345fa9a6f59.png)

  <hr>
  <li>DELETE FROM FUNCIONARIOS WHERE ID=4;</li>
<i>Comando ira deletar o funcionario cujo seu ID seja 4</i>
   Antes do comando:
  
  ![image](https://user-images.githubusercontent.com/69328711/163721397-f46008fc-9b3c-43bd-9005-4310569ecd45.png)
  
  Execução do comando:
  
  ![image](https://user-images.githubusercontent.com/69328711/163721414-86134e48-4930-4e6b-b729-c9017565152b.png)

 Após execusão do comando:
  
![image](https://user-images.githubusercontent.com/69328711/163721791-2712ced3-df61-462a-a975-f1b4c03567a7.png)
 <hr>
  
  <h1>Manipulação na tabela veiculos</h1>

  <h2> 1 - Inserção de dados na tabela veiculos</h2>
INSERT INTO VEICULOS (FUNCIONARIO_ID, VEICULO, PLACA) VALUES(1,'Carro', 'SB-0001'); <br>
INSERT INTO VEICULOS (FUNCIONARIO_ID, VEICULO, PLACA) VALUES(1,'Carro', 'SB-0002'); <br>
  
![image](https://user-images.githubusercontent.com/69328711/163722246-9e22ded2-1318-4160-9c89-ca9b12cfc0fc.png)

  <li>UPDATE veiculos SET funcionario_id = 5 WHERE id = 2;</li>
<i>Atualizando a tabela veiculos, Alterando o veiculo do funcinario Fernando cujo id seja 2 e passando para Funcionária Isabela cujo chave estrangeira da tabela funcionarios é 5</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163722288-c36ca486-1e55-4e4d-a928-7133b89cd154.png)

  <h1>Manipulando tabela Salário </h1>
  
INSERT INTO SALARIOS(FAIXA, INICIO, FIM) VALUES('Analista Jr', 1000, 2000); <br>
INSERT INTO SALARIOS(FAIXA, INICIO, FIM) VALUES('Analista Pleno', 2000, 4000); <br>
  
  ![image](https://user-images.githubusercontent.com/69328711/163722350-8b84b67e-3aa5-4960-af98-67e08cfc1458.png)
  
 <hr>
<li>SELECT NOME AS FUNCIONÁRIO, SALARIO FROM FUNCIONARIOS WHERE FUNCIONARIOS.SALARIO > 2000;</li>
<i>Mostrando coluna nome sob apelido de 'FUNCIONARIO' usando alias(AS) e a coluna salario, Onde os salarios for maior que 2000</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163722464-aff65ede-c5b9-4a18-97a2-bb70b1f3bb8c.png)

  
<li>
<br> SELECT * FROM FUNCIONARIOS WHERE NOME = 'GUILHERME' <br>
UNION <br>
SELECT * FROM FUNCIONARIOS WHERE ID = 5; <br></li>
<i>usando UNION para concatenacao de dois selects</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163722551-43183587-0c5f-47f3-a097-5429f6741017.png)

  <hr>
  
  <li> <br>SELECT * FROM FUNCIONARIOS WHERE NOME = 'GUILHERME' <br>
UNION ALL <br>
SELECT * FROM FUNCIONARIOS WHERE NOME = 'GUILHERME'; <br></li>
<i>Obs: o UNION ALL não elimina registros duplicados, traz todos registros mesmo duplicados, exemplo abaixo contendo dois selects retornando o mesmo dado, caso seja utilizado UNION sem ALL retornara apenas um registro.</i>
  
  ![image](https://user-images.githubusercontent.com/69328711/163722598-bc9078f3-3aa5-4c1e-ad5b-160b3f2bc92f.png)

  
</body>
</html>
