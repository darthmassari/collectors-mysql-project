-- 3. Modifica dello stato di pubblicazione di una collezione 
-- (da privata a pubblica e viceversa) e aggiunta di nuove condivisioni a una collezione

UPDATE collezione 
SET 
    visibilita = 'pubblica'
WHERE
    ID = 3;

-- modifica stato della pubblicazione di una collezione da pubblica a privata
UPDATE collezione 
SET 
    visibilita = 'privata'
WHERE
    ID = 1;
-- oppure
UPDATE collezione 
SET 
    visibilita = DEFAULT
WHERE
    ID = 1;

-- aggiunta di nuove condivisioni a una collezione
INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (2, 1);

INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (3, 1);