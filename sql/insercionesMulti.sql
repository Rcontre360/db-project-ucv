-- ColoresTrajeHeroe
INSERT INTO ColoresTrajeHeroe (NombreHeroe, ColorTraje)
VALUES 
    ('Iron Man', 'Rojo'),
    ('Iron Man', 'Dorado'),
    ('Captain America', 'Azul'),
    ('Captain America', 'Blanco'),
    ('Captain America', 'Rojo'),
    ('Black Widow', 'Negro'),
    ('Hulk', 'Verde'),
    ('Hulk', 'Morado'),
    ('Spider-Man', 'Rojo'),
    ('Spider-Man', 'Azul');

-- EnemigoVillano
INSERT INTO EnemigoVillano (NombreVillano, Enemigo)
VALUES 
    ('Red Skull', 'Captain America'),
    ('Loki', 'Thor'),
    ('Ultron', 'The Avengers'),
    ('Doctor Doom', 'The Avengers'),
    ('Magneto', 'X-Men'),
    ('Abomination', 'Hulk'),
    ('Green Goblin', 'Spider-Man');

-- OcupacionPersonaje
INSERT INTO OcupacionPersonaje (NombrePersonaje, Ocupacion)
VALUES 
    ('Tony Stark', 'Empresario'),
    ('Tony Stark', 'Inventor'),
    ('Steve Rogers', 'Soldado'),
    ('Natasha Romanoff', 'Espía'),
    ('Natasha Romanoff', 'Agente de inteligencia'),
    ('Bruce Banner', 'Científico'),
    ('Peter Parker', 'Estudiante'),
    ('Peter Parker', 'Fotógrafo'),
    ('Johann Shmidt', 'Supremacista'),
    ('Johann Shmidt', 'Líder terrorista'),
    ('Loki Laufeyson', 'Dios de las travesuras' ),
    ('Ultron', 'Inteligencia artificial malévola'),
    ('Victor Von Doom', 'Científico'),
    ('Victor Von Doom', 'Gobernante de Latveria'),
    ('Erik Lehnsherr', 'Mutante'),
    ('Erik Lehnsherr', 'Líder de la Hermandad de Mutantes'),
    ('Pepper Potts', 'CEO de Stark Industries'),
    ('Pepper Potts', 'Asistente de Tony Stark'),
    ('Jane Foster', 'Científica'),
    ('May Parker', 'Tía de Peter Parker'),
    ('Gwen Stacy', 'Estudiante'),
    ('Betty Ross', 'Científica'),
    ('Nick Fury', 'Director de S.H.I.E.L.D.'),
    ('Nick Fury', 'Espía'),
    ('Nick Fury', 'Estratega'),
    ('Reed Richards', 'Científico'),
    ('Reed Richards', 'Líder de los Cuatro Fantásticos'),
    ('Charles Xavier', 'Mutante'),
    ('Charles Xavier', 'Fundador y líder de los X-Men'),
    ('Emil Blonsky', 'Soldado'),
    ('Norman Osborn', 'Empresario');

-- CreadorPersonaje
INSERT INTO CreadorPersonaje (NombrePersonaje, Creador)
VALUES 
    ('Tony Stark', 'Stan Lee'),
    ('Tony Stark', 'Larry Lieber'),
    ('Tony Stark', 'Don Heck'),
    ('Tony Stark', 'Jack Kirby'),
    ('Steve Rogers', 'Joe Simon'),
    ('Steve Rogers', 'Jack Kirby'),
    ('Natasha Romanoff', 'Stan Lee'),
    ('Natasha Romanoff', 'Don Rico'),
    ('Natasha Romanoff', 'Don Heck'),
    ('Bruce Banner', 'Stan Lee'),
    ('Bruce Banner', 'Jack Kirby'),
    ('Peter Parker', 'Stan Lee'),
    ('Peter Parker', 'Steve Ditko'),
    ('Johann Shmidt', 'Joe Simon'),
    ('Johann Shmidt', 'Jack Kirby'),
    ('Loki Laufeyson', 'Stan Lee' ),
    ('Loki Laufeyson', 'Larry Lieber' ),
    ('Loki Laufeyson', 'Jack Kirby' ),
    ('Ultron', 'Roy Thomas'),
    ('Ultron', 'John Buscema'),
    ('Victor Von Doom', 'Stan Lee'),
    ('Victor Von Doom', 'Jack Kirby'),
    ('Erik Lehnsherr', 'Stan Lee'),
    ('Erik Lehnsherr', 'Jack Kirby'),
    ('Pepper Potts', 'Stan Lee'),
    ('Pepper Potts', 'Don Heck'),
    ('Pepper Potts', 'Robert Bernstein'),
    ('Jane Foster', 'Stan Lee'),
    ('Jane Foster', 'Jack Kirby'),
    ('May Parker', 'Stan Lee'),
    ('May Parker', 'Steve Ditko'),
    ('Gwen Stacy', 'Stan Lee'),
    ('Gwen Stacy', 'Steve Ditko'),
    ('Betty Ross', 'Stan Lee'),
    ('Betty Ross', 'Jack Kirby'),
    ('Nick Fury', 'Stan Lee'),
    ('Nick Fury', 'Jack Kirby'),
    ('Reed Richards', 'Stan Lee'),
    ('Reed Richards', 'Jack Kirby'),
    ('Charles Xavier', 'Stan Lee'),
    ('Charles Xavier', 'Jack Kirby'),
    ('Emil Blonsky', 'Stan Lee'),
    ('Emil Blonsky', 'Gil Kane'),
    ('Norman Osborn', 'Stan Lee'),
    ('Norman Osborn', 'Steve Ditko');

-- PlataformasVideojuego
INSERT INTO PlataformasVideojuego (Videojuego, Plataforma)
VALUES 
    ('Marvel''s Spider-Man', 'PlayStation 4');

-- CreadorObjeto
INSERT INTO CreadorObjeto (NombreObj, Creador)
VALUES 
    ('Mjolnir', 'Stan Lee'),
    ('Iron Man Suit', 'Stan Lee'),
    ('Captain America Shield', 'Joe Simon'),
    ('Infinity Gauntlet', 'Jim Starlin'),
    ('Infinity Gauntlet', 'George Pérez'),
    ('Web-Shooters', 'Stan Lee');
