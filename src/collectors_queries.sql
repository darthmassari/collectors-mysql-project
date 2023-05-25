-- 1. Inserimento di una nuova collezione
INSERT INTO collezione (ID, ID_collezionista, nome, visibilita)
VALUES (3, 3, "Collezione Hip-Hop", "private");

-- 2. Aggiunta di dischi a una collezione e di tracce a un disco

-- inserimento dei dischi...
INSERT INTO disco (ID, ID_autore, titolo, genere)
VALUES (6, 1, "Donda", "Hip-Hop");

INSERT INTO disco (ID, ID_autore, titolo, genere)
VALUES (7, 2, "Passion, Pain & Demon Slayin'", "Hip-Hop");

-- aggiunta delle informazioni ai dischi...
INSERT INTO info_disco (ID_disco, barcode, descrizione, etichetta, anno, formato)
VALUES (2, "82156179", "Roc-A-Fella Records", "808s & Heartbreak è il quarto album in studio del rapper statunitense Kanye West, pubblicato il 24 novembre 2008 dall'etichetta discografica Roc-A-Fella Records", 2008, "CD");

INSERT INTO info_disco (ID_disco, barcode, descrizione, etichetta, anno, formato)
VALUES (2, "82156179", "Roc-A-Fella Records", "808s & Heartbreak è il quarto album in studio del rapper statunitense Kanye West, pubblicato il 24 novembre 2008 dall'etichetta discografica Roc-A-Fella Records", 2008, "CD");
