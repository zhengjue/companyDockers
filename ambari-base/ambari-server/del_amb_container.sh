for i in `docker ps -q -f name=amb-`; do docker rm -f $i; done
