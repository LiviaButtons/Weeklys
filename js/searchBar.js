// This is the search function for the Weekly's project
// Author: Livia Bottoni

$(document).ready (function (event) {
    $('.searchButton').on("click", function (e) {
        e.preventDefault;
        
        $searchTerm = $('.searchInput').val();
        console.log ($searchTerm);
        
        if ($searchTerm != '') {
            search($searchTerm);
        } else {
            // Else, tell user to enter a search term
            $('.searchInput').attr('placeholder', 'Please type something!');
        }
    });
    
    function search (searchTerm) {
        let xhr = new XMLHttpRequest;

        xhr.onreadystatechange = function (e) {
            
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    $searchResults = JSON.parse(xhr.responseText);
//                    console.log (xhr.responseText);
//                    console.log ($searchResults);
                    
                    window.location.href = './recipes.html?query=' + searchTerm;          
                
                } else {
                    console.log ('Error! ' + xhr.status);
                }
            }
        }

        xhr.open ('POST', './php/searchBar.php');
//        xhr.open ('GET', './php/searchBar.php?query=' + searchTerm);
        xhr.setRequestHeader ('Content-type', 'application/x-www-form-urlencoded');
        xhr.send ('query=' + searchTerm);
//        xhr.send ('query=gyoza');
//        xhr.send ();
    }
});