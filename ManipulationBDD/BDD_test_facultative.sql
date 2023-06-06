-- Exo 2 --

CREATE DATABASE Scolarite;
USE Scolarite;

CREATE TABLE ETUDIANT (
    id INT PRIMARY KEY,
    Nom VARCHAR(255),
    Prenom VARCHAR(255)
);

CREATE TABLE MATIERE (
    id INT PRIMARY KEY,
    Libellé VARCHAR(255),
    Coeff INT
);

CREATE TABLE EVALUER (
    id_Etudiant INT,
    id_Matiere INT,
    Date DATE,
    Note DECIMAL(4,2),
    PRIMARY KEY (id_Etudiant, id_Matiere, Date),
    FOREIGN KEY (id_Etudiant) REFERENCES ETUDIANT(id),
    FOREIGN KEY (id_Matiere) REFERENCES MATIERE(id)
);



-- Exo 3 --

CREATE DATABASE Cyclisme;
USE Cyclisme;

CREATE TABLE EQUIPE (
    id INT PRIMARY KEY,
    NomEquipe VARCHAR(255),
    DirecteurSportif VARCHAR(255)
);

CREATE TABLE PAYS (
    id INT PRIMARY KEY,
    NomPays VARCHAR(255)
);

CREATE TABLE COUREUR (
    id INT PRIMARY KEY,
    NomCoureur VARCHAR(255),
    id_Equipe INT,
    id_Pays INT,
    FOREIGN KEY (id_Equipe) REFERENCES EQUIPE(id),
    FOREIGN KEY (id_Pays) REFERENCES PAYS(id)
);

CREATE TABLE TYPE_ETAPE (
    id INT PRIMARY KEY,
    LibelléType VARCHAR(255)
);

CREATE TABLE ETAPE (
    id INT PRIMARY KEY,
    DateEtape DATE,
    VilleDép VARCHAR(255),
    VilleArr VARCHAR(255),
    NbKm INT,
    id_Type_Etape INT,
    FOREIGN KEY (id_Type_Etape) REFERENCES TYPE_ETAPE(id)
);

CREATE TABLE PARTICIPER (
    id_Coureur INT,
    id_Etape INT,
    TempsRéalisé TIME,
    PRIMARY KEY (id_Coureur, id_Etape),
    FOREIGN KEY (id_Coureur) REFERENCES COUREUR(id),
    FOREIGN KEY (id_Etape) REFERENCES ETAPE(id)
);

CREATE TABLE ATTRIBUER_BONIFICATION (
    id_Etape INT,
    km INT,
    Rang INT,
    NbSecondes INT,
    id_Coureur INT,
    PRIMARY KEY (id_Etape, km, id_Coureur),
    FOREIGN KEY (id_Etape) REFERENCES ETAPE(id),
    FOREIGN KEY (id_Coureur) REFERENCES COUREUR(id)
);
