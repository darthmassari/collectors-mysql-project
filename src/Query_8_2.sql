-- 8. Ricerca di dischi in base a nomi di autori/compositori/interpreti e/o titoli. 
-- Si potrà decidere di includere nella ricerca le collezioni di un certo collezionista 
-- e/o quelle condivise con lo stesso collezionista e/o quelle pubbliche. 
-- (Suggerimento: potete realizzare diverse query in base alle varie combinazioni di 
-- criteri di ricerca. Usate la UNION per unire i risultati delle ricerche effettuate 
-- sulle collezioni private, condivise e pubbliche)

-- Ricerca di dischi in base al titolo
DELIMITER $$
DROP PROCEDURE IF EXISTS dischi_per_titolo;
CREATE PROCEDURE dischi_per_titolo (titolo VARCHAR(50))
BEGIN
	SELECT a.nome as artista, d.titolo, d.formato, d.barcode
    FROM disco as d, artista as a
    WHERE d.titolo = titolo AND d.ID_autore = a.ID;
END;

CALL dischi_per_titolo("HEROES & VILLAINS");