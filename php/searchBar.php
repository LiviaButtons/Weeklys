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
    
    $input = strip_tags ($_GET['query']);
    $input = trim ($input);
    
    // Create SQL request
    // leaving space for user input
    // compare lowercase to lowercase to ensure matches despite capitalisation
    $sqlSearch = "SELECT DISTINCT idRecette, nomRecette, image
                  FROM view_cook
                  WHERE LOWER(nomRecette) LIKE LOWER(%:input%)
                    OR LOWER(ingredient) LIKE LOWER(%:input%)
                    OR LOWER(typeDeRepas) LIKE LOWER(%:input%)";
    
    // Prepare the request (send to server)
    $statement = $pdo->prepare ($sqlSearch);

    // Inject user input into the query
    $statement->bindValue(':input', $input, PDO::PARAM_STR);
    
    // Execute the request in the server
    $statement->execute();

    // Something not working?
     var_dump ($statement->errorInfo());


    // Put results into a table
    $searchResults = $statement->fetchAll(PDO::FETCH_ASSOC);

    // Encode results and send them back
//    echo json_encode($searchResults);
    var_dump ($searchResults);
?>