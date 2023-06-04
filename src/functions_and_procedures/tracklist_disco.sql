DROP PROCEDURE IF EXISTS tracklist_disco;
DELIMITER $
CREATE PROCEDURE tracklist_disco (ID INTEGER UNSIGNED)
BEGIN
	SELECT t.numero, t.titolo, t.durata
	FROM traccia t
	WHERE ID_disco = ID
	ORDER BY t.numero;
END$
DELIMITER ;