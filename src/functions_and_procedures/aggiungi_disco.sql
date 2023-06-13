DROP FUNCTION IF EXISTS aggiungi_disco;
DELIMITER $
CREATE FUNCTION aggiungi_disco (
	ID_collezione INTEGER UNSIGNED, quantita SMALLINT UNSIGNED, stato VARCHAR(50), 
    ID_autore INTEGER UNSIGNED, titolo VARCHAR(50), formato VARCHAR(20), 
    barcode VARCHAR(12), genere VARCHAR(50), etichetta VARCHAR(50), anno SMALLINT UNSIGNED)

RETURNS INTEGER UNSIGNED DETERMINISTIC 
BEGIN
    DECLARE IDdisco INTEGER UNSIGNED;

	IF (formato = 'Digitale') THEN
    BEGIN
		INSERT INTO disco (ID_autore, ID_collezione, titolo, formato, barcode, quantita, stato) 
		VALUES (ID_autore, ID_collezione, titolo, formato, barcode, quantita, 'n/a');
	END;
    ELSE
    BEGIN
		INSERT INTO disco (ID_autore, ID_collezione, titolo, formato, barcode, quantita, stato) 
		VALUES (ID_autore, ID_collezione, titolo, formato, barcode, quantita, stato);
	END;
    END IF;
    
    SET IDdisco = last_insert_id();
    
    INSERT INTO info_disco (ID_disco, genere, etichetta, anno)
    VALUES (IDdisco, genere, etichetta, anno);
    
    RETURN IDdisco;
END$
DELIMITER ;