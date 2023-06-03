-- 10. Numero dei brani (tracce di dischi) distinti di un certo autore 
-- (compositore, musicista) presenti nelle collezioni pubbliche.

DROP PROCEDURE IF EXISTS num_tracce_artista;
DELIMITER $
CREATE PROCEDURE num_tracce_artista (ID_artista INTEGER)
BEGIN
	SELECT COUNT(DISTINCT t.titolo) as numero_brani
    FROM artista a
		JOIN disco d ON (a.ID = d.ID_autore)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
        JOIN traccia t ON (d.ID = t.ID_disco)
    WHERE c.visibilita = "pubblica" AND ID_artista = a.ID;
END$
DELIMITER ;

CALL num_tracce_artista(3);
    