DROP PROCEDURE IF EXISTS dischi_per_titolo;
DELIMITER $
CREATE PROCEDURE dischi_per_titolo (titolo VARCHAR(50))
BEGIN
	SELECT a.nome as artista, d.titolo, d.formato, d.barcode
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
    WHERE d.titolo = titolo;
END$
DELIMITER ;