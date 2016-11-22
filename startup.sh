#!/bin/bash
PROJECT_NAME=test
sodu docker build -t hunan/$PROJECT_NAME . && sodu docker run -d -P --name $PROJECT_NAME hunan/$PROJECT_NAME 
