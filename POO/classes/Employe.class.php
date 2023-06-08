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
    private $magasin;

    
    // Constructeur
    public function __construct($nom, $prenom, $dateEmbauche, $fonction, $salaire, $service, $magasin)
    {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->dateEmbauche = $dateEmbauche;
        $this->fonction = $fonction;
        $this->salaire = $salaire;
        $this->service = $service;
        $this->magasin = $magasin;

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

    public function getMagasin()
    {
        return $this->magasin;
    }

    // Méthode pour calculer le nombre d'années de service
    public function anneesDeService()
    {
        $dateEmbauche = new DateTime($this->dateEmbauche);
        $dateActuelle = new DateTime();
        $interval = $dateEmbauche->diff($dateActuelle);
        return $interval->y; // Retourne le nombre d'années
    }

    // Méthode pour calculer le montant de la prime
    public function calculerPrime()
    {
        $annees = $this->anneesDeService();
        $prime = $this->salaire * (0.05 + 0.02 * $annees);
        return $prime;
    }

    // Méthode pour effectuer le transfert à la banque
    public function effectuerTransfert()
    {
        $dateActuelle = new DateTime();
        $dateVersement = new DateTime(date("Y") . "-06-08");
    
        if ($dateActuelle->format('m-d') == $dateVersement->format('m-d')) {
            $prime = $this->calculerPrime();
            echo "Ordre de transfert envoyé à la banque pour un montant de " . $prime . "K euros à l'employé " . $this->nom . " " . $this->prenom . ".\n";
        } else {
            echo "Ce n'est pas encore le jour de versement de la prime.\n";
        }
    }    

}
?>
