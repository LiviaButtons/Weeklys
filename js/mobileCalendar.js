$(document).ready (function (ev) {
    $('.jsLeftButton').on('click', function (e) {
        // target the grandparent of the button that was clicked
        // and get the index of the clicked element
        $parent = $(this).parent().parent();
        $index = $parent.index();
        $minusIndex = $index - 1;

        // hide all calendar sections
        $('#weeklyCalendar').children().addClass ('mobileHidden');
        
        // if index is smaller than 0 (AKA you're on Monday and going back)
        if ($minusIndex < 0) {
            $minusIndex = 6;
            $('#weeklyCalendar > .calendarSection:nth-of-type(7)').removeClass('mobileHidden');
        }
        
        // Show the previous calendar section
        $parent.prev().removeClass('mobileHidden');

    });
    
    $('.jsRightButton').on('click', function (event) {
        //target grandparent, get index
        $parent = $(this).parent().parent();
        $index = $parent.index();
        $plusIndex = $index + 1;
        
        // hida all calendar sections
        $('#weeklyCalendar').children().addClass ('mobileHidden');
        
        // if index is bigger than 6 (AKA you're on Sunday and going forward)
        if ($plusIndex > 6) {
            $plusIndex = 0;
            $('#weeklyCalendar > .calendarSection:nth-of-type(1)').removeClass('mobileHidden');
        }
        
        // Show the next calendar section
        $parent.next().removeClass('mobileHidden');
    });
});