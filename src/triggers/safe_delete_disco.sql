DROP TRIGGER IF EXISTS safe_delete_disco;
DELIMITER $
CREATE TRIGGER safe_delete_disco AFTER DELETE ON copia FOR EACH ROW
BEGIN
	DELETE FROM disco d
    WHERE (SELECT COUNT(*) FROM copia cp WHERE cp.ID_disco = OLD.ID_disco) = 0
		AND OLD.ID_disco = d.ID;		
END$
DELIMITER ;