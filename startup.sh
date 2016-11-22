#!/bin/bash
sudo docker build -t hunan/test_web /home/hunan/project/data/ && sudo docker run -d -p 8080:8080 --name test_web hunan/test_web
