#!/bin/bash

# docker build -t my-chat-app .

# docker volume create chat-app-data

# # docker run -p 5000:5000 -v chat-app-data:/code my-chat-app

# docker run -p 5000:5000 --cpus "2.0" --memory "1g" -v chat-app-data:/code my-chat-app

version='latest'

if [ $# -ne 0 ]; then
    # Arguments were passed, so use them
    version=$1
fi
docker build -t  my-chat-app:${version} .

docker volume create chat-app-data

docker run -p 5000:5000 --name chat-app-run --cpus "2.0" --memory "1g" -v chat-app-data:/code my-chat-app:${version}