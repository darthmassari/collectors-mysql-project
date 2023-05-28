* **Collezionista** (<u>ID</u>, nickname, email) <br>
* **Collezione** (<u>ID</u>, ID_collezionista, nome, visibilità) <br>
* **Condivisione** (<u>ID_collezionista</u>, <u>ID_collezione</u>) <br>
* **Artista** (<u>ID</u>, nome, tipo) <br>
* **Disco** (<u>ID</u>, ID_autore, titolo, genere, formato, copertina) <br>
* **Copia** (<u>ID_collezione</u>, <u>ID_disco</u>, stato, quantità) <br>
* **Immagine** (<u>ID</u>, ID_disco, path, etichetta) <br>
* **Info_Disco** (<u>ID_disco</u>, barcode, descrizione, etichetta, anno) <br>
* **Traccia** (<u>ID</u>, ID_disco, numero, titolo, durata) <br>
* **Collaborazione** (<u>ID_artista</u>, <u>ID_traccia</u>)
