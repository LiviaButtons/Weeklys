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
//    echo json_encode($resultsB, $resultsL, $resultsD); // send all 3 resulting arrays at once or it'll bug
//    echo json_encode($resultsB);
//    echo json_encode($resultsL);
//    echo json_encode($resultsD);

    $fBreakfast = array(
        1=>'breakfast 1',
        2=>'breakfast 2',
        3=>'breakfast 3',
        4=>'breakfast 4',
        5=>'breakfast 5',
        6=>'breakfast 6',
        7=>'breakfast 7'
    );

    $fLunch = array(
        8=>'lunch 8',
        9=>'lunch 9',
        10=>'lunch 10',
        11=>'lunch 11',
        12=>'lunch 12',
        13=>'lunch 13',
        14=>'lunch 14'
    );

    $fDinner = array(
        15=>'dinner 15',
        16=>'dinner 16',
        17=>'dinner 17',
        18=>'dinner 18',
        19=>'dinner 19',
        20=>'dinner 20',
        21=>'dinner 21'
    );

    echo json_encode (array ($fBreakfast, $fLunch, $fDinner));
?>