<?php
include 'classes/Employe.class.php';

// Créer un nouvel employé
$employe = new Employe("Case", "Justin", "2023-06-08", "Manager", 40, "Commercial");
$employe2 = new Employe("Doe", "John", "2023-06-08", "Secraite", 40, "Commercial");
$employe3 = new Employe("Doe", "Jane", "2023-06-08", "PDG", 40, "Commercial");


// Afficher les informations de l'employé
echo "Nom: " . $employe->getNom() . "\n";
echo "Prénom: " . $employe->getPrenom() . "\n";
echo "Date d'embauche: " . $employe->getDateEmbauche() . "\n";
echo "Fonction: " . $employe->getFonction() . "\n";
echo "Salaire: " . $employe->getSalaire() . "K euros\n";
echo "Service: " . $employe->getService() . "\n";

// Afficher le nombre d'années de service de l'employé
echo "L'employé travaille dans l'entreprise depuis " . $employe->anneesDeService() . " années.\n";

// Tableau d'employés
$employes = [$employe1, $employe2, $employe3, $employe4, $employe5];

// Affichage du montant des primes et effectuation des transferts
foreach ($employes as $employe) {
    echo "Prime de " . $employe->getNom() . " " . $employe->getPrenom() . ": " . $employe->calculerPrime() . "K euros.\n";
    $employe->effectuerTransfert();
}

?>
