#!/bin/bash

IMAGE_NAME="hunan/test_web"
CONTAINER_NAME="test_web"

#是否有正在运行的container
RUNNING_CONTAINER=$(sudo docker ps | grep $CONTAINER_NAME | awk '{print $NF}')

if [ "$RUNNING_CONTAINER" ]
	then
		 echo "[Stop Container]:$CONTAINER_NAME ... "
	 	 sudo docker stop $CONTAINER_NAME
	 	 echo "[Delete Container]:$CONTAINER_NAME ... "
	 	 sudo docker rm $CONTAINER_NAME
	 else
	 	ALL_CONTAINER=$(sudo docker ps -a | grep $CONTAINER_NAME | awk '{print $NF}')
	 	if [[ "$ALL_CONTAINER" ]]; then
	 		 echo "[Deleteing Stoped Container]:$CONTAINER_NAME ... "
	 		 sudo docker rm $CONTAINER_NAME
	 	fi
fi

#是否有之前构建的镜像
EXISTED_IMAGE=$(sudo docker images | grep $IMAGE_NAME | awk '{print $1}')
if [ "$EXISTED_IMAGE" ]
	then
	 echo "[Delete IMAGE]:$EXISTED_IMAGE ... "
	 sudo docker rmi $EXISTED_IMAGE
fi

echo "[Building IMAGE]:$EXISTED_IMAGE ... "
sudo docker build -t $IMAGE_NAME . 
 echo "[Starting IMAGE]:$EXISTED_IMAGE ... "
sudo docker run -d -P --name $CONTAINER_NAME $IMAGE_NAME