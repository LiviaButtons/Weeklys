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
    $sqlBreakfast = "SELECT id, nom FROM view_recette
                     WHERE typeDeRepas = snack";
    $sqlLunch = "SELECT id, nom FROM view_recette
                 WHERE typeDeRepas = snack";
    $sqlDinner = "SELECT id, nom FROM view_recette
                  WHERE typeDeRepas = snack";

    // 3. Prepare the request (send to server)
    $statementB = $pdo->prepare ($sqlBreakfast);
    $statementL = $pdo->prepare ($sqlLunch);
    $statementD = $pdo->prepare ($sqlDinner);

    // 4. Give the parameters a value (based on form etc.)
//    $statement->bindValue(':date', $_POST['datepicker'], PDO::PARAM_STR);

    // 5. Execute the request in the server
    $statementB->execute();
    $statementL->execute();
    $statementD->execute();

    // 5.1 Something not working?
//     var_dump ($statement->errorInfo());

    // 5.2 Put results into a table
    $resultsB = $statementB->fetchAll(PDO::FETCH_ASSOC);
    $resultsL = $statementL->fetchAll(PDO::FETCH_ASSOC);
    $resultsD = $statementD->fetchAll(PDO::FETCH_ASSOC);

    // 6. Send results back
    echo json_encode($resultsB);
    echo json_encode($resultsL);
    echo json_encode($resultsD);
?>