// Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 1;
var navbarHeight = 90; // set in CSS

$(window).scroll(function (event) {
    didScroll = true;
});

// Check every 250ms whether a scroll did take place, only launching the function if it did
setInterval(function () {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();
    
    // Make sure they scroll more than delta
    if (Math.abs(lastScrollTop - st) <= delta) {
        return;
    }
    
    // If they scrolled down and are past the navbar
    // add class .nav-up. 
    // hide the nav links
    // make sure hamburger button and not hamburger cross is shown
    if (st > lastScrollTop && st > navbarHeight) {
        // Scroll Down
        $('header').removeClass('nav-down').addClass('nav-up');
        $('nav').addClass('mobileHidden');
        $('#hamMenu > span').removeClass('fa-times').addClass('fa-bars');
    } else {
        // Scroll Up
        if (st + $(window).height() < $(document).height()) {
            $('header').removeClass('nav-up').addClass('nav-down');
        }
    }
    
    lastScrollTop = st;
}

// https://medium.com/@mariusc23/hide-header-on-scroll-down-show-on-scroll-up-67bbaae9a78c