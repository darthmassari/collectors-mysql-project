DROP PROCEDURE IF EXISTS dischi_per_titolo;
DELIMITER $
CREATE PROCEDURE dischi_per_titolo (titolo VARCHAR(50), _ID_collezionista INTEGER UNSIGNED)
BEGIN
	(
	SELECT a.nome as artista, d.titolo, d.formato, d.barcode, c.visibilita
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
    WHERE c.visibilita = 'Pubblica' AND d.titolo LIKE CONCAT('%', titolo, '%')
    )
    UNION
    (
	SELECT a.nome as artista, d.titolo, d.formato, d.barcode, c.visibilita
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
    WHERE _ID_collezionista IS NOT NULL 
		AND c.ID_collezionista = _ID_collezionista 
        AND d.titolo LIKE CONCAT('%', titolo, '%')
    )
    UNION
    (
	SELECT a.nome as artista, d.titolo, d.formato, d.barcode, "Condivisa con te" AS visibilita
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
        JOIN condivisione con ON (c.ID = con.ID_collezione)
    WHERE _ID_collezionista IS NOT NULL 
		AND con.ID_collezionista = _ID_collezionista 
		AND d.titolo LIKE CONCAT('%', titolo, '%')
    );
END$
DELIMITER ;