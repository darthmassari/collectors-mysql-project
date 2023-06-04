DROP PROCEDURE IF EXISTS dischi_per_artista;
DELIMITER $
CREATE PROCEDURE dischi_per_artista (nome VARCHAR(50))
BEGIN
	SELECT a.nome AS artista, a.tipo, d.titolo, d.formato, d.barcode
	FROM disco d
		JOIN artista a ON (d.ID_autore = a.ID)
    WHERE a.nome = nome;
END$
DELIMITER ;