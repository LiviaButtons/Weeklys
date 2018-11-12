// This is the search function for the Weekly's project
// Author: Livia Bottoni

$(document).ready (function (event) {
    $('.searchButton').on("click", function (e) {
        e.preventDefault;
        
        $searchTerm = $('input[type="text"][name="searchField"]').val();
        
        if ($searchTerm != '' && $searchTerm != undefined) {
            $searchTerm = $searchTerm.text();
//            search($searchTerm);
            window.location.replace('./recipes.html?query=' + $searchTerm);
        } else {
            $('input[type="text"][name="searchField"]').attr('placeholder', 'Please type something!');
        }
        
        let xhr = new XMLHttpRequest;

        xhr.onreadystatechange = function (ev) {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    $results = JSON.parse(xhr.responseText);
//                    console.log (xhr.responseText);
//                    console.log ($results);
                    
//                    function search ($query) {
                        
                    };                
                } else {
                    console.log ('Error! ' + xhr.status);
                }
            }
        }

        xhr.open ('GET', './php/searchBar.php?query=' + $searchTerm);
        xhr.send ($searchTerm);
        
    });
});