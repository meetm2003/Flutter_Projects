<?php
header('Content-Type: application/json');
$db = mysqli_connect('localhost', 'root', '', 'asset_management');
if (!$db) {
    echo json_encode(["error" => "Database connection failed"]);
    exit();
}

$sql = "SELECT id, dept_name, warranty_date, bill_img, assets_img FROM assets";
$result = mysqli_query($db, $sql);
if (!$result) {
    echo json_encode(["error" => "Failed to fetch assets"]);
    exit();
}

$assets = [];
while ($row = mysqli_fetch_assoc($result)) {
    $row['assets_img'] = base64_encode($row['assets_img']);
    $row['bill_img'] = base64_encode($row['bill_img']);
    $assets[] = $row;
}

echo json_encode($assets);
?>
