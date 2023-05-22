* **Collezionista** (<u>ID</u>, email, nickname) <br>
* **Collezione** (<u>ID</u>, ID_collezionista, nome, visibilità) <br>
* **Condivisa** (<u>ID_collezionista</u>, <u>ID_collezione</u>) <br>
* **Artista** (<u>ID</u>, nome, tipo) <br>
* **Disco** (<u>ID</u>, ID_autore, titolo, genere, barcode, copertina) <br>
* **Catalogo** (<u>ID_collezione</u>, <u>ID_disco</u>, quantità) <br>
* **Immagine** (<u>ID</u>, ID_disco, etichetta) <br>
* **Info_Disco** (<u>ID</u>, ID_disco, casaEditrice, anno, formato, stato) <br>
* **Traccia** (<u>ID</u>, ID_disco, titolo, durata) <br>
* **Contribuisce** (<u>ID_artista</u>, <u>ID_traccia</u>)