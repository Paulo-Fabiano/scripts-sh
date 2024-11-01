#!/bin/bash

echo "###### Iniciando Script ######"

# Atualizando e instalando pacotes essenciais
echo "# Instalando [curl, wget, gpg, vim, openssh-server] # "
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget gpg vim openssh-server

# Instalando VSCode
echo "# Baixando e instalando VSCode #"
wget -qO code_latest_amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo apt install -y ./code_latest_amd64.deb
rm code_latest_amd64.deb  # Removendo o arquivo após a instalação

# Instalando o Docker via script oficial
echo "# Instalando o Docker via script - Fazendo download e instalação # "
curl -fsSL https://get.docker.com | sudo bash

# Adicionando o usuário ao grupo docker
read -p "Nome do usuário: " usuario
usermod -aG docker "$usuario"
echo "Usuário [$usuario] adicionado ao grupo do Docker"

# Adicionando a jdk
echo "# Instalando a jdk #"
apt install default-jdk -y

# Instalando intellij
echo "# Instalando Intellij #"
snap install intellij-idea-community --classic

echo "###### Script finalizado! ######"
