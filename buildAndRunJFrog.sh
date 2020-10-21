#!/bin/bash

CONTAINER_NAME="artifactory"

if ! sudo docker container ls -a | grep -Fq "$CONTAINER_NAME" 1>/dev/null; then
  echo "# Docker "${CONTAINER_NAME}" container could not be found, pulling and running a new one"
  sudo docker pull docker.bintray.io/jfrog/artifactory-oss:latest
  sudo docker run -d -p 8081:8081 -p 8082:8082 --name artifactory docker.bintray.io/jfrog/artifactory-oss:latest
else
  echo "# Docker "${CONTAINER_NAME}" container found, starting it..."
  sudo docker start artifactory
fi
echo "# Enter anything to stop the application..."
read userinput
echo "# Attempting to stop Docker "${CONTAINER_NAME}" container..."
sudo docker stop artifactory
echo "# Bye"
