#!/bin/bash

# # Stop all running containers
# docker stop $(docker ps -a -q)

# # Remove all stopped containers
# docker rm $(docker ps -a -q)

# #Remove volume my volume
# docker volume remove chat-app-data
# docker volume prune -y


# # Remove all images
# docker rmi -f $(docker images -a -q)

docker stop chat-app-run
if [ $# -eq 0 ]; then
    docker rmi -f my-chat-app
else
    docker rmi -f my-chat-app:$1
fi
docker rm -f chat-app-run



