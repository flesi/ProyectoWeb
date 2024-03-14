<?php

$userToRegister = $_POST["userToRegister"];
$passToRegister = $_POST["passToRegister"];
$mailToRegister = $_POST["mailToRegister"];
$nameToRegister = $_POST["nameToRegister"];
$lastNameToRegister = $_POST["lastNameToRegister"];

$host = "localhost";
$username = "root";
$password = "";
$database = "musicex";
$conn=mysqli_connect($host,$username,$password,$database);

// $sql = "INSERT INTO `usuarios` (`user`, `password`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `telefono_usuario`, `direccion_usuario`, `imagenUsuario`, `rol_usuario`) VALUES (?, ?, ?, ?, ?, NULL, NULL, \'images/users/default.jpg\', NULL);";
$sql = "INSERT INTO `usuarios` (`user`, `password`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`) VALUES (?, ?, ?, ?, ?);";

$stmt = $conn->prepare($sql);

$stmt->bind_param("sssss", $userToRegister, $passToRegister, $mailToRegister, $nameToRegister, $lastNameToRegister);
$stmt->execute();
$result = $stmt->get_result();

if ($stmt->affected_rows > 0) {
    echo true;
} else {
    echo false;
}


?>