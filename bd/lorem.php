<?php

try {
    $connection = new PDO('mysql:host=localhost;dbname=listimg','root','');

} catch (PDOException $exc) {
    echo $exc->getMessage();
    die("pailas");
    //throw $th;
}

$makeQuery= "SELECT * FROM cursos WHERE id_cursos =".$_GET['id_cursos'].";";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();
$myarray= array();

while ($resultsFrom = $stamement ->fetch()) {
    array_push(
        $myarray,array(
            "id_cursos"=>$resultsFrom['id_cursos'],
            "nombre"=>$resultsFrom['nombre'],
            "desc_curso"=>$resultsFrom['desc_curso'],
            "id_fichas"=>$resultsFrom['id_fichas']
        )

    );
}
echo json_encode($myarray);
?>

