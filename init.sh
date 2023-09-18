#!/bin/bash
docker build -t my-chat-app .

docker volume create my-volume

# docker run -p 5000:5000 -v my-volume:/code my-chat-app

docker run -p 5000:5000 --cpus "2.0" --memory "1g" -v my-volume:/code my-chat-app