<?php
    header ('Cache-Control: no-cache'); // don't keep info in cache
    header ('Content-Type: application/json'); // expect & generate JSON

    // use the config file
    require_once('./config/config.php');
    
    // Create connection to the database
    try {
        $pdo = new PDO(MYSQL_DSN, DB_USER, DB_PWD);
    }
    //die if it doesn't work
    catch (Exception $e){
        die ('Erreur: '.$e->getMessage());
        $pdo = null;
    }
    
    // SQL queries -- first half
    $sqlBreakfast = "SELECT DISTINCT idRecette, nomRecette 
                     FROM view_cook
                     WHERE typeDeRepas = 'Petit-déjeuner'";
    $sqlLunch = "SELECT DISTINCT idRecette, nomRecette 
                 FROM view_cook
                 WHERE typeDeRepas = 'Déjeuner'";
    $sqlDinner = "SELECT DISTINCT idRecette, nomRecette 
                  FROM view_cook
                  WHERE typeDeRepas = 'Dîner'";
    
    // if there's a value set in POST (AKA vegetarian is checked)
    if (isset ($_POST["vege"]) && !empty($_POST["vege"])) {
    // adapt sql queries
        $sqlBreakfast .= " AND categorie = 'Végétarien'
                          ORDER BY rand()
                          LIMIT 7";
        
        $sqlLunch = " AND categorie = 'Végétarien'
                     ORDER BY rand()
                     LIMIT 7";
        
        $sqlDinner = " AND categorie = 'Végétarien'
                      ORDER BY rand()
                      LIMIT 7";
    } 
    
    // Complete SQL queries
    // by retrieving only 7 results, at random
    $sqlBreakfast .= " ORDER BY rand()
                      LIMIT 7";
    $sqlLunch .= " ORDER BY rand()
                      LIMIT 7";
    $sqlDinner .= " ORDER BY rand()
                LIMIT 7";

    // Prepare the request (send to server)
    $statementB = $pdo->prepare ($sqlBreakfast);
    $statementL = $pdo->prepare ($sqlLunch);
    $statementD = $pdo->prepare ($sqlDinner);

    // Execute the request in the server
    $statementB->execute();
    $statementL->execute();
    $statementD->execute();

    // Something not working?
//     var_dump ($statementB->errorInfo());
//     var_dump ($statementL->errorInfo());
//     var_dump ($statementD->errorInfo());

    // Put results into a table
    $resultsB = $statementB->fetchAll(PDO::FETCH_ASSOC);
    $resultsL = $statementL->fetchAll(PDO::FETCH_ASSOC);
    $resultsD = $statementD->fetchAll(PDO::FETCH_ASSOC);

    // Encode results and send them back
    echo json_encode(array($resultsB, $resultsL, $resultsD)); 
    // send an array containing all 3 result arrays, or it'll bug
?>