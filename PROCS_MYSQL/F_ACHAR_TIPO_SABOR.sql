USE `sucos_vendas`;
DROP function IF EXISTS `f_achar_tipo_sabor`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_achar_tipo_sabor` (vSabor varchar(50))
RETURNS VARCHAR(50)
BEGIN
	declare vRetorno varchar(50) default "";
    case vSabor
		WHEN 'Lima/Limão' 	THEN SET vRetorno = 'Citríco';
        WHEN 'Morango'		THEN SET vRetorno = 'Neutro';
        WHEN 'Laranja'		THEN SET vRetorno = 'Citríco';
        WHEN 'Uva'			THEN SET vRetorno = 'Neutro';
        ELSE SET vRetorno = 'Ácidos';
        END CASE;
		RETURN vRetorno;
END$$

DELIMITER ;



/*
select f_achar_tipo_sabor('Morango')

Neutro
3	123	23:41:51	select f_achar_tipo_sabor('Morango')
 LIMIT 0, 50000	1 row(s) returned	0.000 sec / 0.000 sec
*/
