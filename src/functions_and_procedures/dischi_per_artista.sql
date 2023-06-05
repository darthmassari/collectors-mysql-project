DROP PROCEDURE IF EXISTS dischi_per_artista;
DELIMITER $
CREATE PROCEDURE dischi_per_artista (nome VARCHAR(50))
BEGIN
	(
		SELECT DISTINCT a.nome AS artista, a.tipo AS tipo_artista, "Autore" AS tipo, d.titolo AS disco, d.formato, d.barcode  
		FROM disco d
			JOIN artista a ON (d.ID_autore = a.ID)
		WHERE a.nome LIKE CONCAT ('%', nome, '%')
	)
    UNION
    (	
		SELECT DISTINCT a.nome AS artista, a.tipo AS tipo_artista, "Featuring" AS tipo, d.titolo, d.formato, d.barcode
        FROM artista a
			JOIN collaborazione c ON (a.ID = c.ID_artista)
            JOIN traccia t ON (c.ID_traccia = t.ID)
            JOIN disco d ON (t.ID_disco = d.ID)
		WHERE a.nome LIKE CONCAT ('%', nome, '%')
	);
END$
DELIMITER ;