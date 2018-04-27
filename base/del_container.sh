docker rm -f `docker ps -a | grep Exited |awk '{print $1}'`
docker rm -f `docker ps -a | grep -v 'Up' |awk '{print $1}'`
