-- 7. Track list di un disco
SELECT t.numero, t.titolo, t.durata
FROM traccia AS t
WHERE ID_disco = 4
ORDER BY t.numero;