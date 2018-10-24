<?php
header ('Cache-Control: no-cache');
header ('Content-Type: application/json');

if (isset ($_POST['email'], $_POST['message'])) {
    if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) !== false && $_POST['message'] != '') {
        $email = $_POST['email'];
        $message = trim(strip_tags($_POST['message']));
        $recipient = 'contact@weeklys.com';
        $subject = 'Weekly\'s - new message from contact form';
        $body = 'The following person tried to contact you: ' . $email . '. This is their message: ' . $message;
        
        if (@mail ($recipient, $subject, $body)) {
            echo '{"result": "OK"}';
        } else {
            // error: technical problem of Daemon Mail or Apache server
            echo '{"result"; "Error"}';
        }
        
    } else {
        // error: bad values received in post
        echo '{"result": "Error"}';
    }
    
} else {
    // error: nothing received in post
    echo '{"result": "Error"}';
}
?>