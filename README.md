# Pico Hello World

A simple "Hello World" program for the Raspberry Pi Pico, demonstrating basic USB serial output.

## Features

- Prints "Hello, World!" every 0.5 seconds over USB serial
- Uses the Pico SDK's standard I/O functions
- Demonstrates basic timing with `sleep_ms()`

## Building

### Prerequisites

- [Pico SDK](https://github.com/raspberrypi/pico-sdk)
- CMake
- ARM GCC toolchain

### Build Steps

1. Set the PICO_SDK_PATH environment variable:
   ```bash
   export PICO_SDK_PATH=/path/to/pico-sdk
   ```

2. Create a build directory and run CMake:
   ```bash
   mkdir build
   cd build
   cmake -DCMAKE_TOOLCHAIN_FILE=../arm-none-eabi-gcc.cmake ..
   ```

3. Build the project:
   ```bash
   make -j4
   ```

## Flashing

1. Hold the BOOTSEL button while plugging in the Pico
2. The Pico will appear as a USB mass storage device
3. Copy the `hello_world.uf2` file from the build directory to the Pico

## License

This project is open source and available under the MIT License.