#!/bin/bash
PROJECT_NAME=test
sudo docker build -t hunan/$PROJECT_NAME . && sudo docker run -d -P --name $PROJECT_NAME hunan/$PROJECT_NAME 
