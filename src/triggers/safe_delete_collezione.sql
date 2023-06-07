DROP TRIGGER IF EXISTS safe_delete_collezione;
DELIMITER $
CREATE TRIGGER safe_delete_collezione BEFORE DELETE ON collezione FOR EACH ROW
BEGIN
	DELETE disco, copia 
    FROM disco 
		JOIN copia ON (OLD.ID = copia.ID_collezione AND disco.ID = copia.ID_disco);
END$
DELIMITER ;