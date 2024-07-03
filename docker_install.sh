#!/bin/bash

# Ícone ASCII do Docker
echo "       ##        ."
echo "     ## ## ##       ==   "
echo "  ## ## ## ## ## ##  ==="
echo " /\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\\___/ ==="
echo "|                    |"
echo " \\ . . . . . . . . . . . . . . . . . . . . . /"
echo "   \\___________________/"
echo "           |       |"
echo "        __|       |__"
echo "       |               |"
echo "       |               |"

# Função para exibir uma barra de progresso
progress_bar() {
    local duration=$1
    local interval=$((duration / 100))
    local i=0

    while [ $i -le 100 ]; do
        printf "\rProgress: ["
        for ((j=0; j<i; j++)); do printf "#"; done
        for ((j=i; j<100; j++)); do printf " "; done
        printf "] %d%%" $i
        sleep 0.1
        i=$((i + 1))
    done
    printf "\n"
}

# Atualizando o sistema operacional
echo "*** Atualizando SO ***"
apt-get update -y &
PID=$!
progress_bar 30
wait $PID

# Instalação de pacotes necessários
echo "*** Instalação de Pacotes ***"
apt-get install ca-certificates curl gnupg lsb-release -y &
PID=$!
progress_bar 30
wait $PID

# Instalando o Docker
echo "*** Instalação do Docker ***"
curl -fsSL https://get.docker.com | bash &
PID=$!
progress_bar 30
wait $PID

# Adicionando o usuário atual ao grupo do Docker
echo "*** Configurando o grupo de usuários do Docker ***"
usermod -aG docker $USER

# Mensagem final de sucesso
echo "*** Instalação e configuração do Docker concluídas com sucesso! ***"
