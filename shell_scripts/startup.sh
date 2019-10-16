ARGUMENTS="$@"

# Run ENV='prod' vagrant up
if [[ " ${ARGUMENTS[@]} " =~ "prod" ]]; then
  # Production
  echo "!!!!!!!!! ====> Launching Production stack, for Development, do: ENV='dev' vagrant up"
  # In the future, we might want to replace `--build-docker-images` by `--pull-docker-image`
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/updatestack.sh --all --build
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --stop --dev
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --prod
# Run ENV='dev' vagrant up
elif [[ " ${ARGUMENTS[@]} " =~ " dev " ]]; then
  # Development
  echo "!!!!!!!!! ====> Launching Development stack, for production, do: ENV='prod' vagrant up"
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --stop --prod
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --dev
fi

# Start Jenkins
cd /usr/local/var/Heater-Controller-jenkins
docker-compose up -d

# Print IP Address
echo IPAddress:
ifconfig | grep "inet.*broadcast 192.168.0.255"