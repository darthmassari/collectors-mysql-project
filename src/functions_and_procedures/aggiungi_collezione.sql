DROP FUNCTION IF EXISTS aggiungi_collezione;
DELIMITER $
CREATE FUNCTION aggiungi_collezione (ID_collezionista INTEGER UNSIGNED, nome VARCHAR(50), visibilita VARCHAR(10))
RETURNS INTEGER UNSIGNED DETERMINISTIC
BEGIN
	INSERT INTO collezione (ID_collezionista, nome, visibilita) 
    VALUES (ID_collezionista, nome, visibilita);
	
    RETURN last_insert_id();
END$
DELIMITER ;