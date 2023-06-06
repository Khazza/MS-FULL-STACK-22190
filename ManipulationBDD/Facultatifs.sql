-- Exercice d'application n°1

-- Soit le modèle relationnel suivant relatif à une base de données sur des représentations musicales :

-- REPRESENTATION (id, titre, lieu) 
-- Questions : 1 - Donner la liste des titres des représentations. 2 - Donner la liste des titres des représentations ayant lieu à l'opéra Bastille.
-- Pour obtenir la liste des titres de toutes les représentations :
SELECT titre FROM REPRESENTATION;
-- Cette requête sélectionne la colonne "titre" de la table "REPRESENTATION" et renvoie tous les titres des représentations.

-- Pour obtenir la liste des titres des représentations ayant lieu à l'opéra Bastille :
SELECT titre FROM REPRESENTATION WHERE lieu = 'opéra Bastille';
-- Cette requête sélectionne la colonne "titre" de la table "REPRESENTATION" mais ajoute également une condition WHERE pour 
-- filtrer les représentations ayant lieu à l'opéra Bastille.



---------------------------------------------------------------------------------------------------------------------------------------------



-- Exercice d'application n°2

-- Soit le modèle relationnel suivant relatif à la gestion des notes annuelles d'une promotion d'étudiants :

-- ETUDIANT (id, Nom, Prenom) 
-- MATIERE (id, Libellé, Coeff) 
-- EVALUER (id_Etudiant, id_Matiere, Date, Note)
-- Quel est le nombre total d'étudiants ?
-- Quelles sont, parmi l'ensemble des notes, la note la plus haute et la note la plus basse ?
-- Quelles sont les moyennes de chaque étudiant dans chacune des matières ?
-- Quelles sont les moyennes par matière ?
-- Quelle est la moyenne générale de chaque étudiant ?
-- Quelle est la moyenne générale de la promotion ?
-- Quels sont les étudiants qui ont une moyenne générale supérieure ou égale à la moyenne générale de la promotion ?

-- Pour obtenir le nombre total d'étudiants :
SELECT COUNT(*) AS total_etudiants FROM ETUDIANT;
-- Cette requête compte le nombre de lignes dans la table "ETUDIANT" et renvoie le résultat dans une colonne nommée "total_etudiants".

-- Pour obtenir la note la plus haute et la note la plus basse parmi l'ensemble des notes :
SELECT MAX(Note) AS note_max, MIN(Note) AS note_min FROM EVALUER;
-- Cette requête utilise les fonctions MAX et MIN pour trouver respectivement la note maximale et minimale dans la colonne "Note" de la table "EVALUER".

-- Pour obtenir les moyennes de chaque étudiant dans chacune des matières :
SELECT ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom, MATIERE.Libelle, AVG(EVALUER.Note) AS moyenne
FROM ETUDIANT
JOIN EVALUER ON ETUDIANT.id = EVALUER.id_Etudiant
JOIN MATIERE ON EVALUER.id_Matiere = MATIERE.id
GROUP BY ETUDIANT.id, MATIERE.id;
-- Cette requête effectue des jointures entre les tables "ETUDIANT", "EVALUER" et "MATIERE" pour associer les informations nécessaires. 
-- Elle utilise la fonction AVG pour calculer la moyenne des notes par étudiant et par matière.

-- Pour obtenir les moyennes par matière :
SELECT MATIERE.id, MATIERE.Libelle, AVG(EVALUER.Note) AS moyenne
FROM MATIERE
JOIN EVALUER ON MATIERE.id = EVALUER.id_Matiere
GROUP BY MATIERE.id;
-- Cette requête effectue une jointure entre les tables "MATIERE" et "EVALUER" et utilise la fonction AVG pour calculer la moyenne des notes par matière.

-- Pour obtenir la moyenne générale de chaque étudiant :
SELECT ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom, AVG(EVALUER.Note) AS moyenne_generale
FROM ETUDIANT
JOIN EVALUER ON ETUDIANT.id = EVALUER.id_Etudiant
GROUP BY ETUDIANT.id;
-- Cette requête effectue une jointure entre les tables "ETUDIANT" et "EVALUER" et utilise la fonction AVG pour calculer la moyenne générale des notes par étudiant.

-- Pour obtenir la moyenne générale de la promotion :
SELECT AVG(moyenne_generale) AS moyenne_promotion
FROM (
  SELECT AVG(EVALUER.Note) AS moyenne_generale
  FROM EVALUER
  GROUP BY id_Etudiant
) AS subquery;
-- Cette requête utilise une sous-requête pour calculer d'abord la moyenne générale de chaque étudiant, 
-- puis utilise la fonction AVG pour calculer la moyenne de ces moyennes générales.

-- Pour obtenir les étudiants ayant une moyenne générale supérieure ou égale à la moyenne générale de la promotion :
SELECT ETUDIANT.id, ETUDIANT.Nom, ETUDIANT.Prenom, AVG(EVALUER.Note) AS moyenne_generale
FROM ETUDIANT
JOIN EVALUER ON ETUDIANT.id = EVALUER.id_Etudiant
GROUP BY ETUDIANT.id
HAVING AVG(EVALUER.Note) >= (
  SELECT AVG(moyenne_generale)
  FROM (
    SELECT AVG(EVALUER.Note) AS moyenne_generale
    FROM EVALUER
    GROUP BY id_Etudiant
  ) AS subquery
);
-- Cette requête effectue une jointure entre les tables "ETUDIANT" et "EVALUER", 
-- calcule la moyenne générale de chaque étudiant, puis utilise la clause HAVING pour filtrer les étudiants dont la moyenne générale est 
-- supérieure ou égale à la moyenne générale de la promotion (calculée à l'aide de la même sous-requête que dans la question précédente).




---------------------------------------------------------------------------------------------------------------------------------------------



-- Exercice d'application n°3

-- Soit le modèle relationnel suivant relatif à la gestion simplifiée des étapes du Tour de France, dont une des étapes de type "contre la montre individuel" se déroula à Saint-Etienne :

-- EQUIPE (id , NomEquipe, DirecteurSportif) 
-- COUREUR (id , NomCoureur, id_Equipe, id_Pays) 
-- PAYS (id , NomPays) 
-- TYPE_ETAPE (id , LibelléType) 
-- ETAPE (id, DateEtape, VilleDép, VilleArr, NbKm, id_Type_Etape) 
-- PARTICIPER (id_Coureur, id_Etape, TempsRéalisé) 
-- ATTRIBUER_BONIFICATION (id_Etape, km, Rang, NbSecondes, id_Coureur)
-- Quelle est la composition de l'équipe Festina (Numéro, nom et pays des coureurs) ?
-- Quel est le nombre de kilomètres total du Tour de France 97 ?
-- Quel est le nombre de kilomètres total des étapes de type "Haute Montagne" ?
-- Quel est le classement général des coureurs (nom, code équipe, code pays et temps des coureurs)?
