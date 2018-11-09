<?php
    // use the config file
    require_once('./config/config.php');
    
    // Create connection to the database
    try {
        $pdo = new PDO(MYSQL_DSN, DB_USER, DB_PWD);
    }
    //die if it doesn't work
    catch (Exception $e){
        die ('Erreur: '.$e->getMessage());
    }

    // Create SQL requests - one each for breakfast, lunch, dinner
    // randomise results
    // only show the first seven (one for each weekday)
    $sqlBreakfast = "SELECT DISTINCT idRecette, nomRecette 
                     FROM view_recettes
                     WHERE typeDeRepas = 'Petit-déjeuner'
                     ORDER BY rand() 
                     LIMIT 7";
    $sqlLunch = "SELECT DISTINCT idRecette, nomRecette 
                 FROM view_recettes
                 WHERE typeDeRepas = 'Déjeuner'
                 ORDER BY rand()
                 LIMIT 7";
    $sqlDinner = "SELECT DISTINCT idRecette, nomRecette 
                  FROM view_recettes
                  WHERE typeDeRepas = 'Dîner'
                  ORDER BY rand()
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
    echo json_encode($resultsB);
//    echo json_encode($resultsL);
//    echo json_encode($resultsD);
?>