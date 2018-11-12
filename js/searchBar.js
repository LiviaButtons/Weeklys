// Code with AJAX to connect to database for a basic search
// used for search bar in intro and header 
// Author: Livia Bottoni

$(document).ready (function (event) {
    $('.searchButton').on("click", function (e) {    
        // Store user input in variable
        $searchTerm = $('.searchInput').val();
//        console.log ($searchTerm);
        
        // If it's not empty or undefined
        if ($searchTerm != '' && $searchTerm != undefined) {
//            $searchTerm = $searchTerm.text();
           
            let xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function (ev) {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        $results = JSON.parse(xhr.responseText);
    //                    console.log (xhr.responseText);
    //                    console.log ($results);
                        
                        // If it's all gone well, redirect the user to 
                        // results page
//                        $(location).attr('href', './recipes.html?query=' + $searchTerm);
                        window.location.href = './recipes.html?query=' + $searchTerm;
                    } else {
                        console.log ('Error! ' + xhr.status);
                    }
                }
            }

            xhr.open ('GET', './php/searchBar.php?query=' + $searchTerm);
            xhr.send ($searchTerm);
            
        } else {
            // change the placeholder to tell user to enter smth
            $('input[type="text"][name="searchField"]').attr('placeholder', 'Please type something!');
        }
    });
});