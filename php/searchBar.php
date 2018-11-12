<?php
    // NEVER keep this file in cache
    header ('Cache-Control: no-cache');
    // otherwise, it risks executing this PHP page again
    // with previously used values, instead of executing it from scratch

    // generate/expect JSON, NOT HTML or text
    header ('Content-Type: application/json');
    // telling PHP what type of data to produce

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
    // leaving a placeholder for user input
    // compare lowercase to lowercase to ensure matches despite capitalisation
    $sqlSearch = "SELECT DISTINCT idRecette, nomRecette, image
                  FROM view_cook
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
//    var_dump ($statement->errorInfo());


    // Put results into a table
    $searchResults = $statement->fetchAll(PDO::FETCH_ASSOC);

    // Encode results and send them back
    echo json_encode($searchResults);
?>