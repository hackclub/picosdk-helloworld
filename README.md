# Pico Hello World

A simple "Hello World" program for the Raspberry Pi Pico that prints a message every 0.5 seconds over USB serial.

## Features

- Prints "Hello, World!" every 0.5 seconds over USB serial
- Uses the Pico SDK's standard I/O functions
- Demonstrates basic timing with `sleep_ms()`
- Docker-based build system for cross-platform compatibility

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop/) - The only requirement for building!

## Building

The project uses Docker to handle all build dependencies, making it easy to build on any system.

1. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/pico-helloworld.git
   cd pico-helloworld
   ```

2. Run the build script:
   ```bash
   ./build.sh
   ```

   This will:
   - Build the Docker image (first time only)
   - Set up the build environment
   - Compile the project
   - Generate the output files in the `build` directory

The build process will create several files in the `build` directory:
- `hello_world.uf2` - The main file for flashing to the Pico
- `hello_world.bin` - Raw binary format
- `hello_world.hex` - Intel HEX format
- `hello_world.elf` - ELF format executable (for debugging)

## Flashing

1. Hold the BOOTSEL button while plugging in the Pico
2. The Pico will appear as a USB mass storage device
3. Copy the `build/hello_world.uf2` file to the Pico
4. The Pico will automatically restart and run the program

## Viewing the Output

1. After flashing, the Pico will enumerate as a USB serial device
2. Use your favorite serial monitor (e.g., `minicom`, `screen`, or PuTTY) to connect
3. You should see "Hello, World!" being printed every 0.5 seconds

## Advanced Usage

If you prefer to run the Docker commands manually:

```bash
# Build the Docker image
docker build -t pico-build .

# Run the build process
docker run --rm -v "$(pwd):/pico/project" pico-build build
```

## Troubleshooting

1. If you see permission errors when running Docker:
   - On Linux, make sure you're in the `docker` group
   - On Windows, ensure Docker Desktop is running
   - On macOS, ensure Docker Desktop has the necessary permissions

2. If the build fails:
   - Ensure Docker is running
   - Try removing the build directory: `rm -rf build`
   - Check that all files are present: `ls -la`

## License

This project is open source and available under the MIT License.