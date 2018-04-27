#!/bin/bash

# the default node number is 3
N=${1:-3}
hosts=""
while read line
do
	hosts=${hosts}" --add-host ${line}"
	#echo $hosts
done <  config/hosts
# start hadoop master container
sudo docker rm -f amb-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8080:8080 \
		-v /data/ambari-server:/var/lib/ambari-server \
                --name amb-master \
                --hostname amb-master \
		--ip 172.16.1.254 \
		${hosts} \
                lza/ambari-server  &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f amb-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
			-v /data/ambari-agent$i:/var/lib/ambari-agent \
	                --name amb-slave$i \
	                --hostname amb-slave$i \
			--ip 172.16.1.$i \
			${hosts} \
	                lza/centos-jdk  &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it  amb-master bash
