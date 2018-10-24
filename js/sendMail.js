$(document).ready(function (event) {
    $('button').on('click', function (e) {
        let userEmail = $('#email').val();
        let userMsg = $('#message').val();

        let formIsValid = true;

        if (userEmail != '' && userEmail.indexOf('@') > 0 && userEmail.indexOf('.') > 0) {
            $('#email').removeClass('error');
            $('#email').attr('placeholder', 'Your email');
        } else {
            $('#email').addClass('error');
            $('#email').attr('placeholder', 'Error: invalid email address!');
            formIsValid = false;
        }

        if (userMsg != '') {
            $('#message').removeClass('error');
            $('#message').attr('placeholder', 'Your message');
        } else {
            $('#message').addClass('error');
            $('#message').attr('placeholder', 'Error: message is empty!');
            formIsValid = false;
        }

        if (formIsValid) {
            $.ajax ({
                url     : '../php/sendMail.php', 
                type    : 'POST', 
                dataType: 'json', 
                data: {
                    email   : userEmail, 
                    message : userMsg 
                },
                success: function (data) {
                    console.log (data)
                }, 
                error: function (xhr, status, errorMsg) {
                    $('.contactMessage').html('Whoops, there was a technical issue.');
                },
                complete: function (xhr, status) {
                }
            });
        };    
    });
});