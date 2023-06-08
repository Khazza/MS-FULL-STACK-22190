<?php
    include 'classes/Employe.class.php';


    $employe1 = new Employe("Doe", "Jhon", "2010-06-01", "Manager", 50, "Comptabilité");
    $employe2 = new Employe("Doe", "Jane", "2015-04-15", "Comptable", 40, "Comptabilité");
    $employe3 = new Employe("Case", "Justin", "2012-08-24", "Commercial", 45, "Commercial");

    var_dump($employe1);
    var_dump($employe2);
    var_dump($employe3);
?>