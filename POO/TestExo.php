<?php
include 'classes/Employe.class.php';
include 'classes/Magasin.class.php';

// Création de nouveaux objets Magasin
$magasinParis = new Magasin("Jarditou Paris", "123 Rue de Paris", "75001", "Paris", true);
$magasinParis2 = new Magasin("Jarditou Paris2", "124 Rue de Paris", "75002", "Paris", false);
$magasinParis3 = new Magasin("Jarditou Nice", "123 Rue de Nice", "06001", "Nice", true);

// Création de nouveaux objets Employe
$employe1 = new Employe("Case", "Justin", "2020-06-08", "Manager", 40, "Commercial", $magasinParis, ["2012-03-12", "2018-04-20"]);
$employe2 = new Employe("Doe", "John", "2023-06-08", "Secrétaire", 40, "Commercial", $magasinParis2, ["2009-07-15"]);
$employe3 = new Employe("Doe", "Jane", "2018-02-12", "PDG", 40, "Commercial", $magasinParis3, ["2017-05-10", "2020-12-01"]);

// Tableau d'employés
$employes = [$employe1, $employe2, $employe3];

// Parcourir et afficher les informations pour chaque employé
foreach ($employes as $employe) {
    echo "<strong>Employé:</strong><br>";
    echo "Nom: " . $employe->getNom() . "<br>";
    echo "Prénom: " . $employe->getPrenom() . "<br>";
    echo "Date d'embauche: " . $employe->getDateEmbauche() . "<br>";
    echo "Fonction: " . $employe->getFonction() . "<br>";
    echo "Salaire: " . $employe->getSalaire() . "K euros<br>";
    echo "Service: " . $employe->getService() . "<br>";

    // Afficher le nombre d'années de service
    echo "L'employé travaille dans l'entreprise depuis " . $employe->anneesDeService() . " années.<br>";

    // Afficher la prime
    echo "Prime de " . $employe->getNom() . " " . $employe->getPrenom() . ": " . $employe->calculerPrime() . "K euros.<br>";

    // Effectuer le transfert de la prime
    $employe->effectuerTransfert();

    echo "<br>";

    // Afficher le magasin associé à l'employé
    echo "Magasin de l'employé : " . $employe->getMagasin()->getNom() . "<br>";

    // Afficher le mode de restauration du magasin associé à l'employé
    echo "Mode de restauration : " . $employe->getMagasin()->getModeRestauration() . "<br>";

    // Vérifier et afficher si l'employé est éligible aux chèques-vacances
    if ($employe->peutRecevoirChequesVacances()) {
        echo $employe->getNom() . " " . $employe->getPrenom() . " peut recevoir des chèques-vacances.<br>";
    } else {
        echo $employe->getNom() . " " . $employe->getPrenom() . " ne peut pas recevoir des chèques-vacances.<br>";
    }

    // Calculer et afficher les chèques de Noël
    $chequesNoel = $employe->calculerChequesNoel();
    if (array_sum($chequesNoel) > 0) {
        echo $employe->getNom() . " " . $employe->getPrenom() . " a droit à des chèques de Noël:<br>";
        foreach ($chequesNoel as $montant => $nombre) {
            if ($nombre > 0) {
                echo "- " . $nombre . " chèque(s) de " . $montant . " €<br>";
            }
        }
    } else {
        echo $employe->getNom() . " " . $employe->getPrenom() . " n'a pas droit à des chèques de Noël.<br>";
    }

    // Ligne vide pour séparation
    echo "<br><br>";
}
?>
