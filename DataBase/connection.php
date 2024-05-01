<?php
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "csdl_sua";

$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

if (!$conn) {
    die("Chưa kết nối Database" . mysqli_connect_error());
}
