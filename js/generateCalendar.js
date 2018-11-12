/* Code with AJAX to connect to database and retrieve information */
/* used to populate the meal plan on the homepage w/o reloading page */
/* Author: Livia Bottoni */

$(document).ready (function (ev) {
    // load data into calendar once the page is loaded
    getDisplayData();
    
    $('#calendarGenerator').on("click", function (e) {
        // on button click, load new data
        e.preventDefault ();
        getDisplayData();
    });
    
    
    function getDisplayData () {
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
                    
                    function buildInjectLink ($arr, $section) {
                        // build loop for 7 instances (7 weekday)
                        for ($x = 0; $x < 7; $x++) {
                            // create new link a
                            $link = document.createElement('a');
                            // build URL, removingspaces from recipe name to do so
                            $url = $arr[$x].nomRecette.replace(/\s/g, '');
                            
                            // give link necessary attributes
                            $($link).attr({
                                'href': './recipes.html?nomRecette=' + $url,
                                'alt': $arr[$x].nomRecette
                            });
                            
                            // Inside the link, show the name of the recipe
                            $($link).html($arr[$x].nomRecette);  
                            
                            // Add the recipe to the appropriate section
                            $rSection = $($section).get($x);
                            $($rSection).html($link);
                        };
                    };
                    
                    buildInjectLink ($breakfast, '.recipeB');
                    buildInjectLink ($lunch, '.recipeL');
                    buildInjectLink ($dinner, '.recipeD');
                
                } else {
                    console.log ('Error! ' + xhr.status);
                }
            }
        }

        xhr.open ('POST', './php/generateCalendar.php');
        
        if ($('#vege').is(':checked')) {
//            xhr.send ($('#vege').val());
            xhr.send ('vege');
        } else {
            xhr.send ();
        };
    };
});