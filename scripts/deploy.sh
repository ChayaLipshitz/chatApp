#!/bin/bash

# Get the version and commit hash from the user

if [ -z "$1" ]; then
  read -p "Enter version: " version
else
  version=$1
fi

if [ -z "$2" ]; then
  read -p "Enter commit hash: " commit_hash
else
  commit_hash=$2
fi
echo "version is: {$version}"
echo "commit hash is: {$commit_hash}"
# Check if the image exists
IMAGE_EXISTS=$(docker image inspect  my-chat-app:$version | wc -l)

# If the image exists, ask the user if they want to rebuild it
if [ "$IMAGE_EXISTS" -gt 0 ]; then
  echo "Image  my-chat-app:$version already exists."
  read -p "Do you want to rebuild it? (Y/N) " REBUILD

  # If the user chooses to rebuild the image, delete the existing one
  if [ "$REBUILD" = "Y" ]; then
    echo "Deleting existing image..."
    docker rmi my-chat-app:$version
  fi
fi

# Build the image
docker build -t my-chat-app:$version .

# Tag the app and the image
git tag v$version $commit_hash
docker tag $version ChayaLipshitz/chat_app:$version

# Push the image to the repository
git push --follow-tags origin v$version
docker push ChayaLipshitz/chat_app:${version}

# If something was feild
if [ "$?" -ne 0 ]; then
  echo "There was an error deploying the image."
  exit 1
fi