#!/bin/bash

# Get the version and commit hash from the user
if [ -z "$version" ]; then
  read -p "enter version: " version
fi

if [ -z "$commit_hash" ]; then
  read -p "enter commit hash: " commit_hash
fi

# Build the image
docker build -t $version .

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