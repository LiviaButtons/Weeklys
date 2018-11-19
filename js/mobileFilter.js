// Simple JavaScript for filter on recipe page
// to open up and close filter selection on button-click
// Author: Livia Bottoni

$(document).ready(function (event) {
    $width = $(window).width();
//    console.log ($width);
    
    if ($width < 950) {
        $button = document.createElement ('button');
        $($button).addClass ('filterButton');
//        $text = 'Filtrer';
        $($button).html('Filtrer');
        $($button).appendTo('.un');
        
        $('#section1').hide('slide', {direction: 'left' }, 300);
        $('#section2').css({
//            'display': 'flex',
            'width': '90%',
            'margin-left': 'auto',
            'margin-right': 'auto'            
        });
        
        $($button).on('click', function (e) {
            $('#section1').css({
               'z-index': 999,
                'position': 'fixed',
                'top': 80,
                'left': '10%',
                'width': '80%',
                'margin-left': 'auto',
                'margin-right': 'auto'
            });
            $('#section1').show('slide', {direction: 'left' }, 300)
        })
        
        $children = $('#section1 > form');
        console.log ($children); 
        
        $('#section1 > div').on('click', function (ev) {
            $clicked = ev.target;
            console.log (ev.target);
//            if ($.inArray($clicked, $children) == -1) {
            if (ev.target == this) {
                $('#section1').hide('slide', {direction: 'left'}, 300);
//                
            }

//            
//        }).children().click(function (eee) {
////            console.log ('test');
////            return false;
        });
    } 
});