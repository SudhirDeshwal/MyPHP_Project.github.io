<?php


function getWeather($city)
{
    //step1
    $cSession = curl_init();
    //step2
    curl_setopt($cSession, CURLOPT_URL, "https://api.openweathermap.org/data/2.5/weather?q=" . $city . "&appid=098652f7792b8d57f0480ee34d88e8c5&units=metric");
    curl_setopt($cSession, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($cSession, CURLOPT_HEADER, false);
    //step3
    $result = curl_exec($cSession);
    //step4
    curl_close($cSession);
    //step5
    $payload = json_decode($result);
    //echo $payload->name;
    //echo $payload->main->temp;
    //echo $payload->weather[0]->icon;
    //echo $payload->weather[0]->description;
?>

    <img src="https://openweathermap.org/img/wn/<?= $payload->weather[0]->icon ?>@2x.png" alt="Weather Icon">
    <p><?= $payload->main->temp; ?> &#8451; </p>
    <p>Current Conditions: <?= ucfirst($payload->weather[0]->description); ?> </p>

<?php
}
?>

<?php
//getWeather('zanzibar');
?>