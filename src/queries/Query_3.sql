-- 3. Modifica dello stato di pubblicazione di una collezione 
-- (da privata a pubblica e viceversa) e aggiunta di nuove condivisioni a una collezione

-- modifica dello stato di pubblicazione da privata a pubblica
UPDATE collezione 
SET visibilita = 'Pubblica'
WHERE ID = 3;

-- modifica dello stato di pubblicazione da pubblica a privata
UPDATE collezione 
SET visibilita = 'Privata'
WHERE ID = 1;
-- oppure
UPDATE collezione 
SET visibilita = DEFAULT
WHERE ID = 1;

-- aggiunta di nuove condivisioni a una collezione
INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (2, 1);

INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (3, 1);