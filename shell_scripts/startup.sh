ARGUMENTS="$@"
echo Args: $ARGUMENTS

sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --stop --prod
sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --stop --dev

# Run ENV='prod' vagrant up
if [[ " ${ARGUMENTS[@]} " =~ "prod" ]]; then
  # Production
  echo "!!!!!!!!! ====> Launching Production stack, for Development, do: ENV='dev' vagrant up"
  # In the future, we might want to replace `--build-docker-images` by `--pull-docker-image`
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/updatestack.sh --all --pull-github-repo --build-docker-images
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --prod
#elif [[ " ${ARGUMENTS[@]} " =~ " dev " ]]; then
# Run ENV='dev' vagrant up
else
  # Development
  echo "!!!!!!!!! ====> Launching Development stack, for production, do: ENV='prod' vagrant up"
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --dev
fi

cd /usr/local/var/Heater-Controller-jenkins
docker-compose up -d

echo IPAddress:
ifconfig | grep "inet.*broadcast 192.168.0.255"