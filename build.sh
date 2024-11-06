#!/bin/bash

# Usage: ./build.sh <USERNAME> <POSTGRES_VERSION> <HLL_VERSION>

# Check if both arguments are provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <USERNAME> <POSTGRES_VERSION> <HLL_VERSION>"
  exit 1
fi

POSTGRES_VERSION=$1
HLL_VERSION=$2

# Ensure multi-platform builder is set up
docker buildx create --name multiarch-builder --use --driver docker-container || true

# Build the Docker image
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg POSTGRES_VERSION=${POSTGRES_VERSION} \
  --build-arg HLL_VERSION=${HLL_VERSION} \
  -f ./Dockerfile \
  -t ghcr.io/${USERNAME}/postgresql-hll:${POSTGRES_VERSION}-alpine \
  --push .

echo "Done! Your image is available at ghcr.io/${USERNAME}/postgresql-hll:${POSTGRES_VERSION}-alpine"
