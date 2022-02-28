USE stream_service;

######################### FUNCTIONS

# Función que calcula el impuesto a la subscripción y devuelve el precio final con el impuesto agregado:
DELIMITER #
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_tax`(id INT) RETURNS decimal(6,2)
    NO SQL
BEGIN
	DECLARE tax DECIMAL(6,2);
    DECLARE query DECIMAL(6,2);
    SET query = (
		SELECT pricing 
        FROM subscription 
        WHERE id_subs = id
	);
    SET tax = (
		query + (query * 18 / 100)
	);
	RETURN tax;
RETURN 1;
END
DELIMITER ;

# Función para calcular los ingresos totales del negocio, se suman todos los ingresos por subscripciones y se le restan los salarios:
DELIMITER #
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_total_income`() RETURNS decimal(6,2)
    NO SQL
BEGIN
	DECLARE total DECIMAL(6,2);
    DECLARE subs DECIMAL(6,2);
    DECLARE salaries DECIMAL(6,2);
    SET subs = (
		SELECT SUM(pricing) 
        FROM subscription 
        INNER JOIN premium_users 
        ON subscription.id_subs = premium_users.id_premium_user
	);
    SET salaries = (
		SELECT SUM(salary) 
        FROM staff
	);
    SET total = (
		subs - salaries
    );
    RETURN total;
RETURN 1;
END
DELIMITER ;
