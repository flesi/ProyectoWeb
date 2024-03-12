<?php

$idArtista = $_POST['idArtista'];
$host = "localhost";
$username = "root";
$password = "";
$database = "MusicEx";
$conn=mysqli_connect($host,$username,$password,$database);

//Coger todas las filas
$sql = "SELECT * FROM entradas WHERE id_artista = ?";
    
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $idArtista); // 's' especifica que el parámetro es una cadena (string)

/*Para buscar por varios parámetros  
$sql = "SELECT * FROM artistas WHERE estilo = ? AND nombre = ? AND edad = ?";
$estilo = 'Pop';
$nombre = 'Juan';
$edad = 54;
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssi", $estilo, $nombre, $edad); // 'ssi' indica que los primeros dos parámetros son strings y el tercero es un integer
/*-----*/

// Ejecutar la consulta
$stmt->execute();
$result = $stmt->get_result();


if ($result->num_rows > 0) {
    $entradasEvento = $result->fetch_all(MYSQLI_ASSOC); // Usa fetch_all para obtener todos los resultados y transformarlos en un array asociativo
    echo json_encode($entradasEvento);
} else {
    echo false;
}

// Cerrar la declaración preparada y la conexión
$stmt->close();
$conn->close();


?>