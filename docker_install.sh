#!/bin/bash

echo "       ##        ."
echo "     ## ## ##       ==   "
echo "  ## ## ## ## ## ##  ==="
echo " /"""""""""""""""""""""""""""""\\___/ ==="
echo "|                    |"
echo " \ . . . . . . . . . . . . . . . . . . . . .  /"
echo "   \___________________/"
echo "           |       |"
echo "        __|       |__"
echo "       |               |"
echo "       |               |"

# Função para exibir uma barra de progresso
progress_bar() {
    local duration=$1
    already_done() { for ((done=0; done<$elapsed; done++)); do printf "#"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

    for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
        already_done; remaining; percentage
        sleep 0.1
        clean_line
    done
    printf "\n"
}

# Atualizando o sistema operacional
echo "*** Atualizando SO ***"
apt-get update -y &
progress_bar 30

# Instalação de pacotes necessários
echo "*** Instalação de Pacotes ***"
apt-get install ca-certificates curl gnupg lsb-release -y && clear &
progress_bar 30

# Instalando o Docker
echo "*** Instalação do Docker ***"
curl -fsSL https://get.docker.com | bash && clear &
progress_bar 30

# Adicionando o usuário atual ao grupo do Docker
echo "*** Configurando o grupo de usuários do Docker ***"
usermod -aG docker $USER

# Mensagem final de sucesso
echo "*** Instalação e configuração do Docker concluídas com sucesso! ***"
