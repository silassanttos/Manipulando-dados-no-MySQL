CREATE DEFINER=`root`@`localhost` FUNCTION `F_NUMERO_ALEATORIO`(max INT, min INT) RETURNS int(11)
BEGIN
	DECLARE vRetorno INT;
    SELECT FLOOR((RAND() * (max-min+1)) + min) INTO vRetorno;
RETURN vRetorno;
END

-- Buscando os parametros colocando valores de entrada, 15 e 300
SELECT F_NUMERO_ALEATORIO(15,300)
