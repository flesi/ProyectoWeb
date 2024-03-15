<?php

session_start();

if (isset($_COOKIE["username_id"])) {
    $idUsuario = $_COOKIE["username_id"];

    require('conexionBD.php');

    $conn=mysqli_connect($host,$username,$password,$database);

    $sql = "SELECT * FROM usuarios WHERE id_usuarios = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $idUsuario);
    $stmt->execute();
    $result = $stmt->get_result();


    if ($result->num_rows > 0) {
        // Obtén el primer resultado como un array asociativo
        // $usuario = $result->fetch_assoc();
        $datoUsuario = $result->fetch_all(MYSQLI_ASSOC); // Usa fetch_all para obtener todos los resultados y transformarlos en un array asociativo
        
        echo json_encode($datoUsuario);

        // echo "Bienvenido " . $usuario["id_usuarios"];
        // echo true;    
    } else {
        echo "ERROR AL CARGAR";
    }
    
    $stmt->close();
    $conn->close();
}