<?php

$servername = "localhost";
$username = "root";
$password = "";
$db = "onlineshop";

// Создание соединения
$con = mysqli_connect($servername, $username, $password,$db);

// Проверка соединения
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}


?>
