-- 2. Aggiunta di dischi a una collezione e di tracce a un disco

SELECT AGGIUNGI_DISCO (4, 4, 'Nuovo', 2, "Passion, Pain & Demon Slayin'", 'CD', '82156179', 'Hip-Hop', 
	"Passion, Pain & Demon Slayin' è il sesto album in studio del rapper e cantante statunitense Kid Cudi",
	'Wicked Awesome', 2016, NULL);
   
SELECT AGGIUNGI_TRACCIA (7, 4, 'By Design', '00:04:17');
SELECT AGGIUNGI_TRACCIA (7, 8, 'Baptized In Fire', '00:04:45');