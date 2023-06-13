DROP PROCEDURE IF EXISTS minuti_artista;
DELIMITER $
CREATE PROCEDURE minuti_artista (ID_artista INTEGER)
BEGIN
	SELECT a.nome, SEC_TO_TIME(SUM(TIME_TO_SEC(t.durata))) as minuti_artista
    FROM artista a
		JOIN disco d ON (a.ID = d.ID_autore)
        JOIN collezione c ON (d.ID_collezione = c.ID)
        JOIN traccia t ON (d.ID = t.ID_disco)
    WHERE c.visibilita = 'Pubblica' AND ID_artista = a.ID
    GROUP BY a.nome;
END$
DELIMITER ;