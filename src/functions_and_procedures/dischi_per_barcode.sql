DROP PROCEDURE IF EXISTS dischi_per_barcode;
DELIMITER $
CREATE PROCEDURE dischi_per_barcode (barcode VARCHAR(50), _ID_collezionista INTEGER UNSIGNED)
BEGIN
	(
	SELECT a.nome AS artista, a.tipo AS tipo_artista, d.titolo, d.formato, d.barcode, c.visibilita AS visibilita_collezione
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
        JOIN collezione c ON (d.ID_collezione = c.ID)
    WHERE _ID_collezionista IS NOT NULL 
		AND c.ID_collezionista = _ID_collezionista 
        AND d.barcode LIKE CONCAT(barcode, '%')
    )
    UNION
    (
	SELECT a.nome AS artista, a.tipo AS tipo_artista, d.titolo, d.formato, d.barcode, "Condivisa con te" AS visibilita_collezione
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
        JOIN collezione c ON (d.ID_collezione = c.ID)
        JOIN condivisione con ON (c.ID = con.ID_collezione)
    WHERE _ID_collezionista IS NOT NULL 
		AND con.ID_collezionista = _ID_collezionista 
		AND d.barcode LIKE CONCAT(barcode, '%')
    )
    UNION
    (
	SELECT a.nome AS artista, a.tipo AS tipo_artista, d.titolo, d.formato, d.barcode, c.visibilita AS visibilita_collezione
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
        JOIN collezione c ON (d.ID_collezione = c.ID)
    WHERE c.visibilita = 'Pubblica' AND d.barcode LIKE CONCAT(barcode, '%')
    );
END$
DELIMITER ;