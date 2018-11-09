/* Code with AJAX to connect to database and retrieve information */
/* used to populate the meal plan on the homepage w/o reloading page */
/* Author: Livia Bottoni */

$(document).ready (function (ev) {
    $('#calendarGenerator').on("click", function (e) {
        e.preventDefault ();
        
        // let form = new FormData(myForm);
        // Does add new value on the buttons to get in POST
        // Because on form send, the value of buttons isn't automatically retrieved
        // form.append('buttonClick', e.target.innerHTML);

        let xhr = new XMLHttpRequest;

        xhr.onreadystatechange = function (e) {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    $results = JSON.parse(xhr.responseText);
//                    console.log (xhr.responseText);
                    console.log ($results);
                    
                    for ($i = 0; $i < $results.length; $i++) {
                        console.log ($results[$i]);
                        $link = document.createElement('a');
                        $($link).attr({
                            'alt': $results[$i].nomRecette,
//                            'alt': 'blabla',
                            'src': 'http://ecosia.org'
                        });
                        $($link).text($results[$i].nomRecette);
                        
                        $('.recipeB').each(function (i) {
                            $(this).html($link);
                        })
//                        $('.recipeB').index($i).html($link);
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