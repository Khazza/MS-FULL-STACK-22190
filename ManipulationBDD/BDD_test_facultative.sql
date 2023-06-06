-- Exo 2 --

CREATE DATABASE Scolarite;
USE Scolarite;

CREATE TABLE ETUDIANT (
    id INT PRIMARY KEY,
    Nom VARCHAR(255),
    Prenom VARCHAR(255)
);

INSERT INTO ETUDIANT (id, Nom, Prenom) VALUES 
(1, 'Doe', 'John'),
(2, 'Smith', 'Jane'),
(3, 'Brown', 'Charlie');


CREATE TABLE MATIERE (
    id INT PRIMARY KEY,
    Libellé VARCHAR(255),
    Coeff INT
);

INSERT INTO MATIERE (id, Libellé, Coeff) VALUES 
(1, 'Mathématiques', 4),
(2, 'Physique', 3),
(3, 'Informatique', 2);


CREATE TABLE EVALUER (
    id_Etudiant INT,
    id_Matiere INT,
    Date DATE,
    Note DECIMAL(4,2),
    PRIMARY KEY (id_Etudiant, id_Matiere, Date),
    FOREIGN KEY (id_Etudiant) REFERENCES ETUDIANT(id),
    FOREIGN KEY (id_Matiere) REFERENCES MATIERE(id)
);

INSERT INTO EVALUER (id_Etudiant, id_Matiere, Date, Note) VALUES 
(1, 1, '2023-06-06', 15.75),
(1, 2, '2023-06-07', 13.5),
(1, 3, '2023-06-08', 14.00),
(2, 1, '2023-06-06', 10.75),
(2, 2, '2023-06-07', 12.5),
(2, 3, '2023-06-08', 11.00),
(3, 1, '2023-06-06', 16.75),
(3, 2, '2023-06-07', 15.5),
(3, 3, '2023-06-08', 17.00);

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

INSERT INTO EQUIPE (id, NomEquipe, DirecteurSportif) VALUES 
(1, 'Team Sky', 'Dave Brailsford'),
(2, 'Movistar Team', 'Eusebio Unzué');

INSERT INTO PAYS (id, NomPays) VALUES 
(1, 'France'),
(2, 'Spain');

INSERT INTO COUREUR (id, NomCoureur, id_Equipe, id_Pays) VALUES 
(1, 'Chris Froome', 1, 1),
(2, 'Alejandro Valverde', 2, 2);

INSERT INTO TYPE_ETAPE (id, LibelléType) VALUES 
(1, 'Haute Montagne'),
(2, 'Plat');

INSERT INTO ETAPE (id, DateEtape, VilleDép, VilleArr, NbKm, id_Type_Etape) VALUES 
(1, '2023-07-06', 'Bordeaux', 'Toulouse', 240, 2),
(2, '2023-07-07', 'Toulouse', 'Carcassonne', 120, 1);

INSERT INTO PARTICIPER (id_Coureur, id_Etape, TempsRéalisé) VALUES 
(1, 1, '05:45:30'),
(1, 2, '04:30:00'),
(2, 1, '05:50:00'),
(2, 2, '04:29:30');

INSERT INTO ATTRIBUER_BONIFICATION (id_Etape, km, Rang, NbSecondes, id_Coureur) VALUES 
(1, 180, 1, 10, 1),
(1, 180, 2, 6, 2),
(2, 60, 1, 10, 2),
(2, 60, 2, 6, 1);