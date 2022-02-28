<?php
try {
    $connection = new PDO('mysql:host=localhost;dbname=listimg','root','');
    $connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

} catch (PDOException $exc) {
    echo $exc->getMessage();
    die("pailas");
    //throw $th;
}

?>