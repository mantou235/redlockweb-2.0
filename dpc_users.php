<?php
$host = 'localhost';
$db_name = 'redlock-web-2.0';
$username = 'user';
$password = 'user';

$conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);

$stmt = $conn->prepare("SELECT COUNT(*) FROM users");
$stmt->execute();

$result = $stmt->fetch();
$total_users = $result[0];

echo "Total number of users: $total_users";
?>
