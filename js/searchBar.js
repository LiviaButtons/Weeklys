// This is the search function for the Weekly's project
// Author: Livia Bottoni

$(document).ready (function (event) {
// launch autocomplete
    $("#search1").autocomplete({
        source: './php/searchBar.php',
        appendTo: "#autosearch",
        delay: 500,
        // when an autocomplete link is selected
        select: function (event, ui) {
            // prevent default behaviour (to display value)
            event.preventDefault(); 
            // 
            $(this).val(ui.item.value);    
            // navigate to that recipe's page
            window.location.href= './recettes.php?code=' + ui.item.name;
        }
    });

    $( "#search2" ).autocomplete({
        source: './php/searchBar.php',
        appendTo: "intro > .dbSearch",
        delay: 500,
        // when an autocomplete link is selected
        select: function (event, ui) {
            // prevent default behaviour (to display value)
            event.preventDefault(); 
            // 
            $(this).val(ui.item.value);    
            // navigate to that recipe's page
            window.location.href= './recettes.php?code=' + ui.item.name;
        }
    });  
    
// launch regular search
    $('.searchButton').on("click", function (e) {
//        console.log (e.target);
        $clickedButton = e.target;
        
        // if they clicked button1, take input1's value
        if ($clickedButton.id == 'searchButton1') {;
            $searchTerm = $('#search1').val();
        } else if ($clickedButton.id == 'searchButton2') {
        // if they clicked button2, take inptu2's value
            $searchTerm = $('#search2').val();
        }

        // if you received a search term, execute search function
        if ($searchTerm != '') {
            search($searchTerm);
        } else {
            // Else, tell user to enter a search term
            $('.searchInput').attr('placeholder', 'Tapez quelque-chose !');
        }
    });
    
    function search (searchTerm) {
        let xhr = new XMLHttpRequest;

        xhr.onreadystatechange = function (e) {
            
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    $searchResults = JSON.parse(xhr.responseText);
//                    console.log (xhr.responseText);
                    
                    // if you connected to the DB successfully
                    // redirect page to recipe with query in GET
                    // removing spaces from query first
                    $noSpaceSearch = searchTerm.replace(/\s/g, '');
                    window.location.href = './recipes.html?query=' + $noSpaceSearch;          
                    
                    // No results, show message, yes results, show results
                    if ($searchResults.length < 1) {
                        console.log ('Aucun résultat pour votre recherche avec le terme ' + searchTerm + '. Voici toutes nos recettes !');
                    } else {
                        console.log ($searchResults);
                        return $searchResults;
                    }
                
                } else {
                    console.log ('Error! ' + xhr.status);
                }
            }
        }

        xhr.open ('POST', './php/searchBar.php');
//        xhr.open ('GET', './php/searchBar.php?query=' + searchTerm);
        xhr.setRequestHeader ('Content-type', 'application/x-www-form-urlencoded');
        xhr.send ('query=' + searchTerm);
    }
});