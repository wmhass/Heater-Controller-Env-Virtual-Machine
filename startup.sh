ARGUMENTS="$@"
echo Args: $ARGUMENTS

sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --stop --prod
sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --stop --dev

# Run ENV='prod' vagrant up
if [[ " ${ARGUMENTS[@]} " =~ "prod" ]]; then
  # Production
  echo "!!!!!!!!! ====> Launching production stack, for production, do: ENV='prod' vagrant up"
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/updatestack.sh --all --pull --build
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --prod
#elif [[ " ${ARGUMENTS[@]} " =~ " dev " ]]; then
# Run ENV='dev' vagrant up
else
  # Development
  echo "====> ** Launching development stack"
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --dev
fi

echo IPAddress:
ifconfig | grep "inet.*broadcast 192.168.0.255"