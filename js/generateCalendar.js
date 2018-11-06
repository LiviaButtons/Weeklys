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
//                    let results = JSON.parse(xhr.responseText);
                    console.log (xhr.responseText);
                    console.log ('The button works!');


                } else {
                    console.log ('Error! ' + xhr.status);
                }
            }
        }

        xhr.open ('POST', './php/generateCalendar.php');
        xhr.send ();
    });
});