#!/bin/bash
set -e

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    echo "Visit https://www.docker.com/products/docker-desktop/ for installation instructions."
    exit 1
fi

# Build the Docker image if it doesn't exist
if ! docker image inspect pico-build &> /dev/null; then
    echo "Building Docker image..."
    docker build -t pico-build .
fi

# Run the build in Docker
echo "Building project..."
docker run --rm -v "$(pwd):/pico/project" pico-build build

echo "Build complete! The compiled files are in the 'build' directory." 