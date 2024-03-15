<?php

if (isset($_POST["userToCheck"])) {
    $user = $_POST["userToCheck"];


// Conexión a la base de datos
// $host = "localhost";
// $username = "root";
// $password = "";
// $database = "musicex";
require('conexionBD.php');

    $conn=mysqli_connect($host,$username,$password,$database);


    $sql = "SELECT * FROM `usuarios` WHERE user = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $result = $stmt->get_result();

    echo $result->num_rows;

    // if ($result->num_rows > 0) {
    //     // Obtén el primer resultado como un array asociativo
    //     // $usuario = $result->fetch_assoc();
    //     $datoUsuario = $result->fetch_all(MYSQLI_ASSOC); // Usa fetch_all para obtener todos los resultados y transformarlos en un array asociativo
    //     echo json_encode($datoUsuario);
    //     // echo "Bienvenido " . $usuario["user"];
    //     // echo true;    
    // } else {
    //     echo false;
    //     // echo "Usuario Incorrecto";
    // }
    
    $stmt->close();
    $conn->close();

}

?>