-- Pour l'instruction INSERT :

-- Ajouter trois employés dans la base de données.
INSERT INTO employes (id, nom, salaire) VALUES (1, 'John Doe', 50000);
INSERT INTO employes (id, nom, salaire) VALUES (2, 'Jane Doe', 60000);
INSERT INTO employes (id, nom, salaire) VALUES (3, 'Justin Case', 55000);
-- Ajouter un département.
INSERT INTO departements (id, nom) VALUES (1, 'Ventes');

-- Utiliser une requête SELECT pour vérifier l'insertion :
SELECT * FROM employes;
SELECT * FROM departements;
-- Cette requête SELECT affichera les données insérées dans les tables "employes" et "departements".

-- Pour l'instruction UPDATE :
-- Augmenter de 10% le salaire de l'employé 17 :
UPDATE employes SET salaire = salaire * 1.1 WHERE id = 17;
-- Cette requête met à jour le salaire de l'employé ayant l'id 17 en multipliant le salaire actuel par 1.1 (pour augmenter de 10%).

-- Changer le nom du département 45 en 'Logistique' :
UPDATE departements SET nom = 'Logistique' WHERE id = 45;
-- Cette requête met à jour le nom du département ayant l'id 45 en le remplaçant par 'Logistique'.

-- Pour l'instruction DELETE :
-- Supprimer le dernier des employés que vous avez insérés précédemment :
DELETE FROM employes WHERE id = (SELECT MAX(id) FROM employes);
-- Cette requête supprime l'employé ayant l'id le plus élevé (le dernier employé inséré) de la table "employes".