#!/bin/bash

IMAGE_NAME="hunan/test_web"
CONTAINER_NAME="test_web"

sudo docker build -t $IMAGE_NAME . 
sudo docker run -d -p 8080:8080 --name $CONTAINER_NAME $IMAGE_NAME

sudo docker attach $CONTAINER_NAME

RC=$(sudo docker wait $CONTAINER_NAME)
