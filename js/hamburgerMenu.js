document.addEventListener("DOMContentLoaded", function(event) {
//Only load the script once the page is loaded 

    function toggleMenu(event) {
        if (!window.matchMedia('(min-width: 800px)').matches) {
            // Toggle .mobileHidden
            nav.classList.toggle('mobileHidden');

            //Change the class of the children of navbutton (AKA the FontAwesome spans) to bars bzw. times(aka cross)
            hamMenu.children[0].classList.toggle('fa-bars');
            hamMenu.children[0].classList.toggle('fa-times');
        }
    }
    
    let hamMenu = document.getElementById ('hamMenu')
    let nav = document.querySelector('nav');
    var navLinks = document.querySelectorAll ('nav li');

    hamMenu.addEventListener('click', toggleMenu); 
    
    //Each click on a navigation link triggers the function
    for (var i = 0; i < navLinks.length; i++) {
        navLinks[i].addEventListener('click', toggleMenu);
    }

});