create database aula_procedure
go
use aula_procedure

create table produto(
codigo int not null,
nome varchar(30) not null,
valor_unitario decimal(7,2) not null
primary key (codigo))

insert into produto values
(1, 'Sorvete', 7.00),
(2, 'Bala', 0.05),
(3, 'Pirulito', 0.15)

create table venda(
id_venda int not null,
quantidade int not null,
valor_total decimal(7,2) not null,
produto int not null,
dt_venda datetime not null
primary key(id_venda, produto, dt_venda)
foreign key (produto) references produto (codigo))

/*Problema:
Criar uma estrutura de programação SQL que 
ao se inserir uma venda, verifique se é parte da 
compra anterior ou nova compra (dê algum erro 
caso não se enquadre), e calcule o valor_total
antes da inserção
*/
/*Procedimentos Armazenados (Stored Procedures)
CREATE PROCEDURE sp_nome (variaveis entrada e saida)
AS
	.
	.
	.
(CREATE / ALTER / DROP)

CALL sp_nome @param1, @param2 ... (ISO)
EXEC sp_nome @param1, @param2, ... (SQL SERVER)
EXECUTE sp_nome @param1, @param2, ... (ORACLE)
*/
--TIPO N (Nova Compra), C (Continua Mesma Compra)
DROP PROCEDURE sp_venda
CREATE PROCEDURE sp_vl_total(@produto INT, @qtd INT, 
	@vl_total DECIMAL(7,2) OUTPUT)
AS
	DECLARE @vl_un DECIMAL(7,2)
	SELECT @vl_un = valor_unitario FROM produto WHERE codigo = @produto
	SET @vl_total = @vl_un * @qtd

-----------------------------
DECLARE @vl_total DECIMAL(7,2)
EXEC sp_vl_total 4, 10, @vl_total OUTPUT
PRINT @vl_total
-----------------------------

CREATE PROCEDURE sp_venda (@tipo CHAR(1), @produto INT, @qtd INT, 
	@saida VARCHAR(100) OUTPUT)
AS
	DECLARE @cta_produto INT,
			@cta_venda INT,
			@id_venda INT,
			@vl_total DECIMAL(7,2)

	SET @cta_produto = (SELECT COUNT(*) FROM produto 
							WHERE codigo = @produto)
	IF (@cta_produto > 0)
	BEGIN
		SET @cta_venda = (SELECT COUNT(*) FROM venda)
		IF (@cta_venda = 0)
		BEGIN
			SET @id_venda = 1
		END
		ELSE
		BEGIN
			SET @id_venda = (SELECT MAX(id_venda) FROM venda)
		END
		IF (UPPER(@tipo) != 'C' AND UPPER(@tipo) != 'N')
		BEGIN
			RAISERROR ('Operação inválida !', 16, 1)
		END
		ELSE 
		BEGIN
			IF (UPPER(@tipo) = 'N' AND @cta_venda > 0)
			BEGIN
				SET @id_venda =  @id_venda + 1
			END
			EXEC sp_vl_total @produto, @qtd, @vl_total OUTPUT
			INSERT INTO venda VALUES
			(@id_venda, @qtd, @vl_total, @produto, GETDATE())
			SET @saida = 'Venda cadastrada com sucesso !'
		END
	END
	ELSE
	BEGIN
		RAISERROR ('Produto não cadastrado', 16, 1)
	END

-----------------------------

DECLARE @saida VARCHAR(100)
EXEC sp_venda 'N', 3, 100, @saida OUTPUT
PRINT @saida

DECLARE @saida VARCHAR(100)
EXEC sp_venda 'C', 2, 20, @saida OUTPUT
PRINT @saida



select * from venda
TRUNCATE TABLE venda


