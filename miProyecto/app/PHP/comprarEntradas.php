<?php



$id_evento = $_POST['idEventoReservado'];
$id_usuarios = $_POST['idUsuarioEvReservado'];
$butaca = $_POST['butacaReservada'];
$nombre_comprador = $_POST['nombreReserva'];
$apellido_comprador= $_POST['apellidoReserva'];


$host = "localhost";
$username = "root";
$password = "";
$database = "musicex";
$conn=mysqli_connect($host,$username,$password,$database);


$sql = "INSERT INTO `entradas` (`id_evento`, `id_usuario`, `butaca`, `nombre_comprador`, `apellido_comprador`) VALUES (?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iiiss", $id_evento, $id_usuarios,$butaca, $nombre_comprador,$apellido_comprador);

// Ejecutar la consulta
$stmt->execute();
$result = $stmt->get_result();

echo $result;
// if ($result->num_rows > 0) {
//     $entradasEvento = $result->fetch_all(MYSQLI_ASSOC); // Usa fetch_all para obtener todos los resultados y transformarlos en un array asociativo
//     echo json_encode($entradasEvento);
// } else {
//     echo false;
// }

// Cerrar la declaración preparada y la conexión
$stmt->close();
$conn->close();


?>