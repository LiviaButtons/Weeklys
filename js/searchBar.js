/* Code with AJAX to connect to database for a basic search
/* used for search bar in intro and header */
/* Author: Livia Bottoni */

$(document).ready (function (ev) {
    $('.searchButton').on("click", function (e) {
        e.preventDefault ();
        
        // Store search term in a variable
        $searchTerm = $('input[type="text"][name="searchField"]').val();
        console.log ($searchTerm);
        
        // If the search term variable isn't empty, launch search
        if ($searchTerm != '') {
            search($searchTerm);
        } else {
            // Else, tell user to enter a search term
            $('input[type="text"][name="searchField"]').attr('placeholder', 'Please type something!');
        }
    });
    
    
    function search ($searchTerm) {
        let xhr = new XMLHttpRequest;
        
        xhr.onreadystatechange = function (e) {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
//                    $results = JSON.parse(xhr.responseText);
                    console.log (xhr.responseText);
//                    console.log ($results);

//                    window.location.assign('./recipes.html');
                } else {
                    console.log ('Error! ' + xhr.status);
                }
            }
        }

        xhr.open ('GET', './php/searchBar.php?query=' + $searchTerm);
        xhr.send ($searchTerm);
    };
});