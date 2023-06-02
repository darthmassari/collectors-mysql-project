-- 10. Numero dei brani (tracce di dischi) distinti di un certo autore 
-- (compositore, musicista) presenti nelle collezioni pubbliche.

DROP PROCEDURE IF EXISTS num_tracce_artista;
CREATE PROCEDURE num_tracce_artista (ID_artista INTEGER)
	SELECT COUNT(DISTINCT t.titolo) 
    FROM traccia t, collezione c, copia cp, disco d, artista a
    WHERE c.visibilita = "pubblica" 
		AND ID_artista = a.ID 
		AND a.ID = d.ID_autore 
        AND d.ID = cp.ID_disco 
        AND c.ID = cp.ID_collezione 
        AND t.ID_disco = d.ID;

CALL num_tracce_artista(3);
    