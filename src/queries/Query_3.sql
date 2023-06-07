-- 3. Modifica dello stato di pubblicazione di una collezione 
-- (da privata a pubblica e viceversa) e aggiunta di nuove condivisioni a una collezione

SELECT AGGIORNA_VISIBILITA(3, 'Pubblica');

-- modifica dello stato di pubblicazione da pubblica a privata
SELECT AGGIORNA_VISIBILITA(1, 'Privata');

-- aggiunta di nuove condivisioni a una collezione
INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (2, 1);

INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (3, 1);