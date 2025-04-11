cmake_minimum_required(VERSION 3.13)

# Initialize pico_sdk from environment variable
if(NOT DEFINED ENV{PICO_SDK_PATH})
    message(FATAL_ERROR "PICO_SDK_PATH environment variable is not set")
endif()

# Set project name first
project(hello_world C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Set the output extension for executables
set(CMAKE_EXECUTABLE_SUFFIX ".elf")

# Pull in SDK (must be after project)
include(pico_sdk_import.cmake)

# Initialize the SDK
pico_sdk_init()

# Add executable
add_executable(hello_world
    src/main.c
)

# Add include directories
target_include_directories(hello_world PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/include
)

# Pull in our pico_stdlib which pulls in commonly used features
target_link_libraries(hello_world pico_stdlib)

# Enable USB output, disable uart output
pico_enable_stdio_usb(hello_world 1)
pico_enable_stdio_uart(hello_world 0)

# Create map/bin/hex file etc.
pico_add_extra_outputs(hello_world) 