
CREATE TABLE ColoresTraje(
    NombreHeroe VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    ColorTraje VARCHAR(255),

    PRIMARY KEY (NombreHeroe,ColorTraje)
)

CREATE TABLE Enemigos(
    NombreVillano VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    Enemigo VARCHAR(255),

    PRIMARY KEY (NombreVillano,Enemigo)
)

CREATE TABLE Ocupaciones(
    NombrePersonaje VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    Ocupacion VARCHAR(255),

    PRIMARY KEY (NombrePersonaje,Ocupacion)
)

CREATE TABLE Creadores(
    NombrePersonaje VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    Creador VARCHAR(255),

    PRIMARY KEY (NombrePersonaje,Creador)
)

CREATE TABLE Plataformas(
    Videojuego VARCHAR(255) PRIMARY KEY REFERENCES Medio(TituloMedio)
    Plataforma VARCHAR(255),

    PRIMARY KEY (Videojuego,Plataforma)
)

CREATE TABLE CreadorObjeto (
    NombreObj VARCHAR(255) REFERENCES Objeto(NombreObj),
    Creador VARCHAR(255),
    PRIMARY KEY (NombreObj, Creador)
);
