DROP DATABASE IF EXISTS collectors;

CREATE DATABASE collectors;
USE collectors;

CREATE TABLE collezionista (
    ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT collezionista_unico UNIQUE (nickname , email)
);

CREATE TABLE collezione (
    ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_collezionista INTEGER UNSIGNED NOT NULL,
    nome VARCHAR(50) NOT NULL,
    visibilita ENUM('Privata', 'Pubblica') NOT NULL DEFAULT 'Privata',
    CONSTRAINT collezione_unica UNIQUE (ID_collezionista, nome),
    CONSTRAINT proprietario_collezione FOREIGN KEY (ID_collezionista)
        REFERENCES collezionista (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE condivisione (
    ID_collezionista INTEGER UNSIGNED NOT NULL,
    ID_collezione INTEGER UNSIGNED NOT NULL,
    CONSTRAINT condivisione_unica UNIQUE (ID_collezionista , ID_collezione),
    CONSTRAINT collezionista_condiviso FOREIGN KEY (ID_collezionista)
        REFERENCES collezionista (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT collezione_condivisa FOREIGN KEY (ID_collezione)
        REFERENCES collezione (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE artista (
    ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    tipo ENUM('Esecutore', 'Compositore', 'Gruppo') NOT NULL
);

CREATE TABLE disco (
    ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	ID_collezione INTEGER UNSIGNED NOT NULL,
    ID_autore INTEGER UNSIGNED NOT NULL,
    titolo VARCHAR(50) NOT NULL,
    formato VARCHAR(50) NOT NULL,
    barcode VARCHAR(12) UNIQUE,
    quantita SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    stato VARCHAR(50) NOT NULL,
	CONSTRAINT formati CHECK (formato IN ('Vinile' , 'CD', 'Digitale', 'Musicassetta')),
    CONSTRAINT stati_conservazione CHECK (stato IN ('Nuovo' , 'Come nuovo', 'Buono', 'Cattivo', 'Pessimo', 'n/a')),
    CONSTRAINT disco_unico UNIQUE (ID_autore, ID_collezione, titolo, formato, stato),
    CONSTRAINT collezione_disco FOREIGN KEY (ID_collezione)
		REFERENCES collezione (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT autore_disco FOREIGN KEY (ID_autore)
        REFERENCES artista (ID)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE immagine (
    ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_disco INTEGER UNSIGNED NOT NULL,
    path VARCHAR(512) NOT NULL,
    etichetta VARCHAR(50),
    CONSTRAINT immagine_unica UNIQUE (ID_disco , path),
    CONSTRAINT immagine_disco FOREIGN KEY (ID_disco)
        REFERENCES disco (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE info_disco (
    ID_disco INTEGER UNSIGNED NOT NULL UNIQUE,
    genere VARCHAR(50),
    etichetta VARCHAR(50),
    anno SMALLINT UNSIGNED,
    CONSTRAINT generi_musicali CHECK (genere IN ('Hip-Hop' , 'R&B', 'Blues', 'Funk', 'Jazz',
        'Rock', 'Metal', 'Pop', 'Classica', 'Disco', 'Altro')),
    CONSTRAINT controllo_anno CHECK (anno > 1900 AND anno < 2100),
    CONSTRAINT disco_dettagli FOREIGN KEY (ID_disco)
        REFERENCES disco (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE traccia (
    ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_disco INTEGER UNSIGNED NOT NULL,
    numero TINYINT UNSIGNED NOT NULL,
    titolo VARCHAR(50) NOT NULL,
    durata TIME,
    CONSTRAINT controllo_durata CHECK (durata < '00:30:00'),
    CONSTRAINT traccia_unica UNIQUE (ID_disco , numero, titolo),
    CONSTRAINT disco_traccia FOREIGN KEY (ID_disco)
        REFERENCES disco (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE collaborazione (
    ID_artista INTEGER UNSIGNED NOT NULL,
    ID_traccia INTEGER UNSIGNED NOT NULL,
    CONSTRAINT collaboratore_unico UNIQUE (ID_artista , ID_traccia),
    CONSTRAINT artista_collaborazione FOREIGN KEY (ID_artista)
        REFERENCES artista (ID)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT traccia_collaborazione FOREIGN KEY (ID_traccia)
        REFERENCES traccia (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);