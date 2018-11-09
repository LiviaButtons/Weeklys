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
                    
                    for ($i = 0; $i < $results.length; $i++) {
                        console.log ($results[$i]);
                        $link = document.createElement('a');
                        // create a link element, and give it the correct attributes
                        $($link).attr({
                            'href': './recipes.html?idRecette=' + $results[$i].idRecette,
                            //build URL that passes info (the recipe ID) in GET
                            //so that you'll land on the correct recipe page
                            'alt': $results[$i].nomRecette
                        });
                        $($link).text($results[$i].nomRecette);
                        
                        $('.recipeB').each(function (i) {
                            $(this).html($link);
                        });
                    };

                } else {
                    console.log ('Error! ' + xhr.status);
                }
            }
        }

        xhr.open ('POST', './php/generateCalendar.php');
        xhr.send ();
    });
});