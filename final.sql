
CREATE TABLE Personaje (
    NombreCompleto VARCHAR(255) PRIMARY KEY,
    Genero VARCHAR(50) CHECK (Genero IN ('M', 'F', 'Desc', 'Otro')), --Restricción 2 Ítem a) : El género debe ser “M”, “F”, “Desc”, “Otro”
    ColorPelo VARCHAR(50),
    ColorOjos VARCHAR(50),
    EstadoMarital VARCHAR(50) CHECK (EstadoMarital IN ('Soltero', 'Casado', 'Viudo', 'Divorciado')), --Restricción 3 Ítem a) : El estado marital debe ser “Soltero”, “Casado”, “Viudo”, “Divorciado”
    PrimeraAparicion DATE,
    FraseCelebre VARCHAR(255)
);

CREATE TABLE Organizacion (
    Nombre VARCHAR(255) PRIMARY KEY,
    Slogan VARCHAR(255),
    Tipo VARCHAR(255) CHECK (Tipo IN('Superhéroes','Villanos','Civiles')), --Se agregó esta restricción de acuerdo al ítem c)
    Objetivo VARCHAR(255),
    LugarCreacion VARCHAR(255),
    PrimeraAparicion DATE,
    PersonajeLidera VARCHAR(255),
    NombreSede VARCHAR(255),
    FOREIGN KEY (PersonajeLidera) REFERENCES Personaje(NombreCompleto)
);

CREATE TABLE Villano(
    NombreCompleto VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    NombreVillano VARCHAR(255),
    Objetivo VARCHAR(255)
);

CREATE TABLE Heroe (
    NombreCompleto VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    NombreHeroe VARCHAR(255),
    Logotipo VARCHAR(255),
    VillanoRivaliza VARCHAR(255) UNIQUE, --Restricción 7 Ítem a) : El sistema debe garantizar que cada héroe tiene un solo archienemigo.
    FOREIGN KEY (VillanoRivaliza) REFERENCES Villano(NombreCompleto)
);

CREATE TABLE Civil(
    NombreCompleto VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto)
);

CREATE TABLE Sede (
    Nombre varchar(255) NOT NULL,
    NombreOrg varchar(255) NOT NULL,
    Ubicación varchar(255),
    TipoEdificación varchar(255),

    PRIMARY KEY (Nombre,NombreOrg),
    FOREIGN KEY (NombreOrg) REFERENCES Organizacion(Nombre)
);

CREATE TABLE Nacionalidad (
    Pais VARCHAR(255) PRIMARY KEY,
    NombrePais VARCHAR(255)
);

CREATE TABLE Objeto (
    Nombre VARCHAR(255) PRIMARY KEY,
    MaterialFab VARCHAR(255),
    TipoObjeto VARCHAR(255),
    Descripcion VARCHAR(255)
);

CREATE TABLE Poder (
    Nombre VARCHAR(255) PRIMARY KEY,
    Descripcion VARCHAR(255)
);

CREATE TABLE Combate (
    Fecha DATE,
    Lugar VARCHAR(255),
    PRIMARY KEY (Fecha, Lugar)
);

CREATE TABLE Medio (
    TituloMedio VARCHAR(255) PRIMARY KEY,
    FechaEstrM DATE,
    CompaniaProdM VARCHAR(255),
    RatingM NUMERIC CHECK (RatingM >= 1 AND RatingM <= 5), --Restricción 1 Ítem a) : El Rating de un medio debe estar entre 1 y 5
    SinposisM TEXT
);

CREATE TABLE Pelicula (
    Director VARCHAR(255),
    Duracion NUMERIC,
    Distribuidor VARCHAR(255),
    TipoPelicula VARCHAR(255) CHECK (TipoPelicula IN('Superhéroe','Animada')), --Se agregó esta restricción de acuerdo al ítem c)
    CosteProd NUMERIC,
    Ganancias NUMERIC,

    TituloMedio VARCHAR(255) PRIMARY KEY REFERENCES Medio(TituloMedio)
);

CREATE TABLE Serie (
    Creador VARCHAR(255),
    TotalEpi INTEGER,
    CanalTrans VARCHAR(255),
    Tipo VARCHAR(255),
    TituloMedio VARCHAR(255) PRIMARY KEY REFERENCES Medio(TituloMedio)
);

CREATE TABLE Videojuego (
    TipoJuego VARCHAR(255),
    CompaniaPub VARCHAR(255),
    TituloMedio VARCHAR(255) PRIMARY KEY REFERENCES Medio(TituloMedio)
);

CREATE OR REPLACE FUNCTION verificar_ganancias() --Restricción 8 Ítem a) : Si el costo de producción es mayor que las ganancias, dar un mensaje (trigger).
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.CosteProd > NEW.Ganancias THEN
        RAISE EXCEPTION 'El costo de producción es mayor que las ganancias.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER costo_vs_ganancias_trigger
BEFORE INSERT OR UPDATE ON Pelicula
FOR EACH ROW
EXECUTE FUNCTION verificar_ganancias();



CREATE TABLE Tiene (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Pais VARCHAR(255) REFERENCES Nacionalidad(Pais),
    PRIMARY KEY (NombreCompleto, Pais)
);

CREATE TABLE Conoce(
    Heroe VARCHAR(255) REFERENCES Heroe(NombreCompleto),
    Civil VARCHAR(255) REFERENCES Civil(NombreCompleto),
    PRIMARY KEY (Heroe,Civil)
);

CREATE TABLE Trata(
    Villano VARCHAR(255) REFERENCES Villano(NombreCompleto),
    Civil VARCHAR(255) REFERENCES Civil(NombreCompleto),
    PRIMARY KEY (Villano,Civil)
);

CREATE TABLE Aparece (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    TituloMedio VARCHAR(255) REFERENCES Medio(TituloMedio),
    NombreActor VARCHAR(255),
    Rol VARCHAR(255) CHECK (Rol IN ('Protagonista', 'Antagonista', 'Secundario')), --Restricción 4 Ítem a) :Los tipos de personajes deben ser protagonistas, antagonistas o secundarios
    TipoActor VARCHAR(255) CHECK (TipoActor IN ('Interpreta', 'Presta su voz')),--Restricción 5 Ítem a) : Los tipos de actor son “Interpreta”, “presta su voz”
    PRIMARY KEY (NombreCompleto, TituloMedio)
);

CREATE TABLE Interviene (
    NombreOrg VARCHAR(255) REFERENCES Organizacion(Nombre),
    TituloMedio VARCHAR(255) REFERENCES Medio(TituloMedio),

    Rol VARCHAR(255) CHECK (Rol IN ('Protagonista', 'Enemiga', 'Secundario')),
    EstadoFinal VARCHAR(255),

    PRIMARY KEY (NombreOrg, TituloMedio)
);

CREATE TABLE Pertenece (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombreOrg VARCHAR(255) REFERENCES Organizacion(Nombre),
    Cargo VARCHAR(255) NOT NULL, --Restricción 6 Ítem a) : Los cargos no pueden ser nulos.
    Fecha DATE,
    PRIMARY KEY (NombreCompleto, NombreOrg, Cargo, Fecha)
);

CREATE TABLE Porta (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombreObj VARCHAR(255) REFERENCES Objeto(Nombre),
    PRIMARY KEY (NombreCompleto, NombreObj)
);

CREATE TABLE Posee (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombrePoder VARCHAR(255) REFERENCES Poder(Nombre),
    FormaObtencion VARCHAR(255) CHECK (FormaObtencion IN ('Hereditario', 'Artificial', 'Natural')),
    PRIMARY KEY (NombreCompleto, NombrePoder)
);


CREATE TABLE ParticipaObj (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    FechaCombate DATE,
    LugarComb VARCHAR(255),
    Nombre VARCHAR(255) REFERENCES Objeto(Nombre),
    PRIMARY KEY (NombreCompleto, FechaCombate, LugarComb, Nombre)
);

CREATE TABLE ParticipaPod (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombrePoder VARCHAR(255) REFERENCES Poder(Nombre),
    FechaCombate DATE,
    LugarComb VARCHAR(255),
    PRIMARY KEY (NombreCompleto, NombrePoder, FechaCombate, LugarComb)
);



CREATE TABLE ColoresTrajeHeroe(
    NombreHeroe VARCHAR(255),
    ColorTraje VARCHAR(255),

    FOREIGN KEY (NombreHeroe) REFERENCES Personaje(NombreCompleto),
    PRIMARY KEY (NombreHeroe,ColorTraje)
);

CREATE TABLE EnemigoVillano(
    NombreVillano VARCHAR(255),
    Enemigo VARCHAR(255),

    FOREIGN KEY (NombreVillano) REFERENCES Personaje(NombreCompleto),
    PRIMARY KEY (NombreVillano,Enemigo)
);

CREATE TABLE OcupacionPersonaje(
    NombrePersonaje VARCHAR(255),
    Ocupacion VARCHAR(255),

    FOREIGN KEY (NombrePersonaje) REFERENCES Personaje(NombreCompleto),
    PRIMARY KEY (NombrePersonaje,Ocupacion)
);

CREATE TABLE CreadorPersonaje(
    NombrePersonaje VARCHAR(255),
    Creador VARCHAR(255),

    FOREIGN KEY (NombrePersonaje) REFERENCES Personaje(NombreCompleto),
    PRIMARY KEY (NombrePersonaje,Creador)
);

CREATE TABLE PlataformasVideojuego(
    Videojuego VARCHAR(255),
    Plataforma VARCHAR(255),

    FOREIGN KEY (Videojuego) REFERENCES Medio(TituloMedio),
    PRIMARY KEY (Videojuego,Plataforma)
);

CREATE TABLE CreadorObjeto (
    NombreObj VARCHAR(255),
    Creador VARCHAR(255),

    FOREIGN KEY (NombreObj) REFERENCES Objeto(Nombre),
    PRIMARY KEY (NombreObj, Creador)
);

-- Table: Personaje
INSERT INTO Personaje(NombreCompleto, Genero, ColorPelo, ColorOjos, EstadoMarital, PrimeraAparicion, FraseCelebre) 
VALUES 
    ('Tony Stark', 'M', 'Black', 'Blue', 'Divorciado', '1963-03-01', 'I am Iron Man.'),
    ('Steve Rogers', 'M', 'Blonde', 'Blue', 'Soltero', '1941-03-01', 'I can do this all day.'),
    ('Groot', 'M', 'Marrón', 'Marrón', 'Soltero', '1960-11-13', 'I am Groot.'),
    ('Thor Odinson', 'M', 'Rubio', 'Azul', 'Soltero', '1962-08-01', 'BRING ME THANOS!'),
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
    ('Cain Marko', 'M', 'Pelirrojo', 'Azul', 'Soltero', '1965-07-01', 'Nothing can stop the Juggernaut!'),
    ('Thanos', 'M', 'Ninguno', 'Desconocido', 'Soltero', '1973-02-01', 'I am inevitable.'),
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
    ('Thanos', 'Thanos', 'Balance'),
    ('Cain Marko', 'Juggernaut', 'Destruction and power'),
    ('Norman Osborn', 'Green Goblin', 'Chaos and power');

-- Table: Heroe
INSERT INTO Heroe(NombreCompleto, NombreHeroe, Logotipo, VillanoRivaliza) 
VALUES 
    ('Tony Stark', 'Iron Man', 'Iron Man Helmet', 'Ultron'),
    ('Steve Rogers', 'Captain America', 'Captain America Shield', 'Johann Shmidt'),
    ('Thor Odinson', 'Thor', 'Thors hammer', 'Loki Laufeyson'),
    ('Natasha Romanoff', 'Black Widow', 'Black Widow Hourglass', 'Victor Von Doom'),
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
    ('Eye Patch', 'Leather', 'Health', 'Eye patch for those who lost an eye'),
    ('Web-Shooters', 'Various', 'Device', 'Spider-Man`s tool for web shooting');

-- Table: Poder
INSERT INTO Poder(Nombre, Descripcion) 
VALUES 
    ('Super Strength', 'Ability to exert great force'),
    ('Flight', 'Ability to fly'),
    ('Invulnerability', 'Immunity to harm or damage'),
    ('Telepathy', 'Ability to read or control minds'),
    ('ShapeShift', 'Ability change body form or how is perceived'),
    ('Magic', 'Ability to cast spells and other forms of magic'),
    ('Magnetism Manipulation', 'Ability to control magnetic fields'),
    ('Elasticity', 'Super human Elasticity'),
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
    ('Marvel''s Spider-Man', '2018-09-07', 'Insomniac Games', 4.7, 'Peter Parker with eight years of crime fighting experience under his belt, now struggles to balance his work-life with his superhero life.'),
    ('Guardians of the Galaxy', '2014-08-01', 'Marvel Studios', 4.2, 'A group of intergalactic misfits team up to save the galaxy from a powerful villain.'),
    ('The Death of Spider-Man', '2011-06-28', 'Marvel Animation', 4.2, 'In this animated film, Spider-Man faces his greatest challenge yet as he goes up against a deadly enemy who threatens his very existence.'),
    ('Avengers Confidential: Black Widow & Punisher', '2014-03-25', 'Marvel Animation', 3.8, 'Black Widow and the Punisher team up to take down a dangerous terrorist organization in this action-packed animated adventure.'),
    ('Spider-Man: Into the Spider-Verse', '2018-12-14', 'Sony Pictures Releasing', 4.6, 'Miles Morales discovers the limitless possibilities of the Spider-Verse as he teams up with various versions of Spider-Man from different dimensions to save their worlds.');

-- Table: Pelicula
INSERT INTO Pelicula(Director, Duracion, Distribuidor, TipoPelicula, CosteProd, Ganancias, TituloMedio) 
VALUES 
    ('Anthony Russo, Joe Russo', 181, 'Walt Disney Studios Motion Pictures', 'Superhéroe', 356000000, 2797800564, 'Avengers: Endgame'),
    ('Jon Watts', 133, 'Sony Pictures Releasing', 'Superhéroe', 175000000, 880166924, 'Spider-Man: Homecoming'),
    ('Ryan Coogler', 134, 'Walt Disney Studios Motion Pictures', 'Superhéroe', 200000000, 1346913161, 'Black Panther'),
    ('James Gunn', 136, 'Walt Disney Studios Motion Pictures', 'Superhéroe', 200000000, 863756051, 'Guardians of the Galaxy'),
    ('Sam Liu', 158, 'Marvel Animation', 'Animada', 4000000, 36600000, 'The Death of Spider-Man'),
    ('Jay Oliva', 81, 'Marvel Animation', 'Animada', 3000000, 59000000, 'Avengers Confidential: Black Widow & Punisher'),
    ('Bob Persichetti, Peter Ramsey, Rodney Rothman', 153, 'Sony Pictures Releasing', 'Animada', 90000000, 1375540831, 'Spider-Man: Into the Spider-Verse');

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
    ('Cain Marko', 'USA'),
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
    ('Thor Odinson', 'Jane Foster'),
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
    ('Thor Odinson', 'Avengers: Endgame', 'Christopher Hemsworth', 'Protagonista', 'Interpreta'),
    ('Groot', 'Avengers: Endgame', 'Vin Diesel', 'Protagonista', 'Interpreta'),
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
    ('Thor Odinson', 'Avengers', 'Thor', '1941-03-01'),
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
    ('Thanos', 'Infinity Gauntlet'),
    ('Steve Rogers', 'Captain America Shield'),
    ('Nick Fury', 'Eye Patch'),
    ('Peter Parker', 'Web-Shooters');

-- Table: Posee
INSERT INTO Posee(NombreCompleto, NombrePoder, FormaObtencion)
VALUES
    ('Tony Stark', 'Super Strength', 'Artificial'),
    ('Tony Stark', 'Flight', 'Artificial'),
    ('Steve Rogers', 'Super Strength', 'Artificial'),
    ('Thor Odinson', 'Super Strength', 'Hereditario'),
    ('Thor Odinson', 'Magic', 'Hereditario'),
    ('Groot', 'Super Strength', 'Hereditario'),
    ('Natasha Romanoff', 'Super Strength', 'Artificial'),
    ('Bruce Banner', 'Super Strength', 'Artificial'),
    ('Bruce Banner', 'Regeneration', 'Artificial'),
    ('Peter Parker', 'Super Strength', 'Natural'),
    ('Johann Shmidt', 'Super Strength', 'Artificial'),
    ('Loki Laufeyson', 'ShapeShift', 'Hereditario'),
    ('Loki Laufeyson', 'Magic', 'Hereditario'),
    ('Ultron', 'Flight', 'Artificial'),
    ('Ultron', 'Super Strength', 'Artificial'),
    ('Victor Von Doom', 'Super Strength', 'Artificial'),
    ('Victor Von Doom', 'Magic', 'Artificial'),
    ('Erik Lehnsherr', 'Magnetism Manipulation', 'Hereditario'),
    ('Reed Richards', 'Elasticity', 'Artificial'),
    ('Charles Xavier', 'Telepathy', 'Hereditario'),
    ('Emil Blonsky', 'Super Strength', 'Artificial'),
    ('Emil Blonsky', 'Invulnerability', 'Artificial'),
    ('Thanos', 'Super Strength', 'Hereditario'),
    ('Cain Marko', 'Super Strength', 'Hereditario'),
    ('Norman Osborn', 'Super Strength', 'Artificial');

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

-- ColoresTrajeHeroe
INSERT INTO ColoresTrajeHeroe (NombreHeroe, ColorTraje)
VALUES 
    ('Tony Stark', 'Rojo'),
    ('Tony Stark', 'Dorado'),
    ('Steve Rogers', 'Azul'),
    ('Steve Rogers', 'Blanco'),
    ('Steve Rogers', 'Rojo'),
    ('Natasha Romanoff', 'Negro'),
    ('Bruce Banner', 'Verde'),
    ('Bruce Banner', 'Morado'),
    ('Peter Parker', 'Rojo'),
    ('Peter Parker', 'Azul');

-- EnemigoVillano
INSERT INTO EnemigoVillano (NombreVillano, Enemigo)
VALUES 
    ('Johann Shmidt', 'Captain America'),
    ('Loki Laufeyson', 'Thor'),
    ('Ultron', 'The Avengers'),
    ('Victor Von Doom', 'The Avengers'),
    ('Erik Lehnsherr', 'X-Men'),
    ('Emil Blonsky', 'Hulk'),
    ('Norman Osborn', 'Spider-Man');

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

