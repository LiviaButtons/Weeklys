// Simple application for a contact form
// basic validation on JS side, with error messages displayed as needed
// Author: Livia Bottoni

$(document).ready(function (event) {
    $('#contactButton').on('click', function (e) {
        $userEmail = $('#email').val(); // retrieve value for email
        $userMsg = $('#message').val(); // retrieve value for msg

        $formIsValid = true; // assume that form is valid
//        $msg = ''; // message variable that will contain error message if needed
        
        // email can't be blank, must contain @, must contain .
        if ($userEmail != '' && $userEmail.indexOf('@') > 0 && $userEmail.indexOf('.') > 0) {
            $('#email').removeClass('error');
            $('#email').attr('placeholder', 'Votre address mail');
    
        } else {
            // if conditions aren't met, add error class and change placeholder
            $('#email').addClass('error');
            $('#email').attr('placeholder', 'Error: address mail incorrecte !');
            // and tell form isn't valid
            $formIsValid = false;
            // create error message 
//            $msg = $msg + 'Adresse mail pas valable. ';
            
            Command: toastr["error"]("Adresse mail incorrecte.", "Erreur !")

            toastr.options = {
              "closeButton": true,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-bottom-center",
              "positionClass": "toast-bottom-center",
              "preventDuplicates": false,
              "onclick": null,
              "showDuration": "1000",
              "hideDuration": "1000",
              "timeOut": "2500",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
        }
        
        // message can't be blank
        if ($userMsg != '') {
            $('#message').removeClass('error');
            $('#message').attr('placeholder', 'Votre message');
        } else {
            // if condition isn't met, add error class and change placeholder
            $('#message').addClass('error');
            $('#message').attr('placeholder', 'Error: message vide!');
            // tell form isn't valid
            $formIsValid = false;
            // create error message
//            $msg = $msg + 'Votre message ne peut pas être vide ! ';
            
            Command: toastr["error"]("Votre message ne peut pas être vide.", "Erreur !")

            toastr.options = {
              "closeButton": true,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-bottom-center",
              "preventDuplicates": false,
              "onclick": null,
              "showDuration": "1000",
              "hideDuration": "1000",
              "timeOut": "2500",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
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
//                    $msg = 'Success! Your message has been sent.'
//                    $('.contactMessage').html($msg);
                    
                    
                    Command: toastr["success"]("Votre message a été envoyé.", "Succès !")

                    toastr.options = {
                      "closeButton": true,
                      "debug": false,
                      "newestOnTop": false,
                      "progressBar": false,
                      "positionClass": "toast-bottom-center",
                      "preventDuplicates": false,
                      "onclick": null,
                      "showDuration": "1000",
                      "hideDuration": "1000",
                      "timeOut": "2500",
                      "extendedTimeOut": "1000",
                      "showEasing": "swing",
                      "hideEasing": "linear",
                      "showMethod": "fadeIn",
                      "hideMethod": "fadeOut"
                    }
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