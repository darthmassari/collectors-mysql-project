DROP FUNCTION IF EXISTS aggiungi_traccia;
DELIMITER $
CREATE FUNCTION aggiungi_traccia (ID_disco INTEGER UNSIGNED, numero TINYINT UNSIGNED, titolo VARCHAR(50), durata TIME)
RETURNS INTEGER UNSIGNED DETERMINISTIC
BEGIN
	INSERT INTO traccia (ID_disco, numero, titolo, durata) 
    VALUES (ID_disco, numero, titolo, durata);
	
    RETURN last_insert_id();
END$
DELIMITER ;