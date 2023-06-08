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
    private $enfants; 

    // Constructeur
    public function __construct($nom, $prenom, $dateEmbauche, $fonction, $salaire, $service, $magasin, $enfants)
    {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->dateEmbauche = $dateEmbauche;
        $this->fonction = $fonction;
        $this->salaire = $salaire;
        $this->service = $service;
        $this->magasin = $magasin;
        $this->enfants = $enfants;
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
    
    public function getMagasin()
    {
        return $this->magasin;
    }
    
    public function getEnfants()
    {
        return $this->enfants;
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
    
    public function setMagasin($magasin)
    {
        $this->magasin = $magasin;
    }
    
    public function setEnfants($enfants)
    {
        $this->enfants = $enfants;
    }

    // Méthode pour calculer le nombre d'années de service
    public function anneesDeService()
    {
        $dateEmbauche = new DateTime($this->dateEmbauche);
        $dateActuelle = new DateTime();
        $interval = $dateEmbauche->diff($dateActuelle);
        return $interval->y; // Retourne le nombre d'années
    }
    
    // Méthode pour vérifier si l'employé peut recevoir des chèques-vacances
    public function peutRecevoirChequesVacances()
    {
        return $this->anneesDeService() >= 1;
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
    
    // Calcul du chèque
    public function calculerChequesNoel()
    {
        $cheques = [
            '20' => 0,
            '30' => 0,
            '50' => 0
        ];

        $dateActuelle = new DateTime();
        
        foreach ($this->enfants as $dateNaissance) {
            $dateNaissance = new DateTime($dateNaissance);
            $age = $dateNaissance->diff($dateActuelle)->y;
            
            if ($age <= 10) {
                $cheques['20']++;
            } elseif ($age <= 15) {
                $cheques['30']++;
            } elseif ($age <= 18) {
                $cheques['50']++;
            }
        }
        
        return $cheques;
    }
}
?>
