<?php
include 'classes/Employe.class.php';

// Créer un nouvel employé
$employe = new Employe("Case", "Justin", "2023-06-08", "Manager", 40, "Commercial");

// Afficher les informations de l'employé
echo "Nom: " . $employe->getNom() . "\n";
echo "Prénom: " . $employe->getPrenom() . "\n";
echo "Date d'embauche: " . $employe->getDateEmbauche() . "\n";
echo "Fonction: " . $employe->getFonction() . "\n";
echo "Salaire: " . $employe->getSalaire() . "K euros\n";
echo "Service: " . $employe->getService() . "\n";

// Afficher le nombre d'années de service de l'employé
echo "L'employé travaille dans l'entreprise depuis " . $employe->anneesDeService() . " années.\n";

?>
