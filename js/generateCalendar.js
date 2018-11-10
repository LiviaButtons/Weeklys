/* Code with AJAX to connect to database and retrieve information */
/* used to populate the meal plan on the homepage w/o reloading page */
/* Author: Livia Bottoni */

$(document).ready (function (ev) {
    $('#calendarGenerator').on("click", function (e) {
        e.preventDefault ();
        
        let xhr = new XMLHttpRequest;

        xhr.onreadystatechange = function (e) {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    $results = JSON.parse(xhr.responseText);
//                    console.log (xhr.responseText);
//                    console.log ($results);
                    
                    // Split the results into relevant categories
                    $breakfast = $results[0];
                    $lunch = $results[1];
                    $dinner = $results[2];
//                    console.log ($breakfast);
//                    console.log ($breakfast.nomRecette);
//                    console.log ($breakfast.idRecette);
                    
                    function buildLink ($arr, $section) {
                        // build loop for 7 instances (7 weekday)
                        for ($x = 0; $x < 7; $x++) {
                            $link = document.createElement('a');
                            
                            // build URL passing info in GET
                            // to ensure landing on correct recipe page
                            $($link).attr({
                                'href': './recipes.html?idRecette=' + $arr[$x].idRecette,
                                'alt': $arr[$x].nomRecette
                            });
                            
                            // Inside the link, show the name of the recipe
                            $($link).html($arr[$x].nomRecette);  
//                            console.log ($link);
                            
                            // Add the recipe to the appropriate section
                            $rSection = $($section).get($x);
                            console.log($rSection);
                            $($rSection).html($link);
                        };
                    };
                    
                    buildLink ($breakfast, '.recipeB');
                    buildLink ($lunch, '.recipeL');
                    buildLink ($dinner, '.recipeD');
                
                } else {
                    console.log ('Error! ' + xhr.status);
                }
            }
        }

        xhr.open ('POST', './php/generateCalendar.php');
        xhr.send ();
    });
});