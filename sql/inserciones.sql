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

