<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$db = mysqli_connect('localhost', 'root', '', 'asset_management');
if (!$db) {
    echo json_encode(["status" => "error", "message" => "Database connection failed"]);
    exit;
}

$phonenum = mysqli_real_escape_string($db, $_POST['phone_num']);
$password = mysqli_real_escape_string($db, $_POST['pass']);

$sql = "SELECT * FROM login WHERE phone_num = '$phonenum' AND pass = '$password'";
$result = mysqli_query($db, $sql);

if (!$result) {
    echo json_encode(["status" => "error", "message" => "Query failed"]);
    exit;
}

$count = mysqli_num_rows($result);

if ($count >= 1) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => "Invalid credentials"]);
}
?>
