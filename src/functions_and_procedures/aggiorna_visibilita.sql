DROP FUNCTION IF EXISTS aggiorna_visibilita;
DELIMITER $
CREATE FUNCTION aggiorna_visibilita (ID INTEGER UNSIGNED, nuova_visibilita VARCHAR(8))
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	IF (nuova_visibilita IS NOT NULL) THEN
    BEGIN
		UPDATE collezione c
		SET c.visibilita = nuova_visibilita
		WHERE c.ID = ID;
	END;
    ELSE
    BEGIN
		UPDATE collezione c
        SET c.visibilita = 'Privata'
        WHERE c.ID = ID;
	END;
    END IF;
        
    RETURN 'Collezione aggiornata';
END$
DELIMITER ;