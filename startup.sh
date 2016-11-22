#!/bin/bash
sudo docker build -t hunan/test_web . && sudo docker run -d -P --name test_web hunan/test_web
