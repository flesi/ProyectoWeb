<?php

class BD{

    private static function conexion() {
        try {
            // Crear una nueva instancia de PDO para conectarse a la base de datos MySQL
            $conexion = new PDO("mysql:host=localhost; dbname=musicex","root","");
            
            // Establecer el modo de error para lanzar excepciones en caso de errores
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            // Establecer el juego de caracteres UTF-8 para la conexión
            $conexion->exec("SET CHARACTER SET utf8");
        } catch (PDOException $e) {
            // Capturar y manejar excepciones PDO (por ejemplo, errores de conexión)
            echo 'ERROR - No se ha podido conectar con la BD: ' . $e->getMessage();
        }
        // Devolver la conexión establecida
        return $conexion;
    }
}


?>