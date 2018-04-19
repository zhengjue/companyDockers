:<<USAGE
########################################
curl -Lo .amb j.mp/docker-ambari && . .amb
########################################

full documentation: https://github.com/sequenceiq/docker-ambari
USAGE

: ${NODE_PREFIX=amb}
: ${AMBARI_SERVER_NAME:=${NODE_PREFIX}-server}
: ${AMBARI_SERVER_IMAGE:="hortonworks/ambari-server:latest"}
: ${AMBARI_AGENT_IMAGE:="hortonworks/ambari-agent:latest"}
: ${DOCKER_OPTS:=""}
: ${CONSUL:="${NODE_PREFIX}-consul"}
: ${CONSUL_IMAGE:="sequenceiq/consul:v0.5.0-v6"}
: ${CLUSTER_SIZE:=3}
: ${DEBUG:=1}
: ${SLEEP_TIME:=2}
: ${DNS_PORT:=53}
: ${EXPOSE_DNS:=false}
: ${DRY_RUN:=false}

: 获取容器ip
get-host-ip() {
  HOST=$1
  docker inspect --format="{{.NetworkSettings.IPAddress}}" ${HOST}
}

