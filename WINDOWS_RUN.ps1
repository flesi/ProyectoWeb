# Verificar si Chocolatey está instalado
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey no está instalado. Instalando Chocolatey..."

    # Instalar Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    # Verificar si la instalación fue exitosa
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error al instalar Chocolatey. Por favor, revisa la instalación manualmente."
        exit
    }

    Write-Host "Chocolatey instalado correctamente."
}

# Verificar si Docker está instalado
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker no está instalado. Instalando Docker..."

    # Instalar Docker utilizando Chocolatey
    choco install docker-desktop -y

    # Verificar si la instalación fue exitosa
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error al instalar Docker. Por favor, revisa la instalación manualmente."
        exit
    }

    Write-Host "Docker instalado correctamente."
}

cd miProyecto
# Ejecutar Docker Compose
Write-Host "Ejecutando Docker Compose..."
docker compose up
