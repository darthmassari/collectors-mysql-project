USE collectors;

DELETE FROM artista;
DELETE FROM catalogo;
DELETE FROM collezione;
DELETE FROM collezionista;
DELETE FROM condivisa;
DELETE FROM contribuisce;
DELETE FROM disco;
DELETE FROM immagine;
DELETE FROM info_disco;
DELETE FROM traccia;


INSERT INTO artista (ID, nome, tipo)
VALUES (1, "Kanye West", "esecutore");

INSERT INTO artista (ID, nome, tipo)
VALUES (2, "Kid Cudi", "esecutore");

INSERT INTO artista (ID, nome, tipo)
VALUES (3, "Metro Boomin", "compositore");

INSERT INTO artista (ID, nome, tipo)
VALUES (4, "Linkin Park", "esecutore");

INSERT INTO artista (ID, nome, tipo)
VALUES (5, "The Weeknd", "esecutore");


INSERT INTO collezionista (ID, nickname, email)
VALUES (1, "mariorossi", "mariorossi@gmail.com");

INSERT INTO collezionista (ID, nickname, email)
VALUES (2, "luigibianchi", "luigibianchi@outlook.com");

INSERT INTO collezionista (ID, nickname, email)
VALUES (3, "francescoverdi", "francescoverdi@univaq.it");


INSERT INTO collezione (ID, ID_collezionista, nome, visibilita)
VALUES (1, 2, "Collezione Bianchi", "public");

INSERT INTO collezione (ID, ID_collezionista, nome)
VALUES (2, 1, "My Collection");


INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (3, 1);

INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (2, 2);


INSERT INTO disco (ID, ID_autore, titolo, genere)
VALUES (1, 1, "Graduation", "Hip-Hop");

INSERT INTO disco (ID, ID_autore, titolo)
VALUES (2, 1, "808s & Heartbreak");

INSERT INTO disco (ID, ID_autore, titolo, genere)
VALUES (3, 2, "Man on The Moon", "Hip-Hop");

INSERT INTO disco (ID, ID_autore, titolo)
VALUES (4, 3, "HEROES & VILLAINS");

INSERT INTO disco (ID, ID_autore, titolo, genere)
VALUES (5, 4, "Meteora", "Rock");


INSERT INTO catalogo (ID_collezione, ID_disco, quantita, stato)
VALUES (1, 1, 3, "n/a");

INSERT INTO catalogo (ID_collezione, ID_disco, quantita, stato)
VALUES (1, 2, 4, "Nuovo");

INSERT INTO catalogo (ID_collezione, ID_disco, stato)
VALUES (2, 4, "n/a");

INSERT INTO catalogo (ID_collezione, ID_disco, quantita, stato)
VALUES (2, 5, 2, "Come nuovo");


INSERT INTO info_disco (ID_disco, barcode, descrizione, etichetta, anno, formato)
VALUES (2, "82156179", "Roc-A-Fella Records", "808s & Heartbreak è il quarto album in studio del rapper statunitense Kanye West, pubblicato il 24 novembre 2008 dall'etichetta discografica Roc-A-Fella Records", 2008, "CD");

INSERT INTO info_disco (ID_disco, anno, formato)
VALUES (5, 2003, "Vinile");

INSERT INTO info_disco (ID_disco, anno, formato)
VALUES (4, 2022, "Digitale");


INSERT INTO traccia (ID, ID_disco, numero, titolo, durata)
VALUES (1, 2, 2, "Welcome To Heartbreak", "00:04:22");

INSERT INTO traccia (ID, ID_disco, numero, titolo)
VALUES (2, 5, 13, "Numb");

INSERT INTO traccia (ID, ID_disco, numero, titolo, durata)
VALUES (3, 4, 10, "Creepin'", "00:03:41");


INSERT INTO collaborazione (ID_artista, ID_traccia)
VALUES (2, 1);

INSERT INTO collaborazione (ID_artista, ID_traccia)
VALUES (5, 3);