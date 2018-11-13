// Simple application for a contact form
// basic validation on JS side, with error messages displayed as needed
// Author: Livia Bottoni

$(document).ready(function (event) {
    $('#contactButton').on('click', function (e) {
        $userEmail = $('#email').val(); // retrieve value for email
        $userMsg = $('#message').val(); // retrieve value for msg

        $formIsValid = true; // assume that form is valid
        $msg = ''; // message variable that will contain error message if needed
        
        // email can't be blank, must contain @, must contain .
        if ($userEmail != '' && $userEmail.indexOf('@') > 0 && $userEmail.indexOf('.') > 0) {
            $('#email').removeClass('error');
            $('#email').attr('placeholder', 'Your email');
    
        } else {
            // if conditions aren't met, add error class and change placeholder
            $('#email').addClass('error');
            $('#email').attr('placeholder', 'Error: invalid email address!');
            // and tell form isn't valid
            $formIsValid = false;
            // create error message 
            $msg = $msg + 'Your e-mail address is invalid. ';
        }
        
        // message can't be blank
        if ($userMsg != '') {
            $('#message').removeClass('error');
            $('#message').attr('placeholder', 'Your message');
        } else {
            // if condition isn't met, add error class and change placeholder
            $('#message').addClass('error');
            $('#message').attr('placeholder', 'Error: message is empty!');
            // tell form isn't valid
            $formIsValid = false;
            // create error message
            $msg = $msg + 'Please enter a message! ';
        }
        
        // if basic validation succeeds, launch Ajax call
        if ($formIsValid) {
            $.ajax ({
                url     : './php/sendMail.php', 
                type    : 'POST', 
                dataType: 'json', 
                data: {
                    email   : $userEmail, 
                    message : $userMsg 
                },
                success: function (data) {
//                    console.log (data)
                    // perhaps check condition that it returns result: OK
                    $msg = 'Success! Your message has been sent.'
                    $('.contactMessage').html($msg);
                }, 
                error: function (xhr, status, errorMsg) {
//                    console.log ('Status: ' + status);
//                    console.log ('Error: ' + errorMsg);
                    $('.contactMessage').html('Whoops, there was a technical issue.');
                },
                complete: function (xhr, status) {
                }
            });
        } else {
            $('.contactMessage').html($msg);    
        };
    });
});