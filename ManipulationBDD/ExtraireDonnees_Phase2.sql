-- Rechercher le prénom des employés et le numéro de la région de leur
-- département.
SELECT employe.prenom, dept.noregion
FROM employe
JOIN dept ON employe.nodep = dept.nodept;

-- Rechercher le numéro du département, le nom du département, le
-- nom des employés classés par numéro de département (renommer les
-- tables utilisées).
SELECT d.nodept, d.nom AS nom_departement, e.nom AS nom_employe
FROM dept AS d
JOIN employe AS e ON d.nodept = e.nodep
ORDER BY d.nodept;

-- Rechercher le nom des employés du département Distribution.
SELECT employe.nom
FROM employe
JOIN dept ON employe.nodep = dept.nodept
WHERE dept.nom = 'Distribution';

-- Rechercher le nom et le salaire des employés qui gagnent plus que
-- leur patron, et le nom et le salaire de leur patron.
SELECT e1.nom AS employe_nom, e1.salaire AS employe_salaire, e2.nom AS patron_nom, e2.salaire AS patron_salaire
FROM employe AS e1
JOIN employe AS e2 ON e1.nosup = e2.noemp
WHERE e1.salaire > e2.salaire;

-- Rechercher le nom et le titre des employés qui ont le même titre que
-- Amartakaldire.
SELECT e2.nom, e2.titre
FROM employe AS e1
JOIN employe AS e2 ON e1.titre = e2.titre
WHERE e1.nom = 'Amartakaldire';

-- Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus qu'un seul employé du département 31,
-- classés par numéro de département et salaire.
SELECT e.nom, e.salaire, e.nodep
FROM employe AS e
WHERE e.salaire > (SELECT MAX(salaire) FROM employe WHERE nodep = '31')
GROUP BY e.nom, e.salaire, e.nodep
HAVING COUNT(*) = 1
ORDER BY e.nodep, e.salaire;

-- Rechercher le nom, le salaire et le numéro de département des
-- employés qui gagnent plus que tous les employés du département 31,
-- classés par numéro de département et salaire.
SELECT e.nom, e.salaire, e.nodep
FROM employe AS e
WHERE e.salaire > ALL (SELECT salaire FROM employe WHERE nodep = '31')
ORDER BY e.nodep, e.salaire;

-- Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre que l'on trouve dans le département 32.
SELECT e.nom, e.titre
FROM employe AS e
JOIN dept AS d ON e.nodep = d.nodept
WHERE d.nodept = '32' AND e.titre IN (SELECT titre FROM employe WHERE nodep = '31');

-- Rechercher le nom et le titre des employés du service 31 qui ont un
-- titre l'on ne trouve pas dans le département 32.
SELECT e.nom, e.titre
FROM employe AS e
JOIN dept AS d1 ON e.nodep = d1.nodept
LEFT JOIN dept AS d2 ON e.titre = d2.nom AND d2.nodept = '32'
WHERE d1.nodept = '31' AND d2.nodept IS NULL;

-- Rechercher le nom, le titre et le salaire des employés qui ont le même
-- titre et le même salaire que Fairant.
SELECT nom, titre, salaire
FROM employe
WHERE titre = (SELECT titre FROM employe WHERE nom = 'Fairant')
AND salaire = (SELECT salaire FROM employe WHERE nom = 'Fairant');

-- Rechercher le numéro de département, le nom du département, le
-- nom des employés, en affichant aussi les départements dans lesquels
-- il n'y a personne, classés par numéro de département.
SELECT d.nodept, d.nom AS nom_departement, e.nom AS nom_employe
FROM dept AS d
LEFT JOIN employe AS e ON d.nodept = e.nodep
ORDER BY d.nodept;


-- 1. Calculer le nombre d'employés de chaque titre.
SELECT titre, COUNT(*) AS nombre_employes
FROM employe
GROUP BY titre;

-- 2. Calculer la moyenne des salaires et leur somme, par région
SELECT d.noregion, AVG(e.salaire) AS moyenne_salaire, SUM(e.salaire) AS somme_salaire
FROM employe AS e
JOIN dept AS d ON e.nodep = d.nodept
GROUP BY d.noregion;

-- 3. Afficher les numéros des départements ayant au moins 3 employés.
SELECT nodep
FROM employe
GROUP BY nodep
HAVING COUNT(*) >= 3;

-- 4. Afficher les lettres qui sont l'initiale d'au moins trois employés.
SELECT LEFT(nom, 1) AS initiale, COUNT(*) AS nombre_employes
FROM employe
GROUP BY LEFT(nom, 1)
HAVING COUNT(*) >= 3;

-- 5. Rechercher le salaire maximum et le salaire minimum parmi tous les
-- salariés et l'écart entre les deux.
SELECT MAX(salaire) AS salaire_max, MIN(salaire) AS salaire_min, (MAX(salaire) - MIN(salaire)) AS ecart
FROM employe;

-- 6. Rechercher le nombre de titres différents.
SELECT COUNT(DISTINCT titre) AS nombre_titres
FROM employe;

-- 7. Pour chaque titre, compter le nombre d'employés possédant ce titre.
SELECT titre, COUNT(*) AS nombre_employes
FROM employe
GROUP BY titre;

-- 8. Pour chaque nom de département, afficher le nom du département et
-- le nombre d'employés.
SELECT d.nom, COUNT(e.nom) AS nombre_employes
FROM dept AS d
LEFT JOIN employe AS e ON d.nodept = e.nodep
GROUP BY d.nom;

-- 9. Rechercher les titres et la moyenne des salaires par titre dont la
-- moyenne est supérieure à la moyenne des salaires des Représentants.
SELECT titre, AVG(salaire) AS moyenne_salaires
FROM employe
GROUP BY titre
HAVING AVG(salaire) > (SELECT AVG(salaire) FROM employe WHERE titre = 'Représentant');

-- 10.Rechercher le nombre de salaires renseignés et le nombre de taux de
-- commission renseignés.
SELECT COUNT(DISTINCT salaire) AS nombre_salaires_renseignes, COUNT(DISTINCT tauxcom) AS nombre_taux_commission_renseignes
FROM employe;
