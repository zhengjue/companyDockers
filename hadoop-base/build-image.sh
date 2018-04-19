#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
docker build -t lza/ubuntu-hadoop-cluster-bash .

echo ""
