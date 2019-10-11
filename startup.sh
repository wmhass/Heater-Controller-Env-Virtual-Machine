ARGUMENTS="$@"
echo Args: $ARGUMENTS

sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --stop --prod
sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --stop --dev

if [[ " ${ARGUMENTS[@]} " =~ "prod" ]]; then
  # Production
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/updatestack.sh --all --pull --build
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --prod
#elif [[ " ${ARGUMENTS[@]} " =~ " dev " ]]; then
else
  # Development
  sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --dev
fi

echo IPAddress:
ifconfig | grep "inet.*broadcast 192.168.0.255"