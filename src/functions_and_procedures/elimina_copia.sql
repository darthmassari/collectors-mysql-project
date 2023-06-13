DROP FUNCTION IF EXISTS elimina_copia;
DELIMITER $
CREATE FUNCTION elimina_copia (_ID_disco INTEGER UNSIGNED)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	IF ((SELECT d.quantita FROM disco d 
        WHERE d.ID = _ID_disco) > 1) THEN
	BEGIN
		UPDATE disco d
		SET d.quantita = d.quantita - 1
		WHERE d.ID = _ID_disco;
	END;
    ELSE
	BEGIN
		DELETE FROM disco d
        WHERE d.ID = _ID_disco;           
	END;
    END IF;
    RETURN "Copia eliminata";
END$
DELIMITER ;
        