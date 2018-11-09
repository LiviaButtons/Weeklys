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
                    console.log ($breakfast);
                    
                    // Build loop for 7 instances (7 weekdays)
//                    for ($i = 0; $i < 7; $i++) {
//                        buildLink($breakfast);
//                    };
                    
                    function buildLink ($arr) {
                        for ($x = 0; $x < $arr.length; $x++) {
                            $link = document.createElement('a');
                            
                            $($link).attr({
                                'href': './recipes.html?idRecette=' + $arr[$x].idRecette,
                                //build URL that passes info (the recipe ID) in GET
                                //so that you'll land on the correct recipe page
                                'alt': $arr[$x].nomRecette
                            });
                        
                            $($link).text($arr[$x].nomRecette);  
                            console.log ($link);
                        };
                    };
                    
                    buildLink ($breakfast);
                    addLink ('recipeB');
                    
                    function addLink ($section) {
                        $($section).each(function (i) {
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