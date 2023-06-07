DROP FUNCTION IF EXISTS elimina_copia;
DELIMITER $
CREATE FUNCTION elimina_copia (_ID_collezione INTEGER UNSIGNED, _ID_disco INTEGER UNSIGNED, _stato VARCHAR(50))
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	IF ((SELECT cp.quantita FROM copia cp 
        WHERE cp.ID_collezione = _ID_collezione
			AND cp.ID_disco = _ID_disco
			AND cp.stato = _stato) > 1) THEN
	BEGIN
		UPDATE copia cp
		SET cp.quantita = cp.quantita - 1
		WHERE cp.ID_collezione = _ID_collezione
			AND cp.ID_disco = _ID_disco
            AND cp.stato = _stato;
	END;
    ELSE
	BEGIN
		DELETE FROM copia cp
        WHERE cp.ID_collezione = _ID_collezione 
			AND cp.ID_disco = _ID_disco
            AND cp.stato = _stato;
	END;
    END IF;
    RETURN "Copia eliminata";
END$
DELIMITER ;
        