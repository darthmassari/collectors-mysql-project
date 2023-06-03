-- 6. Lista di tutti i dischi in una collezione
SELECT c.quantita, d.titolo, a.nome AS artista, d.formato, d.barcode, c.stato 
FROM copia c 
	JOIN disco d ON (c.ID_disco = d.ID)
    JOIN artista a ON (d.ID_autore = a.ID)
WHERE c.ID_collezione = 3
ORDER BY d.titolo;