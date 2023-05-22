DROP DATABASE IF EXISTS Collectors;

CREATE DATABASE Collectors;
USE Collectors;

DROP USER IF EXISTS 'collectorsUser'@'localhost';
CREATE USER 'collectorsUser'@'localhost' IDENTIFIED BY 'collectorsPwd';
GRANT ALL PRIVILEGES ON campionati.* TO 'CollectorsPwd'@'localhost';

CREATE TABLE Collezionista (
  ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nickname VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  CONSTRAINT collezionista_unico UNIQUE(nickname, email)
);

CREATE TABLE Collezione (
  ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ID_collezionista INTEGER UNSIGNED NOT NULL,
  nome VARCHAR(50) NOT NULL UNIQUE,
  
  -- decidere se BOOLEAN o se ENUM, aggiungere default
  visibilita BOOLEAN,
  CONSTRAINT proprietario_collezione FOREIGN KEY (ID_collezionista)
        REFERENCES collezionista (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Condivisa (
	ID_collezionista INTEGER UNSIGNED NOT NULL,
    ID_collezione INTEGER UNSIGNED NOT NULL,
    CONSTRAINT condivisione_unica UNIQUE (ID_collezionista, ID_collezione),
    CONSTRAINT collezionista_condiviso FOREIGN KEY (ID_collezionista)
        REFERENCES collezionista (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT collezione_condivisa FOREIGN KEY (ID_collezione)
        REFERENCES collezione (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Artista (
	ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    tipo ENUM('e', 'c') NOT NULL
);

-- rivedere
CREATE TABLE Disco (
	ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	ID_autore INTEGER UNSIGNED NOT NULL,
	titolo VARCHAR(50) NOT NULL UNIQUE,  
    genere VARCHAR(50),
    barcode VARCHAR(50),
    copertina BLOB NOT NULL,
    CONSTRAINT autore_disco FOREIGN KEY (ID_autore)
		REFERENCES Artista (ID)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Catalogo (
	ID_collezione INTEGER UNSIGNED NOT NULL,
    ID_disco INTEGER UNSIGNED NOT NULL,
    quantita INTEGER NOT NULL DEFAULT 1,
    CONSTRAINT disco_unico UNIQUE (ID_collezione, ID_disco),
    CONSTRAINT collezione_catalogo FOREIGN KEY (ID_collezione)
		REFERENCES Collezione (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT disco_catalogo FOREIGN KEY (ID_disco)
		REFERENCES Disco (ID)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Immagine (
	ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_disco INTEGER UNSIGNED NOT NULL,
    etichetta VARCHAR(50),
    file BLOB NOT NULL,
    CONSTRAINT immagine_disco FOREIGN KEY(ID_disco)
		REFERENCES Disco (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- controllare i tipi
CREATE TABLE Info_Disco (
	ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	ID_disco INTEGER UNSIGNED NOT NULL,
    casaEditrice VARCHAR(50),
    anno INTEGER,
    formato VARCHAR(50),
    stato VARCHAR(50),
    CONSTRAINT disco_dettagli FOREIGN KEY (ID_disco)
		REFERENCES Disco (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Traccia (
	ID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_Disco INTEGER UNSIGNED NOT NULL,
    titolo VARCHAR(50) NOT NULL UNIQUE, 
    durata INT,
    CONSTRAINT disco_traccia FOREIGN KEY (ID_disco)
		REFERENCES Disco (ID)
        -- ricontrollare
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Contribuisce (
	ID_artista INTEGER UNSIGNED NOT NULL,
    ID_traccia INTEGER UNSIGNED NOT NULL,
    CONSTRAINT artista_collaborazione FOREIGN KEY (ID_artista)
		REFERENCES Artista (ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT traccia_collaborazione FOREIGN KEY (ID_traccia)
		REFERENCES Traccia (ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);