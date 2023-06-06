-- Pour l'instruction INSERT :

-- Ajouter trois employés dans la base de données.
INSERT INTO employe (noemp, nom, prenom, dateemb, nosup, titre, nodep, salaire, tauxcom) VALUES (26, 'Doe', 'John', '2005-05-25', 1, 'représentant', 33, 50000, NULL);
INSERT INTO employe (noemp, nom, prenom, dateemb, nosup, titre, nodep, salaire, tauxcom) VALUES (27, 'Doe', 'Jane', '2006-07-21', 3, 'secrétaire', 41, 40000, NULL);
INSERT INTO employe (noemp, nom, prenom, dateemb, nosup, titre, nodep, salaire, tauxcom) VALUES (28, 'Case', 'Justin', '2009-11-02', 8, 'chef entrepot', 35, 60000, NULL);
-- Ajouter un département.
INSERT INTO dept (nodept, nom, noregion) VALUES (60, 'secretariat', 8);

-- Utiliser une requête SELECT pour vérifier l'insertion :
SELECT * FROM employe;
SELECT * FROM dept;
-- Cette requête SELECT affichera les données insérées dans les tables "employes" et "departements".

-- Pour l'instruction UPDATE :
-- Augmenter de 10% le salaire de l'employé 17 :
UPDATE employe SET salaire = salaire * 1.1 WHERE noemp = 17;
-- Cette requête met à jour le salaire de l'employé ayant l'id 17 en multipliant le salaire actuel par 1.1 (pour augmenter de 10%).

-- Changer le nom du département 45 en 'Logistique' :
UPDATE dept SET nom = 'Logistique' WHERE nodept = 45;
-- Cette requête met à jour le nom du département ayant l'id 45 en le remplaçant par 'Logistique'.

-- Pour l'instruction DELETE :
-- Supprimer le dernier des employés que vous avez insérés précédemment :
DELETE FROM employe WHERE noemp = (SELECT MAX(noemp) FROM employe);
-- Cette requête supprime l'employé ayant l'id le plus élevé (le dernier employé inséré) de la table "employes".