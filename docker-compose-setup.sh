
echo "docker-compose install  ----------------------------------"
dockerInstallCmd=`curl -L --fail https://raw.githubusercontent.com/linuxserver/docker-docker-compose/master/run.sh -o /usr/local/bin/docker-compose`
sudo eval ${dockerInstallCmd}
sudo chmod +x /usr/local/bin/docker-compose
