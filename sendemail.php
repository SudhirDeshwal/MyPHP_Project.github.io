<?php

function sendBookingEmail($toAddress, $name = '', $bookingCode)
{
  // multiple recipients
  $to  = $toAddress; // note the comma
  // subject
  $subject = 'Booking confirmed, Booking Code: ' . $bookingCode . '';
  // message
  $message = '
<html>
<head>
  <title>Email Verification</title>
</head>
<body>
  Hello ' . ucfirst($name) . ',</br>
  Your booking has been made. Your Booking Code is <h3>' . $bookingCode . '</h3> </br>
</body>
</html>
';

  // To send HTML mail, the Content-type header must be set
  $headers  = 'MIME-Version: 1.0' . "\r\n";
  $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
  // Additional headers
  $headers .= 'From: DuckType <donotreply@mbwasi.com>' . "\r\n";
  // Mail it
  mail($to, $subject, $message, $headers);
  return true;
}


function sendVerificationMail($toAddress, $name = '', $verificationCode)
{
  // multiple recipients
  $to  = $toAddress; // note the comma
  // subject
  $subject = 'DuckType Travels Email Verification';
  // message
  $message = '
<html>
<head>
  <title>Email Verification</title>
</head>
<body>
  Hello ' . ucfirst($name) . ',</br>
  Please click the link bellow to verify your account.</br>
  <a href="http://' . $_SERVER['SERVER_NAME'] . '/verify.php?key=' . $verificationCode . '">http://' . $_SERVER['SERVER_NAME'] . '/verify.php?key=' . $verificationCode . '</a> 
</body>
</html>
';

  // To send HTML mail, the Content-type header must be set
  $headers  = 'MIME-Version: 1.0' . "\r\n";
  $headers .= 'Content-Type: text/html; charset=UTF-8' . "\r\n";
  // $headers .= 'From: DuckType <donotreply@mbwasi.com>' . "\r\n";
  $headers .= "From: donotreply@mbwasi.com \r\n";

  $headers .= "Reply-To: donotreply@mbwasi.com \r\n";
  // Mail it
  fileLog("Email settings: " . $to . "," . $subject . "," . $message . "," . $headers);
  $result = mail($to, $subject, $message, $headers);
  fileLog("Email result: " . $result);
}

//sendMail("roman@example.com", "Roman", "12345");
