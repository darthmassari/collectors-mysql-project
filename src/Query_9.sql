-- 9. Verifica della visibilità di una collezione da parte di un collezionista. 
-- (Suggerimento: una collezione è visibile a un collezionista se è sua, condivisa con lui o pubblica)

CREATE FUNCTION verifica_visibilita (ID_collezionista INTEGER, ID_collezione INTEGER) RETURNS VARCHAR(50)
BEGIN
	IF (ID_collezione = collezione.ID AND ID_collezionista = collezione.ID_collezionista) THEN
		RETURN ("Sei il proprietario di questa collezione");
	ELSEIF (ID_collezionista = condivisione.ID_collezionista AND ID_collezione = collezione.ID_collezione) THEN
		RETURN ("Questa collezione è stata condivisa con te");
	ELSEIF (ID_collezione IN collezione.ID AND collezione.visibilita = "pubblica")
		RETURN ("Questa è una collezione pubblica");
	ELSE
		RETURN ("Questa collezione non esiste o è privata");
END;

CALL verifica_visibilita (1, 1);