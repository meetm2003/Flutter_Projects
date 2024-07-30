<?php
    $db = new mysqli('localhost', 'root', '', 'asset_management');
    
    if ($db->connect_error) {
        echo json_encode(["error" => "Database connection failed"]);
        exit();
    }

    // Get POST data
    $dept_name = $_POST['dept_name'];
    $warranty_date = $_POST['warranty_date'];
    $bill_img = $_POST['bill_img'];
    $assets_img = $_POST['assets_img'];

    // Decode base64 to binary
    $bill_img_data = base64_decode($bill_img);
    $assets_img_data = base64_decode($assets_img);

    // Check and format warranty_date (assuming it comes in "dd/mm/yyyy" format)
    $date_parts = explode('/', $warranty_date);
    if (count($date_parts) === 3) {
        $formatted_date = $date_parts[2] . '-' . $date_parts[1] . '-' . $date_parts[0]; // Convert to "yyyy-mm-dd"
    } else {
        $formatted_date = null; // Invalid date format
    }

    // Prepare SQL statement
    $stmt = $db->prepare("INSERT INTO `assets` (`dept_name`, `warranty_date`, `bill_img`, `assets_img`) VALUES (?, ?, ?, ?)");
    
    if ($stmt === false) {
        echo json_encode(["error" => "Prepare failed: " . $db->error]);
        exit();
    }

    // Bind parameters
    $stmt->bind_param('ssss', $dept_name, $formatted_date, $bill_img_data, $assets_img_data);

    // Execute query
    if ($stmt->execute()) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["error" => "Data insertion failed: " . $stmt->error]);
    }

    // Close connections
    $stmt->close();
    $db->close();
?>
