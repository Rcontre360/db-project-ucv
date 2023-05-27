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

SELECT Objeto.Nombre --Consulta #3
FROM Objeto, Porta, Personaje
WHERE Objeto.Nombre = Porta.NombreObj AND Personaje.NombreCompleto = Porta.NombreCompleto
GROUP BY Objeto.Nombre
ORDER BY COUNT(*) DESC
LIMIT 5;

SELECT Lugar --Consulta #4
FROM Combate
GROUP BY Lugar
ORDER BY COUNT(*) DESC
LIMIT 3;

SELECT TituloMedio --Consulta #5
FROM Pelicula
WHERE Pelicula.Duracion > 150 AND Pelicula.TipoPelicula = 'animada' AND Pelicula.Ganancias > (
		SELECT AVG(Pelicula.Ganancias) 
		FROM Pelicula 
		WHERE TipoPelicula = 'animada')
ORDER BY Pelicula.CosteProd;

SELECT * --Consulta #6
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
	
SELECT NombreActor --Consulta #7 (Nombre de los actores que interpretan a Peter Parker en peliculas)
FROM Aparece
WHERE Aparece.TipoActor = 'Interpreta' AND Aparece.NombreCompleto = 'Peter Paker' AND TituloMedio IN (
    		SELECT TituloMedio
    		FROM Pelicula);

SELECT TituloMedio --Consulta #8 (Videojuegos en lo que aparece Tony Stark o Steve Rogers, que sean de Accion y Aventura, y tengan "Lego" en el nombre)
FROM Aparece
WHERE Aparece.TituloMedio IN (
		SELECT TituloMedio 
		FROM Videojuego 
		WHERE TituloMedio LIKE '%Lego%' AND TipoJuego = 'Action-Adventure')
	AND (Aparece.NombreCompleto LIKE '%Tony Stark%' OR Aparece.NombreCompleto LIKE '%Steve Rogers%');
