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

// Entête de la page
echo "<h1>Liste des employés</h1>";

// Parcourir et afficher les informations pour chaque employé
foreach ($employes as $employe) {
    echo "<h2>Employé: " . $employe->getPrenom() . " " . $employe->getNom() . "</h2>";
    echo "<ul>";
    echo "<li>Date d'embauche: " . $employe->getDateEmbauche() . "</li>";
    echo "<li>Fonction: " . $employe->getFonction() . "</li>";
    echo "<li>Salaire: " . $employe->getSalaire() . "K euros</li>";
    echo "<li>Service: " . $employe->getService() . "</li>";
    echo "<li>L'employé travaille dans l'entreprise depuis " . $employe->anneesDeService() . " années.</li>";
    echo "<li>Prime de " . $employe->getPrenom() . ": " . $employe->calculerPrime() . "K euros.</li>";
    echo "<li>Magasin de l'employé : " . $employe->getMagasin()->getNom() . "</li>";
    echo "<li>Mode de restauration : " . $employe->getMagasin()->getModeRestauration() . "</li>";

    if ($employe->peutRecevoirChequesVacances()) {
        echo "<li>" . $employe->getPrenom() . " peut recevoir des chèques-vacances.</li>";
    } else {
        echo "<li>" . $employe->getPrenom() . " ne peut pas recevoir des chèques-vacances.</li>";
    }

    $chequesNoel = $employe->calculerChequesNoel();
    if (array_sum($chequesNoel) > 0) {
        echo "<li>" . $employe->getPrenom() . " a droit à des chèques de Noël:<ul>";
        foreach ($chequesNoel as $montant => $nombre) {
            if ($nombre > 0) {
                echo "<li>" . $nombre . " chèque(s) de " . $montant . " €</li>";
            }
        }
        echo "</ul></li>";
    } else {
        echo "<li>" . $employe->getPrenom() . " n'a pas droit à des chèques de Noël.</li>";
    }

    echo "</ul><hr>";
}
?>
