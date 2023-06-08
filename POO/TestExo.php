<?php
include 'classes/Employe.class.php';

// Créer un nouvel employé et magasin
$magasinParis = new Magasin("Jarditou Paris", "123 Rue de Paris", "75001", "Paris");
$magasinParis2 = new Magasin("Jarditou Marseille", "123 Rue de Marseille", "13001", "Marseille");
$magasinParis3 = new Magasin("Jarditou Nice", "123 Rue de Nice", "06001", "Nice");

$employe1 = new Employe("Case", "Justin", "2020-06-08", "Manager", 40, "Commercial",$magasinParis);
$employe2 = new Employe("Doe", "John", "2023-06-08", "Secraite", 40, "Commercial",$magasinParis2);
$employe3 = new Employe("Doe", "Jane", "2023-06-08", "PDG", 40, "Commercial",$magasinParis3);

// Tableau d'employés
$employes = [$employe1, $employe2, $employe3];

// Affichage du montant des primes et effectuation des transferts
foreach ($employes as $employe) {
    // Afficher les informations de l'employé
    echo "<strong>Employé:</strong><br>";
    echo "Nom: " . $employe->getNom() . "<br>";
    echo "Prénom: " . $employe->getPrenom() . "<br>";
    echo "Date d'embauche: " . $employe->getDateEmbauche() . "<br>";
    echo "Fonction: " . $employe->getFonction() . "<br>";
    echo "Salaire: " . $employe->getSalaire() . "K euros<br>";
    echo "Service: " . $employe->getService() . "<br>";

// Afficher le nombre d'années de service de l'employé
echo "L'employé travaille dans l'entreprise depuis " . $employe->anneesDeService() . " années.<br>";
echo "Prime de " . $employe->getNom() . " " . $employe->getPrenom() . ": " . $employe->calculerPrime() . "K euros.<br>";

// Afficher le magasin de l'employé
echo "Magasin de l'employé : " . $employe->getMagasin()->getNom() . "<br>";

$employe->effectuerTransfert();

// Ligne vide de séparation
echo "<br>";
}
?>