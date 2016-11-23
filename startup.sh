#!/bin/bash

IMAGE_NAME="hunan/test_web"
CONTAINER_NAME="test_web"


#是否有之前构建的镜像
EXISTED_IMAGE=$(sudo docker images | grep $IMAGE_NAME | awk '{print $1}')
if [ "$EXISTED_IMAGE" ]
	then
	 	echo "[IMAGE]:$EXISTED_IMAGE is already existed ... "
	 	sudo docker rmi $EXISTED_IMAGE
	else
		echo "[Build Image ...]:$EXISTED_IMAGE ... "
	    sudo docker build -t $IMAGE_NAME . 
fi


#是否有正在运行的container
RUNNING_CONTAINER=$(sudo docker ps | grep $CONTAINER_NAME | awk '{print $NF}')


if [[ "$RUNNING_CONTAINER" ]]
	then  #有正在运行的容器
	 	echo "[Stopping Container]:$CONTAINER_NAME ... "
	 	sudo docker stop $CONTAINER_NAME
	 	sleep 3000
	 	echo "[Starting Container]:$CONTAINER_NAME ... "
	 	sudo docker start $CONTAINER_NAME
	 else  #所有容器是否存在
	 	ALL_CONTAINER=$(sudo docker ps -a | grep $CONTAINER_NAME | awk '{print $NF}')
	 	if [[ "$ALL_CONTAINER" ]]; then
	 		echo "[Starting Container]:$CONTAINER_NAME ... "
	 		sudo docker start $CONTAINER_NAME
	 		else
	 			sudo docker run -d -p 8080:8080 --name $CONTAINER_NAME $IMAGE_NAME
	 	fi
fi
