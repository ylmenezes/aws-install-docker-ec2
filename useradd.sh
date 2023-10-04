
echo "*** Criando usuário ***"
# Check if the script is being run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Check if the username and password arguments are provided
if [ $# -ne 2 ]
  then echo "Usage: $0 <username> <password>"
  exit
fi

# Assign the username and password arguments to variables
username=$1
password=$2

# Create the user with the provided username and password
useradd $username -m -s /bin/bash -p $(openssl passwd -6 $password) -G sudo