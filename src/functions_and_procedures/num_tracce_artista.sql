DROP PROCEDURE IF EXISTS num_tracce_artista;
DELIMITER $
CREATE PROCEDURE num_tracce_artista (ID_artista INTEGER)
BEGIN
	SELECT a.nome, COUNT(DISTINCT t.titolo) as numero_brani
    FROM artista a
		JOIN disco d ON (a.ID = d.ID_autore)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
        JOIN traccia t ON (d.ID = t.ID_disco)
    WHERE c.visibilita = 'pubblica' AND ID_artista = a.ID
    GROUP BY a.nome;
END$
DELIMITER ;