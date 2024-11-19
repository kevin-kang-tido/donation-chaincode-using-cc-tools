#!/usr/bin/env bash

# Clear unused images and volumes
docker rmi $(docker images --quiet --filter "dangling=true")
docker volume rm $(docker volume ls -qf dangling=true)

# Bring down the Docker network before starting it again
echo "Stopping and removing existing containers..."
cd ./fabric && ./network.sh down 
cd ../


# Down ccapi 
echo "Bring the ccapi Down"
cd ./ccapi && docker-compose down