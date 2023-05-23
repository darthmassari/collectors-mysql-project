* **Collezionista** (<u>ID</u>, nickname, email) <br>
* **Collezione** (<u>ID</u>, ID_collezionista, nome, visibilità) <br>
* **Condivisione** (<u>ID_collezionista</u>, <u>ID_collezione</u>) <br>
* **Artista** (<u>ID</u>, nome, tipo) <br>
* **Disco** (<u>ID</u>, ID_autore, titolo, genere, copertina) <br>
* **Catalogo** (<u>ID_collezione</u>, <u>ID_disco</u>, quantità, stato) <br>
* **Immagine** (<u>ID</u>, ID_disco, etichetta, file) <br>
* **Info_Disco** (<u>ID_disco</u>, barcode, descrizione, etichetta, anno, formato) <br>
* **Traccia** (<u>ID</u>, ID_disco, numero, titolo, durata) <br>
* **Collaborazione** (<u>ID_artista</u>, <u>ID_traccia</u>)
