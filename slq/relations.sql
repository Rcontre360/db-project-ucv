CREATE TABLE Tiene (
    NombreCompleto VARCHAR(255),
    Pais VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Pais),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto),
    FOREIGN KEY (Pais) REFERENCES Nacionalidad(Pais)
);

CREATE TABLE Conoce (
    NombreCompletoH VARCHAR(255),
    NombreCompletoC VARCHAR(255),
    PRIMARY KEY (NombreCompletoH, NombreCompletoC),
    FOREIGN KEY (NombreCompletoH) REFERENCES Heroe(NombreCompleto),
    FOREIGN KEY (NombreCompletoC) REFERENCES Civil(NombreCompleto)
);

CREATE TABLE Trata (
    NombreCompletoV VARCHAR(255),
    NombreCompletoC VARCHAR(255),
    PRIMARY KEY (NombreCompletoV, NombreCompletoC),
    FOREIGN KEY (NombreCompletoV) REFERENCES Villano(NombreCompleto),
    FOREIGN KEY (NombreCompletoC) REFERENCES Civil(NombreCompleto)
);

CREATE TABLE Aparece (
    NombreCompleto VARCHAR(255),
    Titulo VARCHAR(255),
    NombreActor VARCHAR(255),
    TipoActor VARCHAR(255),
    Rol VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Titulo),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto),
    FOREIGN KEY (Titulo) REFERENCES Medio(Titulo)
);

CREATE TABLE Interviene (
    Nombre VARCHAR(255),
    Titulo VARCHAR(255),
    Rol VARCHAR(255),
    EstadoFinal VARCHAR(255),
    PRIMARY KEY (Nombre, Titulo),
    FOREIGN KEY (Nombre) REFERENCES Organizacion(Nombre),
    FOREIGN KEY (Titulo) REFERENCES Medio(Titulo)
);

CREATE TABLE ParticipaObj (
    NombreCompleto VARCHAR(255),
    Fecha DATE,
    Lugar VARCHAR(255),
    Nombre VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Fecha, Lugar, Nombre),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto),
    FOREIGN KEY (Fecha, Lugar) REFERENCES Combate(Fecha, Lugar),
    FOREIGN KEY (Nombre) REFERENCES Objeto(Nombre)
);

CREATE TABLE ParticipaPod (
    NombreCompleto VARCHAR(255),
    Fecha DATE,
    Lugar VARCHAR(255),
    Nombre VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Fecha, Lugar, Nombre),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto),
    FOREIGN KEY (Fecha, Lugar) REFERENCES Combate(Fecha, Lugar),
    FOREIGN KEY (Nombre) REFERENCES Poder(Nombre)
);

CREATE TABLE Posee (
    NombreCompleto VARCHAR(255),
    Nombre VARCHAR(255),
    FormaObtencion VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Nombre),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto),
    FOREIGN KEY (Nombre) REFERENCES Poder(Nombre)
);

CREATE TABLE Porta (
    NombreCompleto VARCHAR(255),
    Nombre VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Nombre),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto),
    FOREIGN KEY (Nombre) REFERENCES Objeto(Nombre)
);

CREATE TABLE Pertenece (
    NombreCompleto VARCHAR(255),
    Nombre VARCHAR(255),
    Cargo VARCHAR(255),
    Fecha DATE,
    PRIMARY KEY (NombreCompleto, Nombre),
    FOREIGN KEY (NombreCompleto) REFERENCES Personaje(NombreCompleto),
    FOREIGN KEY (Nombre) REFERENCES Organizacion(Nombre)
);

