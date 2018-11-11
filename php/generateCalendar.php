<?php
    // use the config file
//    require_once('./config/config.php');
    
    // Create connection to the database
//    try {
//        $pdo = new PDO(MYSQL_DSN, DB_USER, DB_PWD);
//    }
    //die if it doesn't work
//    catch (Exception $e){
//        die ('Erreur: '.$e->getMessage());
//    }
    
    
    // if there's a value set in POST (AKA vegetarian is checked)
//    if (isset ($_POST["vege"]) && !empty($_POST["vege"])) {
    // Create SQL requests - one each for breakfast, lunch, dinner
    // make sure to only select recipes with vegetables
    // randomise results
    // only show the first seven (one for each weekday)
//        $sqlBreakfast = "SELECT DISTINCT idRecette, nomRecette
//                         FROM view_recettes
//                         WHERE typeDeRepas = 'Petit-déjeuner'
//                         AND categorie = 'Légumes'
//                         ORDER BY rand()
//                         LIMIT 7";
//        
//        $sqlLunch = "SELECT DISTINCT idRecette, nomRecette
//                     FROM view_recettes
//                     WHERE typeDeRepas = 'Déjeuner'
//                     AND categorie = 'Légumes'
//                     ORDER BY rand()
//                     LIMIT 7";
//        
//        $sqlDinner = "SELECT DISTINCT idRecette, nomRecette
//                     FROM view_recettes
//                     WHERE typeDeRepas = 'Dîner'
//                     AND categorie = 'Légumes'
//                     ORDER BY rand()
//                     LIMIT 7";
//    } else {
    // Vegetarian is NOT checked
    // thus choose any random 7 recipes from the right category
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
//    }

    // Prepare the request (send to server)
//    $statementB = $pdo->prepare ($sqlBreakfast);
//    $statementL = $pdo->prepare ($sqlLunch);
//    $statementD = $pdo->prepare ($sqlDinner);

    // Execute the request in the server
//    $statementB->execute();
//    $statementL->execute();
//    $statementD->execute();

    // Something not working?
//     var_dump ($statementB->errorInfo());
//     var_dump ($statementL->errorInfo());
//     var_dump ($statementD->errorInfo());

    // Put results into a table
//    $resultsB = $statementB->fetchAll(PDO::FETCH_ASSOC);
//    $resultsL = $statementL->fetchAll(PDO::FETCH_ASSOC);
//    $resultsD = $statementD->fetchAll(PDO::FETCH_ASSOC);

    // Encode results and send them back
//    echo json_encode(resultsB, $resultsL, $resultsD); // send all 3 resulting arrays at once or it'll bug

    $fBreakfast = array(
        0 => array (
            'idRecette' => 1,
            'nomRecette'=>'breakfast 1'
        ),
        1 => array (
            'idRecette' => 2,
            'nomRecette'=>'breakfast 2'
        ),
        2 => array (
            'idRecette' => 3,
            'nomRecette'=>'breakfast 3'
        ),
        3 => array (
            'idRecette' => 4,
            'nomRecette'=>'breakfast 4'
        ),
        4 => array (
            'idRecette' => 5,
            'nomRecette'=>'breakfast 5'
        ),
        5 => array (
            'idRecette' => 6,
            'nomRecette'=>'breakfast 6'
        ),
        6 => array (
            'idRecette' => 7,
            'nomRecette'=>'breakfast 7'
        )
    );

    $fLunch = array(
        0 => array (
            'idRecette' => 8,
            'nomRecette'=>'lunch 8'
        ),
        1 => array (
            'idRecette' => 9,
            'nomRecette'=>'lunch 9'
        ),
        2 => array (
            'idRecette' => 10,
            'nomRecette'=>'lunch 10'
        ),
        3 => array (
            'idRecette' => 11,
            'nomRecette'=>'lunch 11'
        ),
        4 => array (
            'idRecette' => 12,
            'nomRecette'=>'lunch 12'
        ),
        5 => array (
            'idRecette' => 13,
            'nomRecette'=>'lunch 13'
        ),
        6 => array (
            'idRecette' => 14,
            'nomRecette'=>'lunch 14'
        )
    );

    $fDinner = array(
        0 => array (
            'idRecette' => 15,
            'nomRecette'=>'dinner 15'
        ),
        1 => array (
            'idRecette' => 16,
            'nomRecette'=>'dinner 16'
        ),
        2 => array (
            'idRecette' => 17,
            'nomRecette'=>'dinner 17'
        ),
        3 => array (
            'idRecette' => 18,
            'nomRecette'=>'dinner 18'
        ),
        4 => array (
            'idRecette' => 19,
            'nomRecette'=>'dinner 19'
        ),
        5 => array (
            'idRecette' => 20,
            'nomRecette'=>'dinner 20'
        ),
        6 => array (
            'idRecette' => 21,
            'nomRecette'=>'dinner 21'
        )
    );

    echo json_encode (array ($fBreakfast, $fLunch, $fDinner));
?>