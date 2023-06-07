<?php

class Personnage {
    // Attributs
    private $nom;
    private $prenom;
    private $age;
    private $sexe;

    // Constructeur
    public function __construct($nom, $prenom, $age, $sexe) {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->age = $age;
        $this->sexe = $sexe;
    }

    // Accesseurs
    public function getNom() {
        return $this->nom;
    }

    public function getPrenom() {
        return $this->prenom;
    }

    public function getAge() {
        return $this->age;
    }

    public function getSexe() {
        return $this->sexe;
    }

    // Mutateurs
    public function setNom($nom) {
        $this->nom = $nom;
    }

    public function setPrenom($prenom) {
        $this->prenom = $prenom;
    }

    public function setAge($age) {
        if(is_int($age) && $age > 0) {
            $this->age = $age;
        }
    }

    public function setSexe($sexe) {
        if($sexe == 'homme' || $sexe == 'femme') {
            $this->sexe = $sexe;
        }
    }
}

?>
