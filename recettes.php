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


?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Weekly's | Liste des recettes</title>
    <link rel="shortcut icon" href="./assets/favicon/favicon-64.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
   
    <!--Filtre-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>

    
    <!--PAGINATION-->
    
    <script type="text/javascript" src="./simplePagination/jquery.simplePagination.js"></script>
    <link type="text/css" rel="stylesheet" href="./simplePagination/simplePagination.css"/>

           
    
    <link rel="stylesheet" href="./css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./css/normalize.css">
    <!--<link rel="stylesheet" href="./css/style.css">-->
    <link rel="stylesheet" href="./css/liste.css">
    <link rel="stylesheet" href="./headFoot/headerFooter.css">
    
    <script src='./js/headerNav.js'></script>
    <script src='./js/hamburgerMenu.js'></script>
    <script src='./js/sendMail.js'></script>
    <script src='./js/searchBar.js'></script>
    
    
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
        
            <div id="hamMenu" class="tabletShow desktopHidden hamMenu">
                <span class="fas fa-bars fa-3x"></span>
            </div>
        
            <nav class="tabletHidden desktopShow">
                <ul>
                    <li ><a href="./index.html">Accueil</a></li>
                    <li class="active">Recettes</li>
                    <li>
                        <a href="./index.html">EN</a>
                        <a href="./index.html">FR</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    
    
    
    <!---->
    <div class="un">
    <h2 class="titreRecette">Les recettes</h2>
    </div>
    
    <main>
        <div>
            <section id="section1">
                <div>
                    <!--********************************************Par temps-->
                    <h3><img src="./assets/favicon/if_Artboard_5_3818480%20(1).png" alt=""> - Temps</h3>
            
                    <?php

                    $query = "
                    SELECT DISTINCT(dureeEnTranche) FROM view_cook 
                    ";
                    $statement = $pdo->prepare($query);
                    $statement->execute();
                    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                    
                    /*var_dump($result);*/
                    foreach($result as $row)
                    {
                        
                    ?>
                    <form action="" class="">
                        <label class="container">
                        <input type="checkbox" class="common_selector dureeEnTranche" value="<?php echo $row['dureeEnTranche']; ?>" > <?php echo $row['dureeEnTranche']; ?>
                        <span class="checkmark"></span>
                        </label>
                    </form>
                    
                    <?php
                    }
                    ?>
                    
                
                    <br>
                    <hr>
            
                   
                    <!--********************************************Par Catégorie-->
                    <h3><img src="./assets/favicon/if_burger_hamburger_meat_cheese_food_meal_fast_restaurant_junk_fastfood_3465572.png" alt=""> - Catégorie</h3>
            
                    <?php

                    $query = "
                    SELECT DISTINCT(categorie) FROM view_cook ORDER BY categorie ASC
                    ";
                    $statement = $pdo->prepare($query);
                    $statement->execute();
                    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                    /*
                    var_dump($result);*/
                    foreach($result as $row)
                    {
                        
                    ?>
                    <form action="" class="">
                        <label class="container">
                        <input type="checkbox" class="common_selector categorie" value="<?php echo $row['categorie']; ?>" > <?php echo $row['categorie']; ?>
                        <span class="checkmark"></span>
                        </label>
                    </form>
                    
                    <?php
                    }
                    ?>
                    
                
                    <br>
                    <hr>
            
                    <!--********************************************Par repas-->
                    <h3><img src="./assets//favicon/if_clock__time__hours__minutes__3653396.png"  alt=""> - Repas</h3>
           
                    <?php

                    $query = "
                    SELECT DISTINCT(typeDeRepas) FROM view_cook 
                    ";
                    $statement = $pdo->prepare($query);
                    $statement->execute();
                    $result = $statement->fetchAll();
                    /*var_dump($result);*/
                    foreach($result as $row)
                    {
                    ?>
                    <form action="">
                        <label class="container">
                        <input type="checkbox"  class="common_selector typeDeRepas" value="<?php echo $row['typeDeRepas']; ?>" > <?php echo $row['typeDeRepas']; ?>
                        <span class="checkmark"></span>
                        </label>
                
                    
                    </form>
                    <?php
                    }
                    ?>
                </div>
            </section>
        
            <section id="section2">
                <div class="row filter_data">
                </div>
                
                <div class="page"></div>
            </section>
     
        </div>
       
    </main>
    
    <?php include('./headFoot/footer.php')?>
    
    
<style>
#loading
{
 text-align:center; 
 background: url('loader.gif') no-repeat center; 
 height: 150px;
}
</style>

<script>
$(document).ready(function(){
   
    filter_data();
  
    function filter_data()
    {
        // la limite d'éléments par page
        var limite =9;
        
        $('.filter_data').html('<div id="loading" style="" ></div>');
        var action = 'fetch_data';
        var typeDeRepas = get_filter('typeDeRepas');
        var categorie = get_filter('categorie');
        var dureeEnTranche = get_filter('dureeEnTranche');
        
        $.ajax({
            url:"fetch_recettes.php",
            method:"POST",
            data:{action:action, typeDeRepas:typeDeRepas, categorie:categorie, dureeEnTranche:dureeEnTranche,limite:limite},
            success:function(data){
                
                // afficher tous les divs
                $('.filter_data').html(data);
                var total_row = $('div.pagi').data('total');
                total_row_nb = parseInt(total_row);
                
                
                // afficher la premiere page
                var arrayDiv = document.getElementsByClassName('pagi');
                // afficher les premiers div
                for (var i=0;i< limite ;i++){
                        arrayDiv[i].style.display = "flex";    
                }
                
                
        // pagination
        $(function() {
            $('.page').pagination({
                items: total_row_nb,
                itemsOnPage: limite,
                cssStyle: 'light-theme',
                currentPage: 1,
                onPageClick: function(index){
                    console.log ("page :" +index);
                    //  les éléments affichés
                    var arrayDiv = document.getElementsByClassName('pagi');
                    // afficher les divs qu'on doit afficher
                    for (var i=0;i< arrayDiv.length ;i++){
                        if(i>=(index-1)*limite && i<(index-1)*limite + limite){
                            arrayDiv[i].style.display = "flex";    
                        }
                        else {
                            arrayDiv[i].style.display = "none";
                        }
                    }
                            
                    // afficher: aller de (page - 1) * 5 jusqua  limite +  limite * 
                }
            });
        });
                
                

                console.log(total_row_nb); 
            }
        });
        
       
    }
    

    
    
    function get_filter(class_name)
    {
        var filter = [];
        $('.'+class_name+':checked').each(function(){
            filter.push($(this).val());
        });
        return filter;
    }

    $('.common_selector').click(function(){
        filter_data();
    });
    
    

      /*$('#search').keyup(function(){  
           var query = $(this).val();  
           if(query != '')  
           {  
                $.ajax({  
                     url:"search.php",  
                     method:"POST",  
                     data:{query:query},  
                     success:function(data)  
                     {  
                          $('#rechercheResultat').fadeIn();  
                          $('#rechercheResultat').html(data);  
                     }  
                });  
           }  
      });  
      $(document).on('click', 'li', function(){  
           $('#search').val($(this).text());  
           $('#rechercheResultat').fadeOut();  
      });  */
    
                
    
});
</script>    
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5bea9fd2ea520ec1"></script>
</body>
</html>