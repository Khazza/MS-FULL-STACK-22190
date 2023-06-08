<?php
class Magasin
{
    // Propriétés
    private $nom;
    private $adresse;
    private $codePostal;
    private $ville;
    private $restaurant;
    
    // Construct
    public function __construct($nom, $adresse, $codePostal, $ville, $restaurant)
    {
        $this->nom = $nom;
        $this->adresse = $adresse;
        $this->codePostal = $codePostal;
        $this->ville = $ville;
        $this->restaurant = $restaurant;
    }
    
    // Accesseurs
    public function getNom()
    {
        return $this->nom;
    }
    
    public function getAdresse()
    {
        return $this->adresse;
    }
    
    public function getCodePostal()
    {
        return $this->codePostal;
    }
    
    public function getVille()
    {
        return $this->ville;
    }

    public function getModeRestauration() {
        return $this->restaurant ? "Restaurant d'entreprise" : "Tickets restaurants";
    }

    // Mutateurs
    public function setNom($nom)
    {
        $this->nom = $nom;
    }
    
    public function setAdresse($adresse)
    {
        $this->adresse = $adresse;
    }
    
    public function setCodePostal($codePostal)
    {
        $this->codePostal = $codePostal;
    }
    
    public function setVille($ville)
    {
        $this->ville = $ville;
    }

    public function setModeRestauration($restaurant)
    {
        $this->restaurant = $restaurant;
    }
}
