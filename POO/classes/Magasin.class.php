<?php
class Magasin
{
    private $nom;
    private $adresse;
    private $codePostal;
    private $ville;
    
    public function __construct($nom, $adresse, $codePostal, $ville)
    {
        $this->nom = $nom;
        $this->adresse = $adresse;
        $this->codePostal = $codePostal;
        $this->ville = $ville;
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
}
?>