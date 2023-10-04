#!/bin/bash

echo "*** Atualizando SO ***"
apt-get update -y

echo "*** Instalação  de Pacotes ***"
apt-get install ca-certificates curl gnupg lsb-release -y

echo "*** Instalação do Docker ***"
curl -fsSL https://get.docker.com | bash
