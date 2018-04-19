#!/bin/bash

# N is the node number of hadoop cluster
#create self define network
ipnet=172.16.0.0/16
ipstr=172.16.1
docker network rm hadoop
docker network create --subnet=${ipnet} hadoop
if [ $? -eq 0 ]
then  
	rm -f config/hosts
	echo "hadoop-master:${ipstr}.254" >>config/hosts
else
	echo "hadoop net error!!"
	exit 1
fi

N=$1

if [ $# = 0 ]
then
	echo "Please specify the node number of hadoop cluster!"
	exit 1
fi

# change slaves file
i=1
rm config/slaves
while [ $i -lt $N ]
do
	echo "hadoop-slave$i" >> config/slaves
	echo "hadoop-slave$i:${ipstr}.$i" >>config/hosts
	((i++))
done 

echo ""

echo -e "\nbuild docker hadoop image\n"

# rebuild kiwenlau/hadoop image
sudo docker build -t lza/ubuntu-hadoop-cluster-base .

echo ""
