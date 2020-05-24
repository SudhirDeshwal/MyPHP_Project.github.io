<?php

$to = "romanmbwasi@gmail.com";

$subject = "Some awesome subject";

$message = "Some body 3";
//Content-Type: text/html; charset=UTF-8
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-Type: text/html; charset=UTF-8' . "\r\n";
$headers .= "From: donotreply@mbwasi.com \r\n";

$headers .= "Reply-To: donotreply@mbwasi.com \r\n";

$result = mail($to, $subject, $message, $headers);

if ($result) {
    echo "Sent";
} else {
    echo "Fail.";
}
