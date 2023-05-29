USE collectors;

DELETE FROM artista;
DELETE FROM copia;
DELETE FROM collezione;
DELETE FROM collezionista;
DELETE FROM condivisione;
DELETE FROM collaborazione;
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
VALUES (1, 1, "My Collection", "pubblica");

INSERT INTO collezione (ID, ID_collezionista, nome)
VALUES (2, 2, "Collezione Bianchi");


INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (3, 1);

INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (1, 2);


INSERT INTO disco (ID, ID_autore, titolo, formato)
VALUES (1, 1, "Graduation", "Vinile");

INSERT INTO disco (ID, ID_autore, titolo, formato, barcode)
VALUES (2, 1, "808s & Heartbreak", "CD", "82156179");

INSERT INTO disco (ID, ID_autore, titolo, formato)
VALUES (3, 2, "Man on The Moon", "Digitale");

INSERT INTO disco (ID, ID_autore, titolo, formato, barcode)
VALUES (4, 3, "HEROES & VILLAINS", "Digitale", "561795468941");

INSERT INTO disco (ID, ID_autore, titolo, formato)
VALUES (5, 4, "Meteora", "CD");


INSERT INTO copia (ID_collezione, ID_disco, quantita, stato)
VALUES (1, 1, 3, "Buono");

INSERT INTO copia (ID_collezione, ID_disco, quantita, stato)
VALUES (1, 2, 4, "Come nuovo");

INSERT INTO copia (ID_collezione, ID_disco, stato)
VALUES (2, 4, "n/a");

INSERT INTO copia (ID_collezione, ID_disco, quantita, stato)
VALUES (2, 5, 2, "Nuovo");


INSERT INTO immagine (ID, ID_disco, path, etichetta)
VALUES (1, 4, "/home/user/pictures/heroes-and-villains.png", "Copertina");


INSERT INTO info_disco (ID_disco, genere, descrizione, etichetta, anno)
VALUES (2, "Hip-Hop", "808s & Heartbreak è il quarto album 
	in studio del rapper statunitense Kanye West, pubblicato il 
    24 novembre 2008 dall'etichetta discografica Roc-A-Fella Records", "Roc-A-Fella Records", 2008);

INSERT INTO info_disco (ID_disco, genere, etichetta, anno)
VALUES (4, "Hip-Hop", "Boominati", 2022);

INSERT INTO info_disco (ID_disco, genere, anno)
VALUES (5, "Rock", 2003);


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