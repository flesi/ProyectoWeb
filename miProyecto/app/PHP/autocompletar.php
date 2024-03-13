<?php
// Conexión a la base de datos
$host = "localhost";
$username = "root";
$password = "";
$database = "MusicEx";

$conn=mysqli_connect($host,$username,$password,$database);

// Verificar conexión
if ($conn->connect_error) {
    die("Error en la conexión: " . $conn->connect_error);
}

// Obtener el término de búsqueda
$query = $_GET['term'];

// Consulta SQL
$sql = "SELECT nombreArtista FROM artistas WHERE nombreArtista LIKE '$query%'";
$result = $conn->query($sql);

// Almacenar los resultados en un array
$data = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = $row['nombreArtista'];
    }
}

// Devolver los resultados en formato JSON
echo json_encode($data);

$conn->close();
?>
