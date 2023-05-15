CREATE TABLE Personaje (
    NombreCompleto VARCHAR(255) PRIMARY KEY,
    Genero VARCHAR(50),
    ColorPelo VARCHAR(50),
    ColorOjos VARCHAR(50),
    Ocupaciones TEXT,
    EstadoMarital VARCHAR(50),
    Creadores TEXT,
    PrimeraAparicion DATE,
    FraseCelebre TEXT
);

CREATE TABLE Nacionalidad (
    Pais VARCHAR(255) PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Villano (
    NombreCompleto VARCHAR(255) PRIMARY KEY,
    NombreVillano VARCHAR(255),
    Objetivo TEXT,
    Enemigos TEXT,
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto)
);

CREATE TABLE Heroe (
    NombreCompleto VARCHAR(255),
    NombreHeroe VARCHAR(255),
    ColoresTraje TEXT,
    Logotipo BLOB,
    NombreVillano VARCHAR(255),
    PRIMARY KEY (NombreCompleto, NombreHeroe),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto),
    FOREIGN KEY (NombreVillano) REFERENCES Villano(NombreCompleto)
);

CREATE TABLE Civil (
    NombreCompleto VARCHAR(255) PRIMARY KEY,
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto)
);

CREATE TABLE Organizacion (
    Nombre VARCHAR(255) PRIMARY KEY,
    Slogan TEXT,
    Tipo VARCHAR(100),
    Objetivo TEXT,
    LugarCreacion VARCHAR(255),
    PrimeraAparicion DATE,
    NombreCompleto VARCHAR(255),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto)
);

CREATE TABLE Sede (
    Nombre VARCHAR(255),
    NombreOrg VARCHAR(255),
    Ubicacion VARCHAR(255),
    TipoEdificacion VARCHAR(255),
    PRIMARY KEY (Nombre, NombreOrg),
    FOREIGN KEY (NombreOrg) REFERENCES Organizacion(Nombre)
);

CREATE TABLE Objeto (
    Nombre VARCHAR(255) PRIMARY KEY,
    Creadores TEXT,
    MaterialFab VARCHAR(255),
    TipoObjeto VARCHAR(255),
    Descripcion TEXT
);

CREATE TABLE Poder (
    Nombre VARCHAR(255) PRIMARY KEY,
    Descripcion TEXT
);

CREATE TABLE Combate (
    Fecha DATE,
    Lugar VARCHAR(255),
    PRIMARY KEY (Fecha, Lugar)
);

CREATE TABLE Medio (
    Titulo VARCHAR(255) PRIMARY KEY,
    FechaEstr DATE,
    CompaniaProd VARCHAR(255),
    Rating DECIMAL(3,2),
    Sinopsis TEXT
);

CREATE TABLE Pelicula (
    Titulo VARCHAR(255),
    Director VARCHAR(255),
    Duracion INT,
    Distribuidor VARCHAR(255),
    TipoPelicula VARCHAR(255),
    CosteProd DECIMAL(15,2),
    Ganancias DECIMAL(15,2),
    FOREIGN KEY (Titulo) REFERENCES Medio(Titulo)
);

CREATE TABLE Serie (
    Titulo VARCHAR(255),
    Creador VARCHAR(255),
    TotalEpi INT,
    CanalTrans VARCHAR(255),
    Tipo VARCHAR(255),
    FOREIGN KEY (Titulo) REFERENCES Medio(Titulo)
);

CREATE TABLE Videojuego (
    Titulo VARCHAR(255),
    Plataformas TEXT,
    TipoJuego VARCHAR(255),
    CompaniaPub VARCHAR(255),
    FOREIGN KEY (Titulo) REFERENCES Medio(Titulo)
);

