DROP FUNCTION IF EXISTS aggiungi_disco;
DELIMITER $
CREATE FUNCTION aggiungi_disco (
	ID_collezione INTEGER UNSIGNED, quantita SMALLINT UNSIGNED, stato VARCHAR(50), 
    ID_autore INTEGER UNSIGNED, titolo VARCHAR(50), formato varchar(20), 
    barcode VARCHAR(12), genere VARCHAR(50), descrizione VARCHAR(5000), 
    etichetta VARCHAR(50), anno SMALLINT UNSIGNED, anteprima BLOB)
RETURNS INTEGER UNSIGNED DETERMINISTIC 
BEGIN
    DECLARE IDdisco INTEGER UNSIGNED;

	INSERT INTO disco (ID_autore, titolo, formato, barcode) 
    VALUES (ID_autore, titolo, formato, barcode);
    
    SET IDdisco = last_insert_id();
    
    INSERT INTO info_disco (ID_disco, genere, descrizione, etichetta, anno, anteprima)
    VALUES (IDdisco, genere, descrizione, etichetta, anno, anteprima);
	
    INSERT INTO copia (ID_collezione, ID_disco, quantita, stato)
    VALUES (ID_collezione, IDdisco, quantita, stato);
    
    RETURN IDdisco;
END$
DELIMITER ;