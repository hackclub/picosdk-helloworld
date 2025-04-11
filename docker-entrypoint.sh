#!/bin/bash
set -e

# If the first argument is a flag or doesn't look like a command, 
# then we assume the user is passing arguments to the container
if [ "${1:0:1}" = '-' ] || [ -z "$(command -v "$1")" ]; then
    set -- bash "$@"
fi

# If the first argument is 'build', then we'll run the build process
if [ "$1" = 'build' ]; then
    # Create build directory if it doesn't exist
    mkdir -p build
    cd build
    
    # Run CMake
    cmake -DCMAKE_TOOLCHAIN_FILE=../arm-none-eabi-gcc.cmake ..
    
    # Build the project
    make -j$(nproc)
    
    # Return to the original directory
    cd ..
    
    # If no other arguments are provided, exit after build
    if [ "$#" -eq 1 ]; then
        exit 0
    fi
    
    # Otherwise, continue with the rest of the arguments
    shift
    set -- "$@"
fi

# Execute the command
exec "$@" 