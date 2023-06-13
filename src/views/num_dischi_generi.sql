DROP VIEW IF EXISTS num_dischi_generi;
CREATE VIEW num_dischi_generi AS
SELECT info.genere, COUNT(*) AS numero_dischi
FROM info_disco info
	RIGHT JOIN disco d ON (d.ID = info.ID_disco)
GROUP BY info.genere
ORDER BY info.genere;