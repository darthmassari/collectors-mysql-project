-- 2. Aggiunta di dischi a una collezione e di tracce a un disco

-- inserimento di un disco...
INSERT INTO disco (ID, ID_autore, titolo, formato, barcode)
VALUES (7, 2, "Passion, Pain & Demon Slayin'", "CD", "82156179");

-- aggiunta delle informazioni al disco...
INSERT INTO info_disco (ID_disco, genere, descrizione, etichetta, anno)
VALUES (7, "Hip-Hop", "Passion, Pain & Demon Slayin' è il sesto album in studio del rapper e cantante statunitense Kid Cudi, pubblicato il 16 dicembre 2016", "Wicked Awesome", 2016);

-- aggiunta di tracce al disco...
INSERT INTO traccia (ID, ID_Disco, numero, titolo, durata)
VALUES (8, 7, 4, "By Design", "00:04:17");

INSERT INTO traccia (ID, ID_Disco, numero, titolo, durata)
VALUES (9, 7, 8, "Baptized In Fire", "00:04:45");

-- aggiunta del disco alla collezione
INSERT INTO copia (ID_collezione, ID_disco, quantita, stato)
VALUES (4, 7, 4, "Nuovo");