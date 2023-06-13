DROP PROCEDURE IF EXISTS dischi_collezione;
DELIMITER $
CREATE PROCEDURE dischi_collezione (ID INTEGER UNSIGNED)
BEGIN
	SELECT d.quantita, d.titolo, a.nome AS artista, d.formato, d.barcode, d.stato 
	FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
	WHERE d.ID_collezione = ID
	ORDER BY d.titolo;
END$
DELIMITER ;