-- Afficher la liste des commandes (la liste doit faire apparaitre la date, les informations du client, le plat et le prix):
SELECT commande.date_commande, commande.nom_client, commande.telephone_client, commande.email_client, commande.adresse_client, plat.libelle as plat, plat.prix as prix 
FROM commande 
JOIN plat ON commande.id_plat = plat.id;

-- Afficher la liste des plats en spécifiant la catégorie:
SELECT plat.libelle as plat, categorie.libelle as categorie
FROM plat
JOIN categorie ON plat.id_categorie = categorie.id;

-- Afficher les catégories et le nombre de plats actifs dans chaque catégorie:
SELECT categorie.libelle as categorie, COUNT(plat.id) as nombre_de_plats_actifs
FROM categorie
JOIN plat ON categorie.id = plat.id_categorie
WHERE plat.active = 'yes'
GROUP BY categorie.libelle;

-- Liste des plats les plus vendus par ordre décroissant
SELECT plat.libelle as plat, SUM(commande.quantite) as total_vendu
FROM plat
JOIN commande ON plat.id = commande.id_plat
GROUP BY plat.libelle
ORDER BY total_vendu DESC;

-- Le plat le plus rémunérateur:
SELECT plat.libelle as plat, SUM(plat.prix * commande.quantite) as revenu
FROM plat
JOIN commande ON plat.id = commande.id_plat
GROUP BY plat.libelle
ORDER BY revenu DESC
LIMIT 1;

-- Liste des clients et le chiffre d'affaire généré par client (par ordre décroissant):
SELECT commande.nom_client, SUM(commande.total) as chiffre_daffaire
FROM commande
WHERE commande.etat != 'annulée'
GROUP BY commande.nom_client
ORDER BY chiffre_daffaire DESC;


-- Supprimer les plats non actifs de la base de données :
DELETE FROM plat
WHERE active != 'yes';

-- Supprimer les commandes avec le statut livré :
DELETE FROM commande
WHERE etat = 'Livrée';

-- Ajouter une nouvelle catégorie et un plat dans cette nouvelle catégorie :
INSERT INTO categorie (libelle, image, active)
VALUES ('NouvelleCat', 'kebab.jpg', 'yes');

INSERT INTO plat (libelle, description, prix, image, id_categorie, active)
VALUES ('NouveauPlat', 'Description du nouveau plat', 15.99, 'kebab.jpg', LAST_INSERT_ID(), 'yes');

-- Augmenter de 10% le prix des plats de la catégorie 'Pizza' :
UPDATE plat
SET prix = prix * 1.1
WHERE id_categorie = (SELECT id FROM categorie WHERE libelle = 'Pizza');