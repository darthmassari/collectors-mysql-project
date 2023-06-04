DROP PROCEDURE IF EXISTS verifica_visibilita;
DELIMITER $
CREATE PROCEDURE verifica_visibilita (ID_collezionista INTEGER, ID_collezione INTEGER)
BEGIN
	(
		SELECT collezione.nome, collezione.visibilita
		FROM collezione
		WHERE ID_collezionista = collezione.ID_collezionista 
			AND ID_collezione = collezione.ID
	)
	UNION
	(
		SELECT collezione.nome, collezione.visibilita
		FROM collezione
		WHERE ID_collezione = collezione.ID 
			AND collezione.visibilita = 'pubblica'
	)
	UNION
	(
		SELECT collezione.nome, 'Condivisa con te' AS visibilita
		FROM collezione, condivisione
		WHERE ID_collezione = condivisione.ID_collezione 
			AND ID_collezionista = condivisione.ID_collezionista 
			AND ID_collezione = collezione.ID
	)
    LIMIT 1;
END$
DELIMITER ;