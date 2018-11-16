<?php 

require_once('./php/config/config.php');  

try {

    $pdo = new PDO(MYSQL_DSN, DB_USER, DB_PWD);  
}
catch (PDOException $e) {

    echo $e->getMessage();
    $pdo = null; 
    die();
}

if (isset($_GET['code'])){
    $idRecette = $_GET['code'];
    $query = "SELECT * FROM view_cook WHERE idRecette = $idRecette";
    $statement = $pdo->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
    
    $queryIngredients = "SELECT t_recette.idRecette, t_ingredientrecette.ingredientQuantite, t_ingredientrecette.ingredientMesure, t_ingredient.nomIngredient, t_recette.difficulte, t_recette.serving FROM t_recette 
                            JOIN t_ingredientrecette
	                           ON t_ingredientrecette.idRecette = t_recette.idRecette
                            JOIN t_ingredient
	                           ON t_ingredient.idIngredient = t_ingredientrecette.idIngredient

                        WHERE t_recette.idRecette = $idRecette";
    $statement = $pdo->prepare($queryIngredients);
    $statement->execute();
    $ingredients = $statement->fetchAll(PDO::FETCH_ASSOC);
    
    /*$queryIngredients = "SELECT t_recette.idRecette,  t_recette.serving FROM t_recette 
                            JOIN t_ingredientrecette
	                           ON t_ingredientrecette.idRecette = t_recette.idRecette
                            JOIN t_ingredient
	                           ON t_ingredient.idIngredient = t_ingredientrecette.idIngredient

                        WHERE t_recette.idRecette = $idRecette";
    $statement = $pdo->prepare($queryIngredients);
    $statement->execute();
    $ingredients = $statement->fetchAll(PDO::FETCH_ASSOC);*/
    
    $queryEtapes = "SELECT t_etapes.descriptEtapes FROM t_etapes 
                        JOIN t_recette
	                    on t_etapes.idRecette = t_recette.idRecette
                    WHERE t_recette.idRecette = $idRecette";
    $statement = $pdo->prepare($queryEtapes);
    $statement->execute();
    $etapes = $statement->fetchAll(PDO::FETCH_ASSOC);
    
    
}else {
    echo 'Problème technique.';
}


?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Weekly's | Préparation de la recette</title>
    <link rel="shortcut icon" type="image/png" href="./assets/favicon/favicon-64.png">
    <link rel="stylesheet" href="./css/style_print_recette.css" type="text/css" media="print">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
   
   
    <!-- JavaScript and jQuery -->
        <script src="./js/jquery-3.3.1.min.js"></script>
        <script src="./js/jquery-ui.min.js"></script>
        <script src="./js/sendMail.js"></script>
        <script src="./js/mobileCalendar.js"></script>
        <script src="./js/headerNav.js"></script>
        <script src="./js/hamburgerMenu.js"></script>
        <script src="./js/generateCalendar.js"></script>
        <script src="./js/searchBar.js"></script>
        <!-- social share sticky bar -->
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5bea9fd2ea520ec1"></script>
        
        <!-- CSS Stylesheets -->
        <link rel="stylesheet" href="./css/normalize.css">
        <link rel="stylesheet" href="./css/fontawesome-all.min.css">
        <link rel="stylesheet" href="./css/jquery-ui.min.css">
        <link rel="stylesheet" href="./css/preparation.css">
        <link rel="stylesheet" href="./css/style_print_recette.css">
        <link rel="stylesheet" href="./headFoot/headerFooter.css">
    
    
    
    
</head>
<body>
    <!--<?php include('./headFoot/header.php')?>-->
    
   <!--Header-->
    <header class="nav-down">
        <div> 
            <div class="logo">
                <div class="logoImg">
                    <a href="./index.html" target="_self">
                    <img src="./assets/logo/onlyBowl.png" alt="Weekly's logo">
                    </a>
                </div>

                <div class="logoText">
                    <h1>Weekly's</h1>
                    <p>plan it, cook it, eat it</p> 
                </div>
            </div>
        
            <div id="auto1" class="dbSearch mobileHidden tabletHidden">
                    <label for="searchField" hidden>Search</label>
                    <input id="search1" name="searchField" class="mobileHidden searchInput" type="text" placeholder="Recherche...">
                    <button id="searchButton1" class="fas fa-search mobileHidden searchButton"></button>
            </div>
        
            <div id="hamMenu" class="tabletShow desktopHidden hamMenu noprint">
                <span class="fas fa-bars fa-3x"></span>
            </div>
        
            <nav class="tabletHidden desktopShow noprint">
                <ul>
                    <li ><a href="./index.html">Accueil</a></li>
                    <li ><a href="./recettes.php">Recettes</a></li>
                    <li>
                        <a href="./index.html">EN</a>
                        <a href="./index.html">FR</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    
    
    
    <!---->
    
    
    
  
  
   <div id="titreRecette" class="">
        <h2 id="nomRecette"><?php echo $result[0]['nomRecette'];?></h2>
       
        
        <!--<div class="calendarShare mobileHidden noprint">
            <span><img src="./assets/favicon/if_Share_853347.png" alt=""></span>
            <span><a href="javascript:window.print()"><img src="./assets/favicon/if_Noun_Project_100Icon_10px_grid-28_296916.png" alt=""></a></span>
        </div>-->
   </div>
   
   
    <main>
        <div>
            <section id="section1" class="">
                <div id="imageRecette">
                    <img src="./assets/img/<?php echo $result[0]['image'];?>" alt="">
                </div>
                <div id="etapeRecette">
                    <h3>Préparation</h3> <br>
                    
                    <!--<?php
                        
                        for ($i=0; $i < count($etapes)   ;$i++){
                            if ($result[$i]['etapes'] > 0){
                            echo '<h4>' . 'Etape ' . $etapes[$i+1] . '</h4>';
                                
                            }
                        }
                    
                    ?>-->
                    
                    
                       <?php
                       for($i = 0; $i< count($etapes) ; $i++){
                           $j = $i +1 ;
                        ?>
                       <?php echo '<h4>Étape '. $j .'</h4>' . '<p>'.$etapes[$i]['descriptEtapes'] . '<p>' . '<br>'?>
                       <?php
                       }
                        ?>
                </div>
            </section>
            
            <section id="section2" class="">
                <div id="contenuTemps">
                    <p id="difficulte">
                        <?php 
                            if ($result[0]['difficulte'] == 1){
                                echo 'Difficulté : Facile.';
                            } else if ($result[0]['difficulte'] == 2){
                                echo 'Difficulté : Moyen.';
                            } else {
                                echo 'Difficulté : Difficile.';
                            }
                        
                        ?>
                    </p>
                    
                    <p>
                        <?php 
                            if ($result[0]['cout'] == 1){
                                echo 'Coût : Bon marché.';
                            } else if ($result[0]['cout'] == 2){
                                echo 'Coût : Moyen.';
                            } else {
                                echo 'Coût : Élevé.';
                            }
                        
                        ?>
                    </p>        
                    
                    <p>Temps de préparation : <?php echo $result[0]['tempsDePrep'] . ' min.' ?></p>
                    <p>Temps de repos : <?php echo $result[0]['tempsDeRepos'] . ' min.' ?></p>  <!--METTRE UNE CONDITION SI 0-->
                    <p>Temps de cuisson : <?php echo $result[0]['tempsDeCuisson'] . ' min.' ?></p>
                    <!--<p>Temps total : 3h15</p>-->
                </div>
                
                <div id="portion" class="noprint">
                   <form name="form" action="preparation.php" method="post">
                       
                        Portions : 
                        <input name="serving" id="serving" type="number" value="<?php echo $ingredients[0]['serving']?>" min="1" max="100" <!--onchange="fonctionMachin();-->">
                        <button class="serving">Calculer</button>
                    </form>
                </div>
                
                <div id="contenuIngredient">
                   
                   <h3>Ingrédients : </h3>
                   <!--
                   <ul class="ingrendient_serving">
                        <?php
                        if (isset($_POST['serving'])){
                            for($i = 0; $i< count($ingredients) ; $i++){ 
                                if($ingredients[$i]['ingredientQuantite'] != 0){
                        ?>
                                <li> <?php echo ($_POST['serving'] * $ingredients[$i]['ingredientQuantite'])  . ' ' .  $ingredients[$i]['ingredientMesure'] . ' ' . $ingredients[$i]['nomIngredient'];?></li>
                        <?php    
                                }
                                else {
                        ?>
                                <li><?php echo  ' ' . $ingredients[$i]['ingredientMesure'] . ' ' . $ingredients[$i]['nomIngredient']?></li>
                        <?php
                                }
                            }
                        }
                        ?>
                      
                       
                    </ul>-->
                   
                   
                   <ul class="ingredients">
                        <?php
    
   
                        for($i = 0; $i< count($ingredients) ; $i++){
                            if($ingredients[$i]['ingredientQuantite'] != 0){
                        ?>
                            <li><?php echo $ingredients[$i]['ingredientQuantite'] . ' ' .  $ingredients[$i]['ingredientMesure'] . ' ' . $ingredients[$i]['nomIngredient']?></li>
                        <?php
                            }
                            else {
                        ?>
                            <li><?php echo  ' ' . $ingredients[$i]['ingredientMesure'] . ' ' . $ingredients[$i]['nomIngredient']?></li>
                        <?php
                            }
                        }
                        ?>
                   </ul>
                   
                </div>

            </section>
        </div>
    </main>
<?php include('./headFoot/footer.php')?>
<script>
  
    
</script>


<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5bea9fd2ea520ec1"></script>


     
</body>
</html>