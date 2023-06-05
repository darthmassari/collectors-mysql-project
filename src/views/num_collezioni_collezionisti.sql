CREATE VIEW num_collezioni_collezionisti AS
SELECT p.nickname, COUNT(*) AS numero_collezioni
FROM collezionista p
	JOIN collezione c ON (p.ID = c.ID_collezionista)
GROUP BY p.nickname;