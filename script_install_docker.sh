#!/bin/bash

echo "*** Atualizando SO ***"
apt-get update -y

echo "*** Instalação  de Pacotes ***"
apt-get install ca-certificates curl gnupg lsb-release -y

echo "*** Instalação do Docker ***"
curl -fsSL https://get.docker.com | bash

echo "*** Criando usuário ***"
useradd $1 -m -s /bin/bash -p $(openssl passwd -6 $2) -G sudo
