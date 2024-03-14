<?php

if (isset($_POST["user"]) && isset($_POST["password"])) {
    $user = $_POST["user"];
    $pass = $_POST["password"];


    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "musicex";
    $conn=mysqli_connect($host,$username,$password,$database);


    $sql = "SELECT * FROM `usuarios` WHERE user = ? AND password = ?  AND `id_usuarios` != 1";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $user, $pass);
    $stmt->execute();
    $result = $stmt->get_result();


    if ($result->num_rows > 0) {
        // Obtén el primer resultado como un array asociativo
        // $usuario = $result->fetch_assoc();
        $datoUsuario = $result->fetch_all(MYSQLI_ASSOC); // Usa fetch_all para obtener todos los resultados y transformarlos en un array asociativo
        echo json_encode($datoUsuario);
        // echo "Bienvenido " . $usuario["user"];
        // echo true;    
    } else {
        echo false;
        // echo "Usuario Incorrecto";
    }
    
    $stmt->close();
    $conn->close();

}

?>