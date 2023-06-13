USE collectors;

DELETE FROM artista;
DELETE FROM collezione;
DELETE FROM collezionista;
DELETE FROM condivisione;
DELETE FROM collaborazione;
DELETE FROM disco;
DELETE FROM immagine;
DELETE FROM info_disco;
DELETE FROM traccia;


INSERT INTO artista (ID, nome, tipo)
VALUES (1, "Kanye West", "Esecutore");

INSERT INTO artista (ID, nome, tipo)
VALUES (2, "Kid Cudi", "Esecutore");

INSERT INTO artista (ID, nome, tipo)
VALUES (3, "Metro Boomin", "Compositore");

INSERT INTO artista (ID, nome, tipo)
VALUES (4, "Linkin Park", "Gruppo");

INSERT INTO artista (ID, nome, tipo)
VALUES (5, "The Weeknd", "Esecutore");


INSERT INTO collezionista (ID, nickname, email)
VALUES (1, "mariorossi", "mariorossi@gmail.com");

INSERT INTO collezionista (ID, nickname, email)
VALUES (2, "luigibianchi", "luigibianchi@outlook.com");

INSERT INTO collezionista (ID, nickname, email)
VALUES (3, "francescoverdi", "francescoverdi@univaq.it");


INSERT INTO collezione (ID, ID_collezionista, nome, visibilita)
VALUES (1, 1, "My Collection", "Pubblica");

INSERT INTO collezione (ID, ID_collezionista, nome)
VALUES (2, 2, "Collezione Bianchi");

INSERT INTO collezione (ID, ID_collezionista, nome, visibilita)
VALUES (3, 3, "Collezione Francesco", "Privata");


INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (3, 2);

INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (1, 2);

INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (1, 3);

INSERT INTO condivisione (ID_collezionista, ID_collezione)
VALUES (2, 3);


INSERT INTO disco (ID, ID_autore, ID_collezione, titolo, formato, quantita, stato)
VALUES (1, 1, 1, "Graduation", "Vinile", 3, "Buono");

INSERT INTO disco (ID, ID_autore, ID_collezione, titolo, formato, barcode, quantita, stato)
VALUES (2, 1, 1, "808s & Heartbreak", "CD", "82156179", 4, "Come nuovo");

INSERT INTO disco (ID, ID_autore, ID_collezione, titolo, formato, quantita, stato)
VALUES (3, 2, 3, "Man on The Moon", "Digitale", 2, "n/a");

INSERT INTO disco (ID, ID_autore, ID_collezione, titolo, formato, barcode, stato)
VALUES (4, 3, 2, "HEROES & VILLAINS", "Digitale", "561795468941", "n/a");

INSERT INTO disco (ID, ID_autore, ID_collezione, titolo, formato, quantita, stato)
VALUES (5, 4, 2, "Meteora", "CD", 2, "Nuovo");

INSERT INTO disco (ID, ID_autore, ID_collezione, titolo, formato, quantita, stato)
VALUES (6, 4, 3, "Hybrid Theory", "Vinile", 3, "Buono");

INSERT INTO disco (ID, ID_autore, ID_collezione, titolo, formato, stato)
VALUES (7, 4, 3, "Hybrid Theory", "Vinile", "Come nuovo");


INSERT INTO immagine (ID, ID_disco, path, etichetta)
VALUES (1, 4, "/home/user/pictures/heroes-and-villains.png", "Copertina");

INSERT INTO immagine (ID, ID_disco, path, etichetta)
VALUES (2, 4, "/home/user/pictures/heroes-and-villains-retro.png", "Retro");

INSERT INTO immagine (ID, ID_disco, path, etichetta)
VALUES (3, 6, "/home/user/pictures/hybrid-theory.jpg", "Copertina");


INSERT INTO info_disco (ID_disco, genere, etichetta, anno)
VALUES (2, "Hip-Hop", "Roc-A-Fella Records", 2008);

INSERT INTO info_disco (ID_disco, genere, etichetta, anno)
VALUES (3, "Hip-Hop", "GOOD Music", 2009);

INSERT INTO info_disco (ID_disco, genere, etichetta, anno)
VALUES (4, "Pop", "Boominati", 2022);

INSERT INTO info_disco (ID_disco, genere, anno)
VALUES (5, "Rock", 2003);

INSERT INTO info_disco (ID_disco, genere, etichetta, anno)
VALUES (6, "Rock", "Warner Bros. Records", 2000);

INSERT INTO info_disco (ID_disco, genere, etichetta, anno)
VALUES (7, "Rock", "Warner Bros. Records", 2000);


INSERT INTO traccia (ID, ID_disco, numero, titolo, durata)
VALUES (1, 2, 2, "Welcome To Heartbreak", "00:04:22");

INSERT INTO traccia (ID, ID_disco, numero, titolo)
VALUES (2, 5, 13, "Numb");

INSERT INTO traccia (ID, ID_disco, numero, titolo, durata)
VALUES (3, 4, 10, "Creepin'", "00:03:41");

INSERT INTO traccia (ID, ID_disco, numero, titolo, durata)
VALUES (4, 4, 2, "Superhero", "00:03:02");

INSERT INTO traccia (ID, ID_disco, numero, titolo, durata)
VALUES (5, 4, 7, "Around Me", "00:03:11");

INSERT INTO traccia (ID, ID_disco, numero, titolo)
VALUES (6, 6, 2, "One Step Closer");

INSERT INTO traccia (ID, ID_disco, numero, titolo, durata)
VALUES (7, 6, 8, "In The End", "00:03:36");

INSERT INTO traccia (ID, ID_disco, numero, titolo)
VALUES (8, 7, 2, "One Step Closer");

INSERT INTO traccia (ID, ID_disco, numero, titolo, durata)
VALUES (9, 7, 8, "In The End", "00:03:36");


INSERT INTO collaborazione (ID_artista, ID_traccia)
VALUES (2, 1);

INSERT INTO collaborazione (ID_artista, ID_traccia)
VALUES (5, 3);