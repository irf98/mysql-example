USE stream_service;

######################### STORED PROCEDURES

# Stored Procedure para buscar y borrar una película por ID:
DELIMITER #
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_movie_by_id`(IN id INT)
BEGIN
	IF EXISTS
		(SELECT * FROM movies WHERE id_movie = id)
    THEN
		DELETE FROM movies WHERE id_movie = id;
	END IF;
END
DELIMITER ;

# Stored Procedure para buscar y borrar una serie por ID:
DELIMITER #
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_show_by_id`(IN id INT)
BEGIN
	IF EXISTS
		(SELECT * FROM shows WHERE id_show = id)
    THEN
		DELETE FROM shows WHERE id_show = id;
	END IF;
END
DELIMITER ;

# Stored Procedure para listar contenido y ordenarlo según un filtro deseado:
DELIMITER #
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_content`(IN coll VARCHAR(20), IN sort VARCHAR(20))
BEGIN
	IF coll <> '' AND sort <> '' THEN
		SET @order = CONCAT('ORDER BY ', coll, ' ', sort);
	ELSE
		SET @order = '';
	END IF;
    SET @query = CONCAT(
		'SELECT id_movie AS product_id, title, genre, year, director, rating, category FROM movies
		UNION
		SELECT id_show AS product_id, title, genre, year, director, rating, category FROM shows ', @order
	);
    PREPARE exec FROM @query;
    EXECUTE exec;
    DEALLOCATE PREPARE exec;
END
DELIMITER ;
