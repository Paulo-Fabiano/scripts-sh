#!/bin/bash

echo "##### Iniciando Script #####"

# Intalando curl, wget, vscode e docker
echo "Instalando [curl, wget, gpg]"
apt update && apt upgrade -y
apt install curl wget gpg -y

echo "Instalando Repositório do VSCode"
# Instalando repositório da Microsoft
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \ 
    | tee /etc/apt/sources.list.d/vscode.list > /dev/null 
rm -f packages.microsoft.gpg

# Instalando VSCode
echo "Instalando VSCode"
apt install apt-transport-https && apt update && apt install code -y

# Chamando o script que instala o Docker automaticamente
# get.docker.com - Script de instalação
echo "Instalando o Docker via scritp - Fazendo download e instalação"
curl -fsSl https://get.docker.com | bash

# Dando permissões ao nosso usuário para usar o Docker
read -p "Nome do usuário: " usuario
usermod -aG dockerqua "$usuario"
echo "Usuário $usuario adicionado ao grupo do Docker"

echo "##### Script finalizado! #####"