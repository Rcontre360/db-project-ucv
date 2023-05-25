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
    Genero VARCHAR(50),
    ColorPelo VARCHAR(50),
    ColorOjos VARCHAR(50),
    EstadoMarital VARCHAR(50),
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
    FechaEstr DATE,
    CompaniaProd VARCHAR(255),
    Rating NUMERIC,
    Sinposis TEXT
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

