#!/bin/bash

IMAGE_NAME="hunan/test_web"
CONTAINER_NAME="test_web"

#是否有正在运行的container
RUNNING_CONTAINER=$(sudo docker ps -a | grep $CONTAINER_NAME | awk '{print $NF}')

if [ "$RUNNING_CONTAINER" ]
	then
	 echo "[Stop Container]:$CONTAINER_NAME ... "
	 sudo docker stop $CONTAINER_NAME
	 echo "[Delete Container]:$CONTAINER_NAME ... "
	 sudo docker rm $CONTAINER_NAME
fi

#是否有之前构建的容器
EXISTED_IMAGE=$(sudo docker images | grep $IMAGE_NAME | awk '{print $1}')
if [ "$EXISTED_IMAGE" ]
	then
	 echo "[Delete IMAGE]:$EXISTED_IMAGE ... "
	 sudo docker rmi $EXISTED_IMAGE
fi

sudo docker build -t $IMAGE_NAME . 
sudo docker run -d -p 8080:8080 --name $CONTAINER_NAME $IMAGE_NAME
