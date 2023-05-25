
CREATE TABLE Tiene (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Pais VARCHAR(255) REFERENCES Nacionalidad(Pais),
    PRIMARY KEY (NombreCompleto, Pais)
);

CREATE TABLE Conoce(
    Heroe VARCHAR(255) REFERENCES Heroe(NombreCompleto),
    Civil VARCHAR(255) REFERENCES Civil(NombreCompleto),
    PRIMARY KEY (Heroe,Civil)
)

CREATE TABLE Trata(
    Villano VARCHAR(255) REFERENCES Heroe(NombreCompleto),
    Civil VARCHAR(255) REFERENCES Civil(NombreCompleto),
    PRIMARY KEY (Villano,Civil)
)

CREATE TABLE Aparece (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    TituloMedio VARCHAR(255) REFERENCES Medio(TituloMedio),
    NombreActor VARCHAR(255),
    Rol VARCHAR(255) CHECK (Rol IN ('Protagonista', 'Antagonista', 'Secundario')),
    TipoActor VARCHAR(255) CHECK (TipoActor IN ('Interpreta', 'Presta su voz')),
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
    Cargo VARCHAR(255),
    Fecha DATE,

    PRIMARY KEY (NombreCompleto, NombreOrg, Cargo, Fecha)
);

CREATE TABLE Porta (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombreObj VARCHAR(255) REFERENCES Objeto(Nombre),
    PRIMARY KEY (NombreCompleto, Nombre)
);

CREATE TABLE Posee (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    NombrePoder VARCHAR(255) REFERENCES Poder(NombrePoder),
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
    NombrePoder VARCHAR(255) REFERENCES Poder(NombrePoder),
    FechaCombate DATE,
    LugarComb VARCHAR(255),

    PRIMARY KEY (NombreCompleto, NombrePoder, FechaCombate, LugarComb)
);
