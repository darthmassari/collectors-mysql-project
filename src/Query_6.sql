-- 6. Lista di tutti i dischi in una collezione
SELECT c.quantita, d.titolo, a.nome AS artista, d.formato, d.barcode, c.stato 
FROM copia c INNER JOIN disco d INNER JOIN artista a
ON c.ID_collezione = 3 AND c.ID_disco = d.ID AND d.ID_autore = a.ID
ORDER BY d.titolo;