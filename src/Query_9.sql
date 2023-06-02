-- 9. Verifica della visibilità di una collezione da parte di un collezionista. 
-- (Suggerimento: una collezione è visibile a un collezionista se è sua, condivisa con lui o pubblica)

DROP PROCEDURE IF EXISTS verifica_visibilita;
CREATE PROCEDURE verifica_visibilita (ID_collezionista INTEGER, ID_collezione INTEGER)
/*BEGIN
	IF (ID_collezione = collezione.ID AND ID_collezionista = collezione.ID_collezionista) THEN
		RETURN ("Sei il proprietario di questa collezione");
	ELSEIF (ID_collezionista = condivisione.ID_collezionista AND ID_collezione = collezione.ID_collezione) THEN
		RETURN ("Questa collezione è stata condivisa con te");
	ELSEIF (ID_collezione IN collezione.ID AND collezione.visibilita = "pubblica")
		RETURN ("Questa è una collezione pubblica");
	ELSE
		RETURN ("Questa collezione non esiste o è privata");
END;*/

(
	SELECT collezione.nome, collezione.visibilita
	FROM collezione
	WHERE ID_collezionista = collezione.ID_collezionista 
		AND ID_collezione = collezione.ID
)
UNION
(
	SELECT collezione.nome, collezione.visibilita
	FROM collezione
	WHERE ID_collezione = collezione.ID 
		AND collezione.visibilita = "pubblica"
)
UNION
(
	SELECT collezione.nome, "Condivisa con te" AS visibilita
	FROM collezione, condivisione
	WHERE ID_collezione = condivisione.ID_collezione 
		AND ID_collezionista = condivisione.ID_collezionista 
        AND ID_collezione = collezione.ID
);

CALL verifica_visibilita (1, 2);