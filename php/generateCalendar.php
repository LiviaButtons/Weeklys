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
    $sql = "SELECT * FROM t_recette";

    // 3. Prepare the request (send to server)
    $statement = $pdo->prepare ($sql);

    // 4. Give the parameters a value (based on form etc.)
//    $statement->bindValue(':date', $_POST['datepicker'], PDO::PARAM_STR);

    // 5. Execute the request in the server
    $statement->execute();

    // 5.1 Something not working?
     var_dump ($statement->errorInfo());

    // 5.2 Put results into a table
    $results = $statement->fetchAll(PDO::FETCH_ASSOC);

    // 6. Send results back
    echo json_encode($results);
?>