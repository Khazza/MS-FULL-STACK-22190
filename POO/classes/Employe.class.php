<?php

class Employe {
    // Attributs
    private $nom;
    private $prenom;
    private $dateEmbauche;
    private $fonction;
    private $salaire;
    private $service;

    // Constructeur
    public function __construct($nom, $prenom, $dateEmbauche, $fonction, $salaire, $service) {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->dateEmbauche = $dateEmbauche;
        $this->fonction = $fonction;
        $this->salaire = $salaire;
        $this->service = $service;
    }

    // Accesseurs
    public function getNom() {
        return $this->nom;
    }

    public function getPrenom() {
        return $this->prenom;
    }

    public function getDateEmbauche() {
        return $this->dateEmbauche;
    }

    public function getFonction() {
        return $this->fonction;
    }

    public function getSalaire() {
        return $this->salaire;
    }

    public function getService() {
        return $this->service;
    }

    // Mutateurs
    public function setNom($nom) {
        $this->nom = $nom;
    }

    public function setPrenom($prenom) {
        $this->prenom = $prenom;
    }

    public function setDateEmbauche($dateEmbauche) {
        $this->dateEmbauche = $dateEmbauche;
    }

    public function setFonction($fonction) {
        $this->fonction = $fonction;
    }

    public function setSalaire($salaire) {
        if(is_numeric($salaire) && $salaire > 0) {
            $this->salaire = $salaire;
        }
    }

    public function setService($service) {
        $this->service = $service;
    }


    // Calcul annee de service
    public function anneesService() {
        $dateEmbauche = new DateTime($this->dateEmbauche);
        $dateActuelle = new DateTime();
    
        $interval = $dateEmbauche->diff($dateActuelle);
    
        return $interval->y;
    }


    // Calcul de la prime
    public function calculerPrime() {
        $anciennete = $this->anneesService();
        $prime = ($this->salaire * 0.05) + ($this->salaire * 0.02 * $anciennete);
        return $prime;
    }

    // Émettre l'ordre de transfert
    public function emettreOrdreDeTransfert() {
        $dateVersement = new DateTime("now");
        $dateCible = new DateTime("November 30");

        if ($dateVersement->format('m-d') == $dateCible->format('m-d')) {
            $montant = $this->calculerPrime();
            echo "Ordre de transfert de " . $montant . " euros envoyé à la banque pour l'employé " . $this->nom . " " . $this->prenom . ".\n";
        }
    }
    

}

?>
