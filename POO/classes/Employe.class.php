<?php
class Employe
{
    // Propriétés
    private $nom;
    private $prenom;
    private $dateEmbauche;
    private $fonction;
    private $salaire;
    private $service;
    
    // Constructeur
    public function __construct($nom, $prenom, $dateEmbauche, $fonction, $salaire, $service)
    {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->dateEmbauche = $dateEmbauche;
        $this->fonction = $fonction;
        $this->salaire = $salaire;
        $this->service = $service;
    }
    
    // Accesseurs
    public function getNom()
    {
        return $this->nom;
    }
    
    public function getPrenom()
    {
        return $this->prenom;
    }
    
    public function getDateEmbauche()
    {
        return $this->dateEmbauche;
    }
    
    public function getFonction()
    {
        return $this->fonction;
    }
    
    public function getSalaire()
    {
        return $this->salaire;
    }
    
    public function getService()
    {
        return $this->service;
    }
    
    // Mutateurs
    public function setNom($nom)
    {
        $this->nom = $nom;
    }
    
    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;
    }
    
    public function setDateEmbauche($dateEmbauche)
    {
        $this->dateEmbauche = $dateEmbauche;
    }
    
    public function setFonction($fonction)
    {
        $this->fonction = $fonction;
    }
    
    public function setSalaire($salaire)
    {
        $this->salaire = $salaire;
    }
    
    public function setService($service)
    {
        $this->service = $service;
    }

    // Méthode pour calculer le nombre d'années de service
    public function anneesDeService()
    {
        $dateEmbauche = new DateTime($this->dateEmbauche);
        $dateActuelle = new DateTime();
        $interval = $dateEmbauche->diff($dateActuelle);
        return $interval->y; // Retourne le nombre d'années
    }
}
?>
