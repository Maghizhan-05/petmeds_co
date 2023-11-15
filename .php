<?php
// Replace with your database connection details
$servername = "localhost";
$username = "root";
$password = "Maghizhan!05";
$dbname = "petmeds_db";

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch medication data
$sql = "SELECT id, name, description, price FROM medications";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $medications = array();
    while ($row = $result->fetch_assoc()) {
        $medications[] = $row;
    }
    echo json_encode($medications);
} else {
    echo "No medications found";
}

$conn->close();
?>
