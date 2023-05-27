
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

