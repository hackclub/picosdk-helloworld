#!/bin/bash
set -e

# Function to run the build process
do_build() {
    echo "Starting build process..."
    
    # Create build directory if it doesn't exist
    mkdir -p build
    cd build
    
    # Run CMake
    cmake -DCMAKE_TOOLCHAIN_FILE=../arm-none-eabi-gcc.cmake ..
    
    # Build the project
    make -j$(nproc)
    
    echo "Build completed successfully!"
}

# Main script logic
case "$1" in
    build)
        do_build
        ;;
    *)
        exec "$@"
        ;;
esac 