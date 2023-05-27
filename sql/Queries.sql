SELECT NombreCompleto --Consulta #1
FROM Personaje
WHERE Personaje.NombreCompleto IN (
		SELECT Posee.NombreCompleto 
		FROM Posee WHERE Posee.FormaObtencion = 'Artificial') 
	AND Personaje.NombreCompleto IN (
		SELECT Organizacion.PersonajeLidera 
		FROM Organizacion WHERE Organizacion.Tipo IN ('Superhéroes', 'Villanos'));

SELECT TituloMedio --Consulta #2
FROM Serie
WHERE TotalEpi > (
		SELECT AVG(TotalEpi) 
		FROM Serie);

SELECT Descripcion --Consulta #5
FROM Poder
WHERE Poder.Nombre IN (
		SELECT Posee.NombrePoder 
		FROM Posee
		WHERE Posee.NombreCompleto IN (
				SELECT Villano.NombreCompleto 
				FROM Villano) 
			AND Posee.FormaObtencion = 'Hereditario'
		GROUP BY Posee.NombrePoder
		HAVING COUNT(Posee.NombrePoder) >= 2)
	AND Poder.Nombre LIKE '%Super%';
	
SELECT TituloMedio --Consulta #6
FROM Pelicula
WHERE Pelicula.Duracion > 150 AND Pelicula.TipoPelicula = 'animada' AND Pelicula.Ganancias > (
		SELECT AVG(Pelicula.Ganancias) 
		FROM Pelicula 
		WHERE TipoPelicula = 'animada')
ORDER BY Pelicula.CosteProd;

SELECT NombreActor --Consulta #7 (Nombre de los actores que interpretan a Spider Man en peliculas)
FROM Aparece
WHERE Aparece.TipoActor = 'Interpreta' AND Aparece.NombreCompleto = 'Spider Man' AND TituloMedio IN (
    		SELECT TituloMedio
    		FROM Pelicula);

SELECT TituloMedio --Consulta #8 (Videojuegos en lo que aparece Iron Man o Capitan America que sean Online y tengan "Lego" en el nombre)
FROM Aparece
WHERE Aparece.TituloMedio IN (
		SELECT TituloMedio 
		FROM Videojuego 
		WHERE TituloMedio LIKE '%Lego%' AND TipoJuego = 'Online')
	AND (Aparece.NombreCompleto LIKE '%Iron Man%' OR Aparece.NombreCompleto LIKE '%Capitan America%');
