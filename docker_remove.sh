sudo ./header.sh

echo "=============================================";
echo "=> Removendo Docker";
sudo apt-get purge -y docker-ce

echo "=> Removendo Trash pacotes";
sudo apt-get -y autoremove

echo "=> Removendo Volumes";
sudo rm -rf /var/lib/docker

echo "=> Removendo pasta docker";
rm -rf ~/.docker

echo "=> Excluir group docker"
sudo groupdel docker
echo "=============================================";
