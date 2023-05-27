-- Table: Personaje
INSERT INTO Personaje(NombreCompleto, Genero, ColorPelo, ColorOjos, EstadoMarital, PrimeraAparicion, FraseCelebre) 
VALUES 
    ('Tony Stark', 'M', 'Black', 'Blue', 'Divorciado', '1963-03-01', 'I am Iron Man.'),
    ('Steve Rogers', 'M', 'Blonde', 'Blue', 'Soltero', '1941-03-01', 'I can do this all day.'),
    ('Natasha Romanoff', 'F', 'Red', 'Green', 'Soltero', '1964-04-01', 'I’m always picking up after you boys.'),
    ('Bruce Banner', 'M', 'Brown', 'Green', 'Soltero', '1962-05-01', 'That’s my secret, Captain. I’m always angry.'),
    ('Peter Parker', 'M', 'Brown', 'Hazel', 'Soltero', '1962-08-01', 'With great power, comes great responsibility.'),
    ('Johann Shmidt', 'M', 'Red', 'Blue', 'Soltero', '1941-03-06', 'Hail Hydra!'),
    ('Loki Laufeyson', 'M', 'Black', 'Green', 'Soltero', '1962-08-01', 'I am burdened with glorious purpose.'),
    ('Ultron', 'Desc', 'None', 'Red', 'Soltero', '1968-07-01', 'I am not a slave. I am not a man. I am... Ultron.'),
    ('Victor Von Doom', 'M', 'Brown', 'Brown', 'Soltero', '1962-07-01', 'I was a god, Valeria. I found it...beneath me.'),
    ('Erik Lehnsherr', 'M', 'White', 'Blue', 'Divorciado', '1963-09-01', 'I have been marked once, my dear, and let me assure you, no needle shall ever touch my skin again.'),
    ('Pepper Potts', 'F', 'Strawberry Blonde', 'Blue', 'Casado', '1963-09-01', 'I take care of Tony Stark. Tony Stark takes care of the rest of the world.'),
    ('Jane Foster', 'F', 'Blonde', 'Blue', 'Soltero', '1962-08-01', 'The answers are in the stars.'),
    ('May Parker', 'F', 'Silver', 'Blue', 'Viudo', '1962-08-01', 'You know, you were about six when you came to live with us. I wanna tell you, you were a handful.'),
    ('Gwen Stacy', 'F', 'Blonde', 'Blue', 'Soltero', '1965-06-01', 'I have learned that we must do what we must do.'),
    ('Betty Ross', 'F', 'Brown', 'Blue', 'Soltero', '1962-05-01', 'It must be difficult to be a man like you, always having to keep this part of yourself secret.'),
    ('Nick Fury', 'M', 'Brown', 'Brown', 'Viudo', '1963-05-01', 'The path of the righteous man...'),
    ('Reed Richards', 'M', 'Brown', 'Brown', 'Casado', '1961-11-01', 'Its clobbering time!'),
    ('Charles Xavier', 'M', 'Bald', 'Blue', 'Soltero', '1963-09-01', 'Mutation is not the end of the world, but a new beginning.'),
    ('Emil Blonsky', 'M', 'Black', 'Green', 'Soltero', '1967-05-01', 'There is no Abomination, only Blonsky!'),
    ('Norman Osborn', 'M', 'Red', 'Green', 'Viudo', '1964-07-01', 'We all wear masks, Spider-Man. But which one is real? The one that hides your face, or the one that is your face?');



-- Table: Organizacion
INSERT INTO Organizacion(Nombre, Slogan, Tipo, Objetivo, LugarCreacion, PrimeraAparicion, PersonajeLidera, NombreSede) 
VALUES 
    ('Avengers', 'Avengers Assemble', 'Superhéroes', 'Protect the world', 'New York', '1963-09-01', 'Tony Stark', 'Avengers Tower'),
    ('S.H.I.E.L.D.', 'Protection is our mission.', 'Civiles', 'Protect people from extraordinary threats', 'Washington D.C.', '1965-12-01', 'Nick Fury', 'Triskelion'),
    ('X-Men', 'Mutant and proud', 'Superhéroes', 'Fight for peaceful co-existence', 'New York', '1963-09-01', 'Charles Xavier', 'X-Mansion'),
    ('Hydra', 'Hail Hydra', 'Villanos', 'World domination', 'Germany', '1965-07-01', 'Johann Shmidt', 'Hydra Base'),
    ('Fantastic Four', '4 will change everything', 'Superhéroes', 'Protect the world', 'New York', '1961-11-01', 'Reed Richards', 'Baxter Building');


-- Table: Villano
INSERT INTO Villano(NombreCompleto, NombreVillano, Objetivo) 
VALUES 
    ('Johann Shmidt', 'Red Skull', 'World domination'),
    ('Loki Laufeyson', 'Loki', 'Rule Asgard'),
    ('Ultron', 'Ultron', 'Exterminate humanity'),
    ('Victor Von Doom', 'Doctor Doom', 'Rule the world'),
    ('Erik Lehnsherr', 'Magneto', 'Mutant superiority'),
    ('Emil Blonsky', 'Abomination', 'Destruction and power'),
    ('Norman Osborn', 'Green Goblin', 'Chaos and power');

-- Table: Heroe
INSERT INTO Heroe(NombreCompleto, NombreHeroe, Logotipo, VillanoRivaliza) 
VALUES 
    ('Tony Stark', 'Iron Man', 'Iron Man Helmet', 'Ultron'),
    ('Steve Rogers', 'Captain America', 'Captain America Shield', 'Johann Shmidt'),
    ('Natasha Romanoff', 'Black Widow', 'Black Widow Hourglass', 'Loki Laufeyson'),
    ('Bruce Banner', 'Hulk', 'Hulk Fist', 'Emil Blonsky'),
    ('Peter Parker', 'Spider-Man', 'Spider-Man Spider', 'Norman Osborn');

-- Table: Civil
INSERT INTO Civil(NombreCompleto) 
VALUES 
    ('Pepper Potts'),
    ('Jane Foster'),
    ('May Parker'),
    ('Gwen Stacy'),
    ('Betty Ross');

-- Table: Sede
INSERT INTO Sede(Nombre, NombreOrg, Ubicación, TipoEdificación) 
VALUES 
    ('Avengers Tower', 'Avengers', 'New York', 'Skyscraper'),
    ('Triskelion', 'S.H.I.E.L.D.', 'Washington D.C.', 'Fortress'),
    ('X-Mansion', 'X-Men', 'Westchester County, New York', 'Mansion'),
    ('Hydra Base', 'Hydra', 'Various', 'Military Base'),
    ('Baxter Building', 'Fantastic Four', 'New York', 'Skyscraper');

-- Table: Nacionalidad
INSERT INTO Nacionalidad(Pais, NombrePais) 
VALUES 
    ('USA', 'United States'),
    ('RUS', 'Russia'),
    ('DEU', 'Germany'),
    ('GBR', 'United Kingdom'),
    ('LAT','Latveria'),
    ('WAK', 'Wakanda');

-- Table: Objeto
INSERT INTO Objeto(Nombre, MaterialFab, TipoObjeto, Descripcion) 
VALUES 
    ('Mjolnir', 'Uru', 'Weapon', 'Hammer of Thor'),
    ('Iron Man Suit', 'Various, incl. titanium', 'Armor', 'Protective suit for Iron Man'),
    ('Captain America Shield', 'Vibranium', 'Shield', 'Shield used by Captain America'),
    ('Infinity Gauntlet', 'Uru', 'Weapon', 'Gauntlet designed to hold six of the "soul gems"'),
    ('Web-Shooters', 'Various', 'Device', 'Spider-Man`s tool for web shooting');

-- Table: Poder
INSERT INTO Poder(Nombre, Descripcion) 
VALUES 
    ('Super Strength', 'Ability to exert great force'),
    ('Flight', 'Ability to fly'),
    ('Invulnerability', 'Immunity to harm or damage'),
    ('Telepathy', 'Ability to read or control minds'),
    ('Regeneration', 'Ability to heal rapidly from physical injuries');

-- Table: Combate
INSERT INTO Combate(Fecha, Lugar) 
VALUES 
    ('2012-05-04', 'New York'),
    ('2015-05-01', 'Sokovia'),
    ('2016-05-06', 'Leipzig/Halle Airport, Germany'),
    ('2018-04-27', 'Wakanda'),
    ('2019-04-26', 'Destroyed Avengers compound');

-- Table: Medio
INSERT INTO Medio(TituloMedio, FechaEstrM, CompaniaProdM, RatingM, SinposisM) 
VALUES 
    ('Avengers: Endgame', '2019-04-26', 'Marvel Studios', 4.5, 'The Avengers take a final stand against Thanos in Marvel Studios'' conclusion to 22 films, "Avengers: Endgame".'),
    ('Spider-Man: Homecoming', '2017-07-07', 'Marvel Studios', 4, 'Peter Parker balances his life as an ordinary high school student in Queens with his superhero alter-ego Spider-Man.'),
    ('Black Panther', '2018-02-16', 'Marvel Studios', 4.3, 'T''Challa, the new ruler of the advanced kingdom of Wakanda, must defend his land from being torn apart by enemies from outside and inside the country.'),
    ('The Falcon and The Winter Soldier', '2021-03-19', 'Marvel Studios', 4, 'Falcon and the Winter Soldier are a mismatched duo who team up for a global adventure that will test their survival skills.'),
    ('Marvel''s Spider-Man', '2018-09-07', 'Insomniac Games', 4.7, 'Peter Parker with eight years of crime fighting experience under his belt, now struggles to balance his work-life with his superhero life.');

-- Table: Pelicula
INSERT INTO Pelicula(Director, Duracion, Distribuidor, TipoPelicula, CosteProd, Ganancias, TituloMedio) 
VALUES 
    ('Anthony Russo, Joe Russo', 181, 'Walt Disney Studios Motion Pictures', 'Superhero', 356000000, 2797800564, 'Avengers: Endgame'),
    ('Jon Watts', 133, 'Sony Pictures Releasing', 'Superhero', 175000000, 880166924, 'Spider-Man: Homecoming'),
    ('Ryan Coogler', 134, 'Walt Disney Studios Motion Pictures', 'Superhero', 200000000, 1346913161, 'Black Panther');

-- Table: Serie
INSERT INTO Serie(Creador, TotalEpi, CanalTrans, Tipo, TituloMedio) 
VALUES 
    ('Malcolm Spellman', 6, 'Disney+', 'Superhero', 'The Falcon and The Winter Soldier');

-- Table: Videojuego
INSERT INTO Videojuego(TipoJuego, CompaniaPub, TituloMedio) 
VALUES 
    ('Action-Adventure', 'Sony Interactive Entertainment', 'Marvel''s Spider-Man');


-- Table: Tiene
INSERT INTO Tiene(NombreCompleto, Pais) 
VALUES 
    ('Tony Stark', 'USA'),
    ('Steve Rogers', 'USA'),
    ('Natasha Romanoff', 'RUS'),
    ('Bruce Banner', 'USA'),
    ('Peter Parker', 'USA'),
    ('Johann Shmidt', 'DEU'),
    ('Loki Laufeyson', 'DEU'),
    ('Ultron', 'GBR'),
    ('Victor Von Doom', 'LAT'),
    ('Erik Lehnsherr', 'DEU'),
    ('Pepper Potts', 'USA'),
    ('Jane Foster', 'USA'),
    ('May Parker', 'USA'),
    ('Gwen Stacy', 'USA'),
    ('Betty Ross', 'USA'),
    ('Nick Fury', 'USA'),
    ('Reed Richards', 'USA'),
    ('Charles Xavier', 'USA'),
    ('Emil Blonsky', 'RUS'),
    ('Norman Osborn', 'USA');

-- Table: Conoce
INSERT INTO Conoce(Heroe, Civil)
VALUES
    ('Tony Stark', 'Pepper Potts'),
    ('Tony Stark', 'Jane Foster'),
    ('Tony Stark', 'May Parker'),
    ('Steve Rogers', 'Jane Foster'),
    ('Bruce Banner', 'Betty Ross');

-- Table: Trata
INSERT INTO Trata(Villano, Civil)
VALUES
    ('Ultron', 'Pepper Potts'),
    ('Johann Shmidt', 'Jane Foster'),
    ('Loki Laufeyson', 'May Parker'),
    ('Emil Blonsky', 'Gwen Stacy'),
    ('Norman Osborn', 'Betty Ross');

-- Table: Aparece
INSERT INTO Aparece(NombreCompleto, TituloMedio, NombreActor, Rol, TipoActor)
VALUES
    ('Tony Stark', 'Avengers: Endgame', 'Robert Downey Jr.', 'Protagonista', 'Interpreta'),
    ('Steve Rogers', 'Avengers: Endgame', 'Chris Evans', 'Protagonista', 'Interpreta'),
    ('Natasha Romanoff', 'Avengers: Endgame', 'Scarlett Johansson', 'Protagonista', 'Interpreta'),
    ('Bruce Banner', 'Avengers: Endgame', 'Mark Ruffalo', 'Protagonista', 'Interpreta'),
    ('Peter Parker', 'Spider-Man: Homecoming', 'Tom Holland', 'Protagonista', 'Interpreta'),
    ('Peter Parker', 'Marvel''s Spider-Man', 'Yuri Lowenthal', 'Protagonista', 'Presta su voz');

-- Table: Interviene
INSERT INTO Interviene(NombreOrg, TituloMedio, Rol, EstadoFinal)
VALUES
    ('Avengers', 'Avengers: Endgame', 'Protagonista', 'Unknown'),
    ('S.H.I.E.L.D.', 'Avengers: Endgame', 'Secundario', 'Unknown'),
    ('X-Men', 'Avengers: Endgame', 'Secundario', 'Unknown'),
    ('Hydra', 'Avengers: Endgame', 'Enemiga', 'Unknown'),
    ('Fantastic Four', 'Avengers: Endgame', 'Secundario', 'Unknown'),
    ('Avengers', 'Spider-Man: Homecoming', 'Secundario', 'Unknown'),
    ('S.H.I.E.L.D.', 'Spider-Man: Homecoming', 'Secundario', 'Unknown'),
    ('X-Men', 'Spider-Man: Homecoming', 'Secundario', 'Unknown'),
    ('Hydra', 'Spider-Man: Homecoming', 'Enemiga', 'Unknown'),
    ('Fantastic Four', 'Spider-Man: Homecoming', 'Secundario', 'Unknown'),
    ('Avengers', 'Black Panther', 'Secundario', 'Unknown'),
    ('S.H.I.E.L.D.', 'Black Panther', 'Secundario', 'Unknown'),
    ('X-Men', 'Black Panther', 'Secundario', 'Unknown'),
    ('Hydra', 'Black Panther', 'Enemiga', 'Unknown'),
    ('Fantastic Four', 'Black Panther', 'Secundario', 'Unknown'),
    ('Avengers', 'The Falcon and The Winter Soldier', 'Secundario', 'Unknown'),
    ('S.H.I.E.L.D.', 'The Falcon and The Winter Soldier', 'Secundario', 'Unknown'),
    ('X-Men', 'The Falcon and The Winter Soldier', 'Secundario', 'Unknown'),
    ('Hydra', 'The Falcon and The Winter Soldier', 'Enemiga', 'Unknown'),
    ('Fantastic Four', 'The Falcon and The Winter Soldier', 'Secundario', 'Unknown'),
    ('Avengers', 'Marvel''s Spider-Man', 'Secundario', 'Unknown'),
    ('S.H.I.E.L.D.', 'Marvel''s Spider-Man', 'Secundario', 'Unknown'),
    ('X-Men', 'Marvel''s Spider-Man', 'Secundario', 'Unknown'),
    ('Hydra', 'Marvel''s Spider-Man', 'Enemiga', 'Unknown'),
    ('Fantastic Four', 'Marvel''s Spider-Man', 'Secundario', 'Unknown');

-- Table: Pertenece
INSERT INTO Pertenece(NombreCompleto, NombreOrg, Cargo, Fecha)
VALUES
    ('Tony Stark', 'Avengers', 'Iron Man', '1963-09-01'),
    ('Steve Rogers', 'Avengers', 'Captain America', '1941-03-01'),
    ('Natasha Romanoff', 'Avengers', 'Black Widow', '1964-04-01'),
    ('Bruce Banner', 'Avengers', 'Hulk', '1962-05-01'),
    ('Peter Parker', 'Avengers', 'Spider-Man', '1962-08-01'),
    ('Tony Stark', 'S.H.I.E.L.D.', 'Founder', '1965-12-01'),
    ('Nick Fury', 'S.H.I.E.L.D.', 'Director', '1965-12-01'),
    ('Charles Xavier', 'X-Men', 'Professor X', '1963-09-01'),
    ('Johann Shmidt', 'Hydra', 'Leader', '1965-07-01'),
    ('Reed Richards', 'Fantastic Four', 'Mr. Fantastic', '1961-11-01');

-- Table: Porta
INSERT INTO Porta(NombreCompleto, NombreObj)
VALUES
    ('Tony Stark', 'Iron Man Suit'),
    ('Steve Rogers', 'Captain America Shield'),
    ('Peter Parker', 'Web-Shooters');

-- Table: Posee
INSERT INTO Posee(NombreCompleto, NombrePoder, FormaObtencion)
VALUES
    ('Tony Stark', 'Super Strength', 'Artificial'),
    ('Tony Stark', 'Flight', 'Artificial'),
    ('Steve Rogers', 'Super Strength', 'Artificial'),
    ('Steve Rogers', 'Invulnerability', 'Artificial'),
    ('Natasha Romanoff', 'Super Strength', 'Artificial'),
    ('Natasha Romanoff', 'Telepathy', 'Artificial'),
    ('Bruce Banner', 'Super Strength', 'Artificial'),
    ('Bruce Banner', 'Regeneration', 'Artificial'),
    ('Peter Parker', 'Super Strength', 'Natural'),
    ('Peter Parker', 'Flight', 'Natural'),
    ('Johann Shmidt', 'Super Strength', 'Artificial'),
    ('Johann Shmidt', 'Telepathy', 'Artificial'),
    ('Loki Laufeyson', 'Super Strength', 'Artificial'),
    ('Loki Laufeyson', 'Flight', 'Artificial'),
    ('Ultron', 'Flight', 'Artificial'),
    ('Ultron', 'Invulnerability', 'Artificial'),
    ('Victor Von Doom', 'Super Strength', 'Artificial'),
    ('Victor Von Doom', 'Telepathy', 'Artificial'),
    ('Erik Lehnsherr', 'Super Strength', 'Natural'),
    ('Erik Lehnsherr', 'Flight', 'Natural'),
    ('Pepper Potts', 'Super Strength', 'Artificial'),
    ('Pepper Potts', 'Telepathy', 'Artificial'),
    ('Jane Foster', 'Flight', 'Artificial'),
    ('Jane Foster', 'Telepathy', 'Artificial'),
    ('May Parker', 'Super Strength', 'Natural'),
    ('May Parker', 'Regeneration', 'Natural'),
    ('Gwen Stacy', 'Super Strength', 'Artificial'),
    ('Gwen Stacy', 'Flight', 'Artificial'),
    ('Betty Ross', 'Super Strength', 'Artificial'),
    ('Betty Ross', 'Invulnerability', 'Artificial'),
    ('Nick Fury', 'Telepathy', 'Artificial'),
    ('Nick Fury', 'Regeneration', 'Artificial'),
    ('Reed Richards', 'Super Strength', 'Artificial'),
    ('Reed Richards', 'Flight', 'Artificial'),
    ('Charles Xavier', 'Telepathy', 'Natural'),
    ('Charles Xavier', 'Regeneration', 'Natural'),
    ('Emil Blonsky', 'Super Strength', 'Artificial'),
    ('Emil Blonsky', 'Invulnerability', 'Artificial'),
    ('Norman Osborn', 'Flight', 'Artificial'),
    ('Norman Osborn', 'Telepathy', 'Artificial');

INSERT INTO ParticipaObj(NombreCompleto, FechaCombate, LugarComb, Nombre)
VALUES
    ('Tony Stark', '2022-05-01', 'New York', 'Iron Man Suit'),
    ('Steve Rogers', '1945-04-30', 'New York', 'Captain America Shield'),
    ('Natasha Romanoff', '2019-04-26', 'New York', 'Infinity Gauntlet'),
    ('Bruce Banner', '2012-05-04', 'New York', 'Mjolnir'),
    ('Peter Parker', '2024-05-01', 'New York', 'Web-Shooters'),
    ('Johann Shmidt', '1945-03-03', 'Germany', 'Captain America Shield'),
    ('Loki Laufeyson', '2012-05-04', 'New York', 'Captain America Shield'),
    ('Ultron', '2015-05-01', 'Sokovia', 'Iron Man Suit'),
    ('Victor Von Doom', '2023-04-01', 'New York', 'Iron Man Suit'),
    ('Erik Lehnsherr', '2011-05-03', 'Cuba', 'Mjolnir'),
    ('Pepper Potts', '2019-04-26', 'New York', 'Iron Man Suit'),
    ('Jane Foster', '2013-11-08', 'London', 'Mjolnir'),
    ('May Parker', '2012-05-04', 'New York', 'Captain America Shield'),
    ('Gwen Stacy', '2014-05-02', 'New York', 'Web-Shooters'),
    ('Betty Ross', '2008-06-13', 'Harlem', 'Captain America Shield'),
    ('Nick Fury', '2012-05-04', 'New York', 'Iron Man Suit'),
    ('Reed Richards', '2007-06-15', 'New York', 'Captain America Shield'),
    ('Charles Xavier', '2000-07-14', 'New York', 'Infinity Gauntlet'),
    ('Emil Blonsky', '2008-06-13', 'Harlem', 'Captain America Shield'),
    ('Norman Osborn', '2002-11-14', 'New York', 'Iron Man Suit');


-- Table: ParticipaPod
INSERT INTO ParticipaPod(NombreCompleto, NombrePoder, FechaCombate, LugarComb)
VALUES
    ('Tony Stark', 'Super Strength', '2022-05-01', 'New York'),
    ('Tony Stark', 'Flight', '2022-05-01', 'New York'),
    ('Steve Rogers', 'Super Strength', '1945-04-30', 'New York'),
    ('Natasha Romanoff', 'Regeneration', '2019-04-26', 'New York'),
    ('Bruce Banner', 'Regeneration', '2012-05-04', 'New York'),
    ('Peter Parker', 'Super Strength', '2024-05-01', 'New York'),
    ('Peter Parker', 'Flight', '2024-05-01', 'New York'),
    ('Johann Shmidt', 'Super Strength', '1945-03-03', 'Germany'),
    ('Loki Laufeyson', 'Telepathy', '2012-05-04', 'New York'),
    ('Ultron', 'Flight', '2015-05-01', 'Sokovia'),
    ('Victor Von Doom', 'Flight', '2023-04-01', 'New York'),
    ('Erik Lehnsherr', 'Super Strength', '2011-05-03', 'Cuba'),
    ('Pepper Potts', 'Flight', '2019-04-26', 'New York'),
    ('Jane Foster', 'Regeneration', '2013-11-08', 'London'),
    ('May Parker', 'Regeneration', '2012-05-04', 'New York'),
    ('Gwen Stacy', 'Super Strength', '2014-05-02', 'New York'),
    ('Gwen Stacy', 'Flight', '2014-05-02', 'New York'),
    ('Betty Ross', 'Regeneration', '2008-06-13', 'Harlem'),
    ('Nick Fury', 'Telepathy', '2012-05-04', 'New York'),
    ('Reed Richards', 'Telepathy', '2007-06-15', 'New York'),
    ('Charles Xavier', 'Telepathy', '2000-07-14', 'New York'),
    ('Emil Blonsky', 'Super Strength', '2008-06-13', 'Harlem'),
    ('Emil Blonsky', 'Regeneration', '2008-06-13', 'Harlem'),
    ('Norman Osborn', 'Regeneration', '2002-11-14', 'New York');

