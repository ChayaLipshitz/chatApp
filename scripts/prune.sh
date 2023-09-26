#!/bin/bash


# Prune all containers
docker container prune -f


# Prune all images
docker image prune -f


# Prune all volumes
docker volume prune -f


# Prune all networks
docker network prune -f