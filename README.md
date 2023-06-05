# Laboratorio di Basi di Dati:  *Progetto "Collectors"*

**Gruppo di lavoro**:

| Matricola | Nome  |             Cognome             | Contributo al progetto |
|:---------:|:-----:|:-------------------------------:|:----------------------:|
|  271744   | Marco |             Ciucci              |          100%          | 

**Data di consegna del progetto**: gg/mm/aaaa

## Analisi dei requisiti

- Vanno (eventualmente) discusse tutte le scelte progettuali relative al dominio, le ambiguità e il modo in cui sono state risolte.
- E' possibile infine inserire qui un glossario che riporta tutti gli oggetti di dominio individuati, con la loro semantica, i loro eventuali sinonimi e le loro proprietà.


- Registrazione di dati relativi ai collezionisti, alle loro collezioni di dischi (ogni collezionista può creare più collezioni). 
- Per ogni disco in una collezione, dovranno essere specificati gli autori, il titolo, l'anno di uscita, l'etichetta discografica, il genere musicale (scelto da una lista predefinita), lo stato di conservazione (scelto da una lista predefinita), il formato, il barcode, se disponibile (i codici a barre garantiscono l'identificazione univoca dell'elemento)
- Lista delle tracce, ciascuna con titolo, durata, ed compositore ed esecutore, se diverso da quelli dell'intero disco. 
- Ogni disco può essere associato a una o più immagini (copertina, retro, eventuali facciate interne o libretti, ecc.).
- Per ogni disco, il collezionista potrà inoltre indicare l'eventuale numero di doppioni a sua disposizione.
- I collezionisti possono decidere di condividere la propria collezione con specifici utenti o in maniera pubblica.


- 
## Progettazione concettuale

<img src="design/Collectors_ER.png" style="margin-left: 13px">

- Copia (stato, quantita)
- Chiavi
- Visibilita
- Generalizzazione
- Collaborazione


- Commentate gli elementi non visibili nella figura (ad esempio il contenuto degli attributi composti) nonché le scelte/assunzioni che vi hanno portato a creare determinate strutture, se lo ritenete opportuno.

### Formalizzazione dei vincoli non esprimibili nel modello ER

- Elencate gli altri **vincoli** sui dati che avete individuato e che non possono essere espressi nel diagramma ER.

## Progettazione logica

### Ristrutturazione ed ottimizzazione del modello ER

<img src="design/Collectors_ER_Ristrutturato.png" style="margin-left: 13px">

- Tipo artista
- Info_Disco
- Immagine (path)


- Discutete le scelte effettuate, ad esempio nell'eliminare una generalizzazione o nello scindere un'entità.

### Traduzione del modello ER nel modello relazionale

* **Collezionista** (**<ins>ID</ins>**, nickname, email) <br>
* **Collezione** (**<ins>ID</ins>**, <ins>ID_collezionista</ins>, nome, visibilità) <br>
* **Condivisione** (<ins>ID_collezionista</ins>, <ins>ID_collezione</ins>) <br>
* **Artista** (**<ins>ID</ins>**, nome, tipo) <br>
* **Disco** (**<ins>ID</ins>**, <ins>ID_autore</ins>, titolo, formato, barcode) <br>
* **Copia** (<ins>ID_collezione</ins>, <ins>ID_disco</ins>, stato, quantità) <br>
* **Immagine** (**<ins>ID</ins>**, <ins>ID_disco</ins>, path, etichetta) <br>
* **Info_Disco** (<ins>ID_disco</ins>, genere, descrizione, etichetta, anno, anteprima) <br>
* **Traccia** (**<ins>ID</ins>**, <ins>ID_disco</ins>, numero, titolo, durata) <br>
* **Collaborazione** (<ins>ID_artista</ins>, <ins>ID_traccia</ins>)

|      Attributo       |   Significato   |
|:--------------------:|:---------------:|
|  **<ins>ID</ins>**   | Chiave primaria | 
| <ins>ID_entità</ins> | Chiave esterna  |

## Progettazione fisica

### Implementazione del modello relazionale

- Per la creazione ed il popolamento del database, utilizzare gli script [struttura](src/collectors_struttura.sql) e [dati](src/collectors_dati.sql)
- Alternativamente si può utilizzare il [file di dump](src/dump/collectors_dump.sql), il quale contiene tuti i dati e le funzioni/procedure utilizzate in seguito.

### Implementazione dei vincoli

- Nel caso abbiate individuato dei **vincoli ulteriori** che non sono esprimibili nel DDL, potrete usare questa sezione per discuterne l'implementazione effettiva, ad esempio riportando il codice di procedure o trigger, o dichiarando che dovranno essere implementati all'esterno del DBMS.

### Implementazione funzionalità richieste

- Riportate qui il **codice che implementa tutte le funzionalità richieste**, che si tratti di SQL o di pseudocodice o di entrambi. *Il codice di ciascuna funzionalità dovrà essere preceduto dal suo numero identificativo e dal testo della sua definizione*, come riportato nella specifica.

- Se necessario, riportate anche il codice delle procedure e/o viste di supporto.

#### Funzionalità 1

> Inserimento di una nuova collezione

[Funzione](src/functions_and_procedures/aggiungi_collezione.sql) per la creazione di una collezione
```sql
DROP FUNCTION IF EXISTS aggiungi_collezione;
DELIMITER $
CREATE FUNCTION aggiungi_collezione (ID_collezionista INTEGER UNSIGNED, nome VARCHAR(50), visibilita VARCHAR(10))
RETURNS INTEGER UNSIGNED DETERMINISTIC
BEGIN
	INSERT INTO collezione (ID_collezionista, nome, visibilita) 
    VALUES (ID_collezionista, nome, visibilita);
	
    RETURN last_insert_id();
END$
DELIMITER ;
```
[Query](src/queries/Query_1.sql) di esempio
```sql
SELECT AGGIUNGI_COLLEZIONE(3, 'Collezione Hip-Hop', 'privata');
```

#### Funzionalità 2

> Aggiunta di dischi a una collezione e di tracce a un disco

[Funzione](src/functions_and_procedures/aggiungi_disco.sql) per la creazione di un disco ed inserimento nella collezione
```sql
DROP FUNCTION IF EXISTS aggiungi_disco;
DELIMITER $
CREATE FUNCTION aggiungi_disco (
	ID_collezione INTEGER UNSIGNED, quantita SMALLINT UNSIGNED, stato VARCHAR(50), 
    ID_autore INTEGER UNSIGNED, titolo VARCHAR(50), formato varchar(20), 
    barcode VARCHAR(12), genere VARCHAR(50), descrizione VARCHAR(5000), 
    etichetta VARCHAR(50), anno SMALLINT UNSIGNED, anteprima BLOB)
RETURNS INTEGER UNSIGNED DETERMINISTIC 
BEGIN
    DECLARE IDdisco INTEGER UNSIGNED;

	INSERT INTO disco (ID_autore, titolo, formato, barcode) 
    VALUES (ID_autore, titolo, formato, barcode);
    
    SET IDdisco = last_insert_id();
    
    INSERT INTO info_disco (ID_disco, genere, descrizione, etichetta, anno, anteprima)
    VALUES (IDdisco, genere, descrizione, etichetta, anno, anteprima);
	
    INSERT INTO copia (ID_collezione, ID_disco, quantita, stato)
    VALUES (ID_collezione, IDdisco, quantita, stato);
    
    RETURN IDdisco;
END$
DELIMITER ;
```
[Funzione](src/functions_and_procedures/aggiungi_traccia.sql) per l'inserimento di una traccia in un disco
```sql
DROP FUNCTION IF EXISTS aggiungi_traccia;
DELIMITER $
CREATE FUNCTION aggiungi_traccia (
	ID_disco INTEGER UNSIGNED, numero TINYINT UNSIGNED, 
    titolo VARCHAR(50), durata TIME)
RETURNS INTEGER UNSIGNED DETERMINISTIC
BEGIN
	INSERT INTO traccia (ID_disco, numero, titolo, durata) 
    VALUES (ID_disco, numero, titolo, durata);
	
    RETURN last_insert_id();
END$
DELIMITER ;
```
[Query](src/queries/Query_2.sql) di esempio
```sql
SELECT AGGIUNGI_DISCO (4, 4, 'Nuovo', 2, "Passion, Pain & Demon Slayin'", 'CD', '82156179', 'Hip-Hop', 
	"Passion, Pain & Demon Slayin' è il sesto album in studio del rapper e cantante statunitense Kid Cudi",
	'Wicked Awesome', 2016, NULL);
   
SELECT AGGIUNGI_TRACCIA (7, 4, 'By Design', '00:04:17');
SELECT AGGIUNGI_TRACCIA (7, 8, 'Baptized In Fire', '00:04:45');
```

#### Funzionalità 3

> Modifica dello stato di pubblicazione di una collezione (da privata a pubblica e viceversa) e aggiunta di nuove condivisioni a una collezione

[Query](src/queries/Query_3.sql)
```sql
-- modifica dello stato di pubblicazione da privata a pubblica
UPDATE collezione 
SET visibilita = 'pubblica'
WHERE ID = 3;

-- modifica dello stato di pubblicazione da pubblica a privata
UPDATE collezione 
SET visibilita = 'privata'
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
```

#### Funzionalità 4

> Rimozione di un disco da una collezione

[Query](src/queries/Query_4.sql)
```sql
DELETE FROM disco 
WHERE ID = 5;
```

#### Funzionalità 5

> Rimozione di una collezione

[Query](src/queries/Query_5.sql)
```sql
DELETE FROM collezione 
WHERE ID = 4;
```

#### Funzionalità 6

> Lista di tutti i dischi da una collezione

[Procedura](src/functions_and_procedures/dischi_collezione.sql) per la lista dei dischi in una collezione
```sql
DROP PROCEDURE IF EXISTS dischi_collezione;
DELIMITER $
CREATE PROCEDURE dischi_collezione (ID INTEGER UNSIGNED)
BEGIN
	SELECT c.quantita, d.titolo, a.nome AS artista, d.formato, d.barcode, c.stato 
	FROM copia c 
		JOIN disco d ON (c.ID_disco = d.ID)
		JOIN artista a ON (d.ID_autore = a.ID)
	WHERE c.ID_collezione = ID
	ORDER BY d.titolo;
END$
DELIMITER ;
```
[Query](src/queries/Query_6.sql) di esempio
```sql
CALL dischi_collezione (3);
```

#### Funzionalità 7

> Track list di un disco

[Procedura](src/functions_and_procedures/tracklist_disco.sql) per la track list in un disco
```sql
DROP PROCEDURE IF EXISTS tracklist_disco;
DELIMITER $
CREATE PROCEDURE tracklist_disco (ID INTEGER UNSIGNED)
BEGIN
	SELECT t.numero, t.titolo, t.durata
	FROM traccia t
	WHERE ID_disco = ID
	ORDER BY t.numero;
END$
DELIMITER ;
```
[Query](src/queries/Query_7.sql) di esempio
```sql
CALL tracklist_disco (4);
```

#### Funzionalità 8

> Ricerca di dischi in base a nomi di autori/compositori/interpreti e/o titoli. Si potrà decidere di includere nella ricerca le collezioni di un certo collezionista e/o quelle condivise con lo stesso collezionista e/o quelle pubbliche

[Procedura](src/functions_and_procedures/dischi_per_artista.sql) per la ricerca di dischi in base all'autore
```sql
DROP PROCEDURE IF EXISTS dischi_per_artista;
DELIMITER $
CREATE PROCEDURE dischi_per_artista (nome VARCHAR(50))
BEGIN
	SELECT a.nome AS artista, a.tipo, d.titolo, d.formato, d.barcode
	FROM disco d
		JOIN artista a ON (d.ID_autore = a.ID)
    WHERE a.nome = nome;
END$
DELIMITER ;
```
[Query](src/queries/Query_8_1.sql) di esempio
```sql
CALL dischi_per_artista("Metro Boomin");
```

[Procedura](src/functions_and_procedures/dischi_per_titolo.sql) per la ricerca di dischi in base al titolo
```sql
DROP PROCEDURE IF EXISTS dischi_per_titolo;
DELIMITER $
CREATE PROCEDURE dischi_per_titolo (titolo VARCHAR(50))
BEGIN
	SELECT a.nome as artista, d.titolo, d.formato, d.barcode
    FROM disco d 
		JOIN artista a ON (d.ID_autore = a.ID)
    WHERE d.titolo = titolo;
END$
DELIMITER ;
```
[Query](src/queries/Query_8_2.sql) di esempio
```sql
CALL dischi_per_titolo("HEROES & VILLAINS");
```

#### Funzionalità 9

> Verifica della visibilità di una collezione da parte di un collezionista

[Procedura](src/functions_and_procedures/verifica_visibilita.sql) per la verifica della visibilità
```sql
DROP PROCEDURE IF EXISTS verifica_visibilita;
DELIMITER $
CREATE PROCEDURE verifica_visibilita (ID_collezionista INTEGER, ID_collezione INTEGER)
BEGIN
	(
		SELECT collezione.nome, collezione.visibilita
		FROM collezione
		WHERE ID_collezionista = collezione.ID_collezionista 
			AND ID_collezione = collezione.ID
	)
	UNION
	(
		SELECT collezione.nome, collezione.visibilita
		FROM collezione
		WHERE ID_collezione = collezione.ID 
			AND collezione.visibilita = 'pubblica'
	)
	UNION
	(
		SELECT collezione.nome, 'Condivisa con te' AS visibilita
		FROM collezione, condivisione
		WHERE ID_collezione = condivisione.ID_collezione 
			AND ID_collezionista = condivisione.ID_collezionista 
			AND ID_collezione = collezione.ID
	)
    LIMIT 1;
END$
DELIMITER ;
```
[Query](src/queries/Query_9.sql) di esempio
```sql
CALL verifica_visibilita (1, 3);
```

#### Funzionalità 10

> Numero dei brani (tracce di dischi) distinti di un certo autore (compositore, musicista) presenti nelle collezioni pubbliche.

[Procedura](src/functions_and_procedures/num_tracce_artista.sql) per il numero di brani distinti di un autore nelle collezioni pubbliche
```sql
DROP PROCEDURE IF EXISTS num_tracce_artista;
DELIMITER $
CREATE PROCEDURE num_tracce_artista (ID_artista INTEGER)
BEGIN
	SELECT a.nome, COUNT(DISTINCT t.titolo) as numero_brani
    FROM artista a
		JOIN disco d ON (a.ID = d.ID_autore)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
        JOIN traccia t ON (d.ID = t.ID_disco)
    WHERE c.visibilita = 'pubblica' AND ID_artista = a.ID
    GROUP BY a.nome;
END$
DELIMITER ;
```
[Query](src/queries/Query_10.sql) di esempio
```sql
CALL num_tracce_artista(3);
```

#### Funzionalità 11

> Minuti totali di musica riferibili a un certo autore (compositore, musicista) memorizzati nelle collezioni pubbliche.

[Procedura](src/functions_and_procedures/minuti_artista.sql) per i minuti di musica riferibili ad un autore
```sql
DROP PROCEDURE IF EXISTS minuti_artista;
DELIMITER $
CREATE PROCEDURE minuti_artista (ID_artista INTEGER)
BEGIN
	SELECT a.nome, SEC_TO_TIME(SUM(TIME_TO_SEC(t.durata))) as minuti_totali
    FROM artista a
		JOIN disco d ON (a.ID = d.ID_autore)
        JOIN copia cp ON (d.ID = cp.ID_disco)
        JOIN collezione c ON (cp.ID_collezione = c.ID)
        JOIN traccia t ON (d.ID = t.ID_disco)
    WHERE c.visibilita = 'pubblica' AND ID_artista = a.ID
    GROUP BY a.nome;
END$
DELIMITER ;
```
[Query](src/queries/Query_11.sql) di esempio
```sql
CALL minuti_artista(3);
```

#### Funzionalità 12

> Statistiche (una query per ciascun valore): numero di collezioni di ciascun collezionista, numero di dischi per genere nel sistema.

[Query](src/queries/Query_12_1.sql) per il numero di collezioni di ciascun collezionista
```sql
SELECT p.nickname, COUNT(*)
FROM collezionista p
	JOIN collezione c ON (p.ID = c.ID_collezionista)
GROUP BY p.nickname;
```
[Query](src/queries/Query_12_2.sql) per il numero di dischi per genere
```sql
SELECT info.genere, COUNT(*)
FROM info_disco info
	RIGHT JOIN disco d ON (d.ID = info.ID_disco)
GROUP BY info.genere;
```

#### Funzionalità 13

> Opzionalmente, dati un numero di barcode, un titolo e il nome di un autore, individuare tutti i dischi presenti nelle collezioni che sono più coerenti con questi dati (funzionalità utile, ad esempio, per individuare un disco già presente nel sistema prima di inserirne un doppione). L'idea è che il barcode è univoco, quindi i dischi con lo stesso barcode sono senz'altro molto coerenti, dopodichè è possibile cercare dischi con titolo simile e/o con l'autore dato, assegnando maggior punteggio di somiglianza a quelli che hanno più corrispondenze. Questa operazione può essere svolta con una stored procedure o implementata nell'interfaccia Java/PHP

[Procedura](src/functions_and_procedures/aggiungi_collezione.sql)
```sql
CODICE
```
[Query](src/queries/Query_1.sql)
```sql
CODICE
```

## Interfaccia verso il database

- Opzionalmente, se avete deciso di realizzare anche una **(semplice) interfaccia** (a linea di comando o grafica) in un linguaggio di programmazione a voi noto (Java, PHP, ...) che manipoli il vostro database , dichiaratelo in questa sezione, elencando
  le tecnologie utilizzate e le funzionalità invocabili dall'interfaccia.

- Il relativo codice sorgente dovrà essere *allegato *alla presente relazione.
