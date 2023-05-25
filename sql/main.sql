CREATE TABLE Organizacion (
    Nombre VARCHAR(255) PRIMARY KEY,
    Slogan VARCHAR(255),
    Tipo VARCHAR(255),
    Objetivo VARCHAR(255),
    LugarCreacion VARCHAR(255),
    PrimeraAparicion DATE,

    PersonajeLidera VARCHAR(255),
    NombreSede VARCHAR(255)

    FOREIGN KEY (PersonajeLidera) REFERENCES Personaje(NombreCompleto)
    FOREIGN KEY (NombreSede) REFERENCES Sede(Nombre)
);

CREATE TABLE Personaje (
    NombreCompleto VARCHAR(255) PRIMARY KEY,
    Genero VARCHAR(50) CHECK (Genero IN ('M', 'F', 'Desc', 'Otro')),
    ColorPelo VARCHAR(50),
    ColorOjos VARCHAR(50),
    EstadoMarital VARCHAR(50) CHECK (EstadoMarital IN ('Soltero', 'Casado', 'Viudo', 'Divorciado')),
    PrimeraAparicion DATE,
    FraseCelebre VARCHAR(255)
);

CREATE TABLE Heroe (
    NombreCompleto VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    NombreHeroe VARCHAR(255),
    Logotipo VARCHAR(255),

    VillanoRivaliza VARCHAR(255),
    FOREIGN KEY (VillanoRivaliza) REFERENCES Villano(NombreCompleto)
);

CREATE TABLE Villano(
    NombreCompleto VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    NombreVillano VARCHAR(255),
    Objetivo VARCHAR(255)
)

CREATE TABLE Civil(
    NombreCompleto VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
)

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
    RatingM NUMERIC CHECK (RatingM >= 1 AND RatingM <= 5),
    SinposisM TEXT
);

CREATE TABLE Pelicula (
    Director VARCHAR(255),
    Duracion NUMERIC,
    Distribuidor VARCHAR(255),
    TipoPelicula VARCHAR(255),
    CosteProd MONEY,
    Ganancias MONEY,

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

CREATE TABLE Aparece (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    TituloMedio VARCHAR(255) REFERENCES Medio(TituloMedio),
    NombreActor VARCHAR(255),
    Rol VARCHAR(255) CHECK (Rol IN ('Protagonista', 'Antagonista', 'Secundario')),
    TipoActor VARCHAR(255) CHECK (TipoActor IN ('Interpreta', 'Presta su voz')),
    PRIMARY KEY (NombreCompleto, TituloMedio)
);

CREATE TABLE Interviene (
    Nombre VARCHAR(255) REFERENCES Organizacion(Nombre),
    TituloMedio VARCHAR(255) REFERENCES Medio(TituloMedio),
    Rol VARCHAR(255) CHECK (Rol IN ('Protagonista', 'Enemiga', 'Secundario')),
    EstadoFinal VARCHAR(255),
    PRIMARY KEY (Nombre, TituloMedio)
);

CREATE TABLE Pertenece (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Nombre VARCHAR(255) REFERENCES Organizacion(Nombre),
    Cargo VARCHAR(255),
    Fecha DATE,
    PRIMARY KEY (NombreCompleto, Nombre, Cargo, Fecha)
);

CREATE TABLE Posee (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombrePoder VARCHAR(255) REFERENCES Poder(NombrePoder),
    FormaObtencion VARCHAR(255) CHECK (FormaObtencion IN ('Hereditario', 'Artificial', 'Natural')),
    PRIMARY KEY (NombreCompleto, NombrePoder)
);

CREATE TABLE Porta (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombreObj VARCHAR(255) REFERENCES Objeto(NombreObj),
    PRIMARY KEY (NombreCompleto, NombreObj)
);

CREATE TABLE ParticipaObj (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    FechaCombate DATE,
    LugarComb VARCHAR(255),
    NombreObj VARCHAR(255) REFERENCES Objeto(NombreObj),
    PRIMARY KEY (NombreCompleto, FechaCombate, LugarComb, NombreObj)
);

CREATE TABLE ParticipaPod (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombrePoder VARCHAR(255) REFERENCES Poder(NombrePoder),
    FechaCombate DATE,
    LugarComb VARCHAR(255),
    PRIMARY KEY (NombreCompleto, NombrePoder, FechaCombate, LugarComb)
);

CREATE TABLE Tiene (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Pais VARCHAR(255) REFERENCES Nacionalidad(Pais),
    PRIMARY KEY (NombreCompleto, Pais)
);

CREATE TABLE OcupacionPersonaje (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Ocupacion VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Ocupacion)
);

CREATE TABLE CreadorPersonaje (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Creador VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Creador)
);

CREATE TABLE ColorTrajeHeroe (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Color VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Color)
);

CREATE TABLE EnemigoVillano (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Enemigo VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Enemigo)
);

CREATE TABLE CreadorObjeto (
    NombreObj VARCHAR(255) REFERENCES Objeto(NombreObj),
    Creador VARCHAR(255),
    PRIMARY KEY (NombreObj, Creador)
);

CREATE TABLE PlatformVideoJuego (
    TituloMedio VARCHAR(255) REFERENCES Medio(TituloMedio),
    Plataforma VARCHAR(255),
    PRIMARY KEY (TituloMedio, Plataforma)
);

>>>>>>> 369fa8dada559a061a9e67d8a2c991a1371bedf4
