DROP PROCEDURE IF EXISTS minuti_artista;
DELIMITER $
CREATE PROCEDURE minuti_artista (ID_artista INTEGER)
BEGIN
	SELECT a.nome,
	(SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(t.durata)))
    FROM artista a
		JOIN disco d ON (a.ID = d.ID_autore)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID AND c.visibilita = 'Pubblica')
        JOIN traccia t ON (d.ID = t.ID_disco)
    ) AS minuti,
    (SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(t.durata)))
    FROM artista a
		JOIN collaborazione col ON (a.ID = col.ID_artista)
        JOIN traccia t ON (col.ID_artista = t.ID)
        JOIN disco d ON (t.ID_disco = d.ID)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID AND c.visibilita = 'Pubblica')
	) AS minuti_featuring
    FROM artista a
    WHERE ID_artista = a.ID; 
END$
DELIMITER ;