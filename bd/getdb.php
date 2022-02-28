
<?php
require('conection.php');
$makeQuery= "SELECT *FROM img";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();
$myarray= array();

while ($resultsFrom = $stamement ->fetch()) {
    array_push(
        $myarray,array(
            "id"=>$resultsFrom['id'],
            "url"=>$resultsFrom['url'],
            "desc_img"=>$resultsFrom['desc_img']
        )

    );
}
echo json_encode($myarray);
?>