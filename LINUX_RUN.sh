#!/bin/bash

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "Docker no está instalado. Instalando Docker..."
    # Instalar Docker (Ubuntu/Debian)
    sudo apt-get update
    sudo apt-get install -y docker.io

    # Verificar si la instalación fue exitosa
    if [ $? -ne 0 ]; then
        echo "Error al instalar Docker. Por favor, revisa la instalación manualmente."
        exit 1
    fi

    echo "Docker instalado correctamente."
fi

# Verificar si Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose no está instalado. Instalando Docker Compose..."
    # Instalar Docker Compose
    sudo apt-get update
    sudo apt-get install -y docker-compose

    # Verificar si la instalación fue exitosa
    if [ $? -ne 0 ]; then
        echo "Error al instalar Docker Compose. Por favor, revisa la instalación manualmente."
        exit 1
    fi

    echo "Docker Compose instalado correctamente."
fi

# Cambiar al directorio del proyecto (reemplaza 'miProyecto' con el nombre de tu carpeta)
cd miProyecto || { echo "Error: La carpeta 'miProyecto' no existe."; exit 1; }

# Ejecutar Docker Compose
echo "Ejecutando Docker Compose..."
docker-compose up
