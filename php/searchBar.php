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
    
    echo ($_GET['searchTerm']);
    
    // Create SQL requests - one each for breakfast, lunch, dinner
    // leaving space for user input
        $sqlSearch = "SELECT DISTINCT idRecette, nomRecette, image
                         FROM view_recettes
                         WHERE nomRecette LIKE % . input . %
                            OR ingredient LIKE % . :input . %
                            OR typeDeRepas LIKE % . :input . %
                            OR categorie LIKE % . :input . %";
    
    // Prepare the request (send to server)
//    $statement = $pdo->prepare ($sqlSearch);

    // Inject user input into the query
    $sqlSearch->bindValue (':input', $_GET['searchTerm'], PDO::PARAM_STR);

    // Execute the request in the server
//    $statement->execute();

    // Something not working?
     var_dump ($statement->errorInfo());


    // Put results into a table
//    $searchResults = $statement->fetchAll(PDO::FETCH_ASSOC);

    // Encode results and send them back
//    echo json_encode($searchResultsB);
?>