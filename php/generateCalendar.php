<?php
    // include the config file
    require_once('./config/config.php');
    
    // 1. Create connection to the database
    try {
        $pdo = new PDO(MYSQL_DSN, DB_USER, DB_PWD);
    }

    catch (Exception $e){
        die ('Erreur: '.$e->getMessage());
    }

    // 2. Create SQL request
    $sqlSnack = "SELECT DISTINCT idRecette, nomRecette 
                 FROM view_recettes
                 WHERE typeDeRepas = 'Snack'
                 ORDER BY rand()
                 LIMIT 7";
    
//    $sqlBreakfast = "SELECT DISTINCT idRecette, nomRecette 
//                     FROM view_recettes
//                     WHERE typeDeRepas = 'Petit-déjeuner'
//                     ORDER BY rand()
//                     LIMIT 7";
//    $sqlLunch = "SELECT DISTINCT idRecette, nomRecette 
//                 FROM view_recettes
//                 WHERE typeDeRepas = 'Déjeuner'
//                 ORDER BY rand()
//                 LIMIT 7";
//    $sqlDinner = "SELECT DISTINCT idRecette, nomRecette 
//                  FROM view_recettes
//                  WHERE typeDeRepas = 'Dîner'
//                  ORDER BY rand()
//                  LIMIT 7";

    // 3. Prepare the request (send to server)
    $statementS = $pdo->prepare ($sqlSnack);
//    $statementB = $pdo->prepare ($sqlBreakfast);
//    $statementL = $pdo->prepare ($sqlLunch);
//    $statementD = $pdo->prepare ($sqlDinner);

    // 4. Give the parameters a value (based on form etc.)
//    $statement->bindValue(':date', $_POST['datepicker'], PDO::PARAM_STR);

    // 5. Execute the request in the server
    $statementS->execute();
//    $statementB->execute();
//    $statementL->execute();
//    $statementD->execute();

    // 5.1 Something not working?
//     var_dump ($statementB->errorInfo());
//     var_dump ($statementL->errorInfo());
//     var_dump ($statementD->errorInfo());

    // 5.2 Put results into a table
    $resultsS = $statementS->fetchAll(PDO::FETCH_ASSOC);
//    $resultsB = $statementB->fetchAll(PDO::FETCH_ASSOC);
//    $resultsL = $statementL->fetchAll(PDO::FETCH_ASSOC);
//    $resultsD = $statementD->fetchAll(PDO::FETCH_ASSOC);

    // 6. Send results back
    echo json_encode($resultsS);
//    echo json_encode($resultsB);
//    echo json_encode($resultsL);
//    echo json_encode($resultsD);
?>