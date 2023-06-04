-- 12. Statistiche (una query per ciascun valore):
-- numero di collezioni di ciascun collezionista, numero di dischi per genere nel sistema.

-- Numero di collezioni di ciascun collezionista
SELECT p.nickname, COUNT(*)
FROM collezionista p
	JOIN collezione c ON (p.ID = c.ID_collezionista)
GROUP BY p.nickname;