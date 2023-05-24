CREATE TABLE Organizacion (
    Nombre VARCHAR(255) PRIMARY KEY,
    SloganOrg VARCHAR(255),
    TipoOrg VARCHAR(255),
    ObjetivoOrg VARCHAR(255),
    LugarCreacion VARCHAR(255),
    PrimeraAparicion DATE,
    PersonajeLidera VARCHAR(255),
    NombreSede VARCHAR(255)
);

CREATE TABLE Personaje (
    NombreCompleto VARCHAR(255) PRIMARY KEY,
    Genero VARCHAR(50),
    ColorPelo VARCHAR(50),
    ColorOjos VARCHAR(50),
    EstadoMarital VARCHAR(50),
    Creadores VARCHAR(255),
    PrimeraAparicion DATE,
    FraseCelebre VARCHAR(255)
);

CREATE TABLE Heroe (
    NombreCompleto VARCHAR(255) PRIMARY KEY REFERENCES Personaje(NombreCompleto),
    NombreHeroe VARCHAR(255),
    ColoresTraje VARCHAR(255),
    Logotipo VARCHAR(255),
    VillanoRivaliza VARCHAR(255),
    ObjetivoV VARCHAR(255),
    EnemigosV VARCHAR(255)
);

CREATE TABLE Sede (
    Nombre varchar(255) NOT NULL,
    NombreSede varchar(255) NOT NULL,
    UbicaciónSd varchar(255),
    TipoEdificaciónSd varchar(255),
    PRIMARY KEY (Nombre, NombreSede),
    FOREIGN KEY (Nombre) REFERENCES Organizacion(Nombre)
);

CREATE TABLE Nacionalidad (
    Pais VARCHAR(255) PRIMARY KEY,
    NombrePais VARCHAR(255)
);

CREATE TABLE Objeto (
    NombreObj VARCHAR(255) PRIMARY KEY,
    CreadoresOb VARCHAR(255),
    MaterialFabOb VARCHAR(255),
    TipoObjetoOb VARCHAR(255),
    DescripcionOb VARCHAR(255)
);

CREATE TABLE Poder (
    NombrePoder VARCHAR(255) PRIMARY KEY,
    DescripcionPo VARCHAR(255)
);

CREATE TABLE Combate (
    FechaCombate DATE,
    LugarComb VARCHAR(255),
    PRIMARY KEY (FechaCombate, LugarComb)
);

CREATE TABLE Medio (
    TituloMedio VARCHAR(255) PRIMARY KEY,
    FechaEstrM DATE,
    CompaniaProdM VARCHAR(255),
    RatingM NUMERIC,
    SinposisM TEXT
);

CREATE TABLE Pelicula (
    DirectorPe VARCHAR(255),
    DuracionPe INTERVAL,
    DistribuidorPe VARCHAR(255),
    TipoPeliculaPe VARCHAR(255),
    CosteProdPe MONEY,
    GananciasPe MONEY,
    TituloMedio VARCHAR(255) PRIMARY KEY REFERENCES Medio(TituloMedio)
);

CREATE TABLE Serie (
    CreadorSe VARCHAR(255),
    TotalEpiSe INTEGER,
    CanalTransSe VARCHAR(255),
    TipoSe VARCHAR(255),
    TituloMedio VARCHAR(255) PRIMARY KEY REFERENCES Medio(TituloMedio)
);

CREATE TABLE Videojuego (
    PlataformasVid VARCHAR(255),
    TipoJuego VARCHAR(255),
    CompaniaPubVid VARCHAR(255),
    TituloMedio VARCHAR(255) PRIMARY KEY REFERENCES Medio(TituloMedio)
);

CREATE TABLE Aparece (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    TituloMedio VARCHAR(255) REFERENCES Medio(TituloMedio),
    NombreActor VARCHAR(255),
    Rol VARCHAR(255),
    TipoActor VARCHAR(255),
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

CREATE TABLE Ocupaciones (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Ocupacion VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Ocupacion)
);

CREATE TABLE Creadores (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Creador VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Creador)
);

CREATE TABLE ColorTraje (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Color VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Color)
);

CREATE TABLE Enemigo (
    NombreCompleto VARCHAR(255) REFERENCES Personaje(NombreCompleto),
    Enemigo VARCHAR(255),
    PRIMARY KEY (NombreCompleto, Enemigo)
);

CREATE TABLE CreadorObjeto (
    NombreObj VARCHAR(255) REFERENCES Objeto(NombreObj),
    Creador VARCHAR(255),
    PRIMARY KEY (NombreObj, Creador)
);

CREATE TABLE Platform (
    TituloMedio VARCHAR(255) REFERENCES Medio(TituloMedio),
    Plataforma VARCHAR(255),
    PRIMARY KEY (TituloMedio, Plataforma)
);

