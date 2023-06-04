-- 12. Statistiche (una query per ciascun valore):
-- numero di collezioni di ciascun collezionista, numero di dischi per genere nel sistema.

-- Numero di dischi per genere
SELECT info.genere, COUNT(*)
FROM info_disco info
	RIGHT JOIN disco d ON (d.ID = info.ID_disco)
GROUP BY info.genere;