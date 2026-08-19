#!/bin/bash

set -euo pipefail

echo "========================================"
echo " Instalación Docker + Python"
echo "========================================"

if [[ $EUID -ne 0 ]]; then
    echo "ERROR: ejecuta este script como root."
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

echo
echo "[1/6] Actualizando Debian..."
apt update
apt upgrade -y

echo
echo "[2/6] Instalando dependencias..."
apt install -y \
    ca-certificates \
    curl \
    gnupg \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev

echo
echo "[3/6] Configurando repositorio oficial de Docker..."

install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg \
    -o /etc/apt/keyrings/docker.asc

chmod a+r /etc/apt/keyrings/docker.asc

. /etc/os-release

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  ${VERSION_CODENAME} stable" \
  > /etc/apt/sources.list.d/docker.list

echo
echo "[4/6] Instalando Docker..."

apt update

apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo
echo "[5/6] Activando Docker..."

systemctl enable docker
systemctl start docker

echo
echo "[6/6] Verificando instalación..."

echo
echo "Docker:"
docker --version

echo
echo "Docker Compose:"
docker compose version

echo
echo "Python:"
python3 --version

echo
echo "pip:"
python3 -m pip --version

echo
echo "========================================"
echo " Instalación completada correctamente"
echo "========================================"
