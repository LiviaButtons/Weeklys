<?php
    header ('Cache-Control: no-cache'); // don't keep this file in cache
    header ('Content-Type: application/json'); // generate/expect JSON, NOT HTML or text

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
    
//    var_dump ($_POST);
//    echo $_POST['query'];
//    $_POST['query'] = 'gyoza';
    
    if (isset ($_POST['query']) && $_POST['query'] != '') {
        $input = strip_tags ($_POST['query']); // remove any tags
        $input = trim ($input); // trim spaces
        
        // regular and special characters that could cause issues with match
        $special = array ('à', 'è', 'é', 'ò', 'ù', 'â', 'ê', 'î', 'ô', 'û', 'ë', 'ï', 'ç', 'É', 'À', 'È', 'Ù', 'Â', 'Ê', 'Î', 'Ô', 'Û', 'Ë', 'Ï', 'Ç', 'Ä', 'ä', 'Ö', 'ö', 'Ü', 'ü', 'ß', 'Œ', 'œ', 'e', 'a', 'i', 'o', 'u', 'c');
        $input = str_replace ($special, '_', $input); // replace them with wildcard _ 

        // Create SQL request leaving a placeholder for user input
        // compare lowercase to lowercase to ensure matches despite capitalisation
        // add wildcard on either end so it doesn't need exact match
        $sqlSearch = "SELECT DISTINCT idRecette, nomRecette, image
                      FROM view_recettes
                      WHERE LOWER(nomRecette) LIKE CONCAT('%', LOWER(:input), '%')
                        OR LOWER(ingredient) LIKE CONCAT('%', LOWER(:input), '%')
                        OR LOWER(typeDeRepas) LIKE CONCAT('%', LOWER(:input), '%')
                        OR LOWER(categorie) LIKE CONCAT('%', LOWER(:input), '%')";

        // Prepare the request (send to server)
        $statement = $pdo->prepare ($sqlSearch);

        // Inject user input into the query
        $statement->bindValue(':input', $input, PDO::PARAM_STR);

        // Execute the request in the server
        $statement->execute();

        // Something not working?
//        var_dump ($statement->errorInfo());

        // Put results into a table
        $searchResults = $statement->fetchAll(PDO::FETCH_ASSOC);

        // Encode results and send them back
        
        // if successfull (AKA find more than one result)
//        if (count($searchResults) > 0) {
//            header("Location: ../recipes.html?query=" . $_POST['query']);
            echo json_encode($searchResults);
//        } else {
//            header("Location: ../recipes.html");
//            echo ('Pas de résultats pour la recherche de ' . $_POST['query'] . '. Voici toutes nos recettes !');
//        }
    }
?>