<?php

if (isset($_POST["user"]) && isset($_POST["password"])) {
    $user = $_POST["user"];
    $pass = $_POST["password"];


    $host = "localhost";
    $username = "lamp";
    $password = "test";
    $database = "musicex";
    $conn=mysqli_connect($host,$username,$password,$database);


    $sql = "SELECT * FROM `usuarios` WHERE user = ? AND password = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $user, $pass);
    $stmt->execute();
    $result = $stmt->get_result();


    if ($result->num_rows > 0) {
        // Obtén el primer resultado como un array asociativo
        $usuario = $result->fetch_assoc();
        
        // echo "Bienvenido " . $usuario["user"];
        echo true;    
    } else {
        echo false;
        // echo "Usuario Incorrecto";
    }
    
    $stmt->close();
    $conn->close();

}

?>