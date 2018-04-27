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
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
		--ip 172.16.1.254 \
		${hosts} \
                lza/ubuntu-hadoop-cluster-base  &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
			--ip 172.16.1.$i \
			${hosts} \
	                lza/ubuntu-hadoop-cluster-base  &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it  hadoop-master bash
