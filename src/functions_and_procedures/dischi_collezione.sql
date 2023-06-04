DROP PROCEDURE IF EXISTS dischi_collezione;
DELIMITER $
CREATE PROCEDURE dischi_collezione (ID INTEGER UNSIGNED)
BEGIN
	SELECT c.quantita, d.titolo, a.nome AS artista, d.formato, d.barcode, c.stato 
	FROM copia c 
		JOIN disco d ON (c.ID_disco = d.ID)
		JOIN artista a ON (d.ID_autore = a.ID)
	WHERE c.ID_collezione = ID
	ORDER BY d.titolo;
END$
DELIMITER ;