
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
