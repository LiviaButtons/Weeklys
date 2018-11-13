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

    // general SQL queries building blocks
    $sqlStart = "SELECT DISTINCT idRecette, nomRecette
                 FROM view_cook";
    $sqlB = " WHERE typeDeRepas = 'Petit-déjeuner'";
    $sqlL = " WHERE typeDeRepas = 'Déjeuner'";
    $sqlD = " WHERE typeDeRepas = 'Dîner'";
    $sqlVege = " AND categorie = 'Végétarien'"; 
    $sqlEnd = " ORDER BY rand()
                LIMIT 7";
    $sqlSoloEnd = " ORDER BY rand()
                 LIMIT 1";
    
    // if we want to generate the whole calendar
//    if (something) {
        // build queries for entire calendar
        $sqlBreakfast = $sqlStart . $sqlB;
        $sqlLunch =  $sqlStart . $sqlL;
        $sqlDinner =  $sqlStart . $sqlD;
        
        // if there's a value set in POST (AKA vegetarian is checked)
        if (isset ($_POST["vege"]) && !empty($_POST["vege"])) {
        // adapt sql queries
            $sqlBreakfast .= $sqlVege;
            $sqlLunch .= $sqlVege;
            $sqlDinner .=  $sqlVege;
        } 

        // complete SQL queries with for all 7 
        $sqlBreakfast .= $sqlEnd;
        $sqlLunch .= $sqlEnd;
        $sqlDinner .= $sqlEnd;

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
//        echo json_encode(array($resultsB, $resultsL, $resultsD)); 
        // send an array containing all 3 result arrays, or it'll bug
//    }
    
//    echo $_POST['other'];
    
    // if you received a value for either breakfast, lunch or dinner
    // that means somebody clicked to regenerate a single recipe
//    $_POST['meal'] = 'Petit-déjeuner';
    
    if (isset ($_POST["breakfast"]) || (isset ($_POST["lunch"])) || isset ($_POST["dinner"])) {
        // start building solo query
        $sqlSolo = $sqlStart;
        
        // adapt to retrieve correct meal cateogry
//        if ($_POST["meal"] == "Petit-déjeuner") {
        if (isset ($_POST["breakfast"])) {
            $sqlSolo .= $sqlB;
//        } else if ($_POST["meal"] == "Déjeuner") {
        } else if (isset ($_POST["lunch"])) {
            $sqlSolo .= $sqlL;
//        } else if ($_POST["meal"] == "Dîner") {
        } else if (isset ($_POST["dinner"])) {
            $sqlSolo .= $sqlD;  
        }
        
        // if vegetarian is set, ensure new recipe is vegetarian also
        if (isset ($_POST["vege"]) && !empty($_POST["vege"])) {
                $sqlSolo .= $sqlVege;
        }
        
        // complete solo query
        $sqlSolo .= $sqlSoloEnd;
        
        // execute it, put results into table, send them back
        $statementS = $pdo->prepare ($sqlSolo);
        $statementS->execute();
        $resultsS = $statementS->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($resultsS);
    }

?>