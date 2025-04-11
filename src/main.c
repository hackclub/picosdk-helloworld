#include "hello_world.h"
#include "pico/stdlib.h"
#include <stdio.h>

int main() {
    // Initialize the standard I/O
    stdio_init_all();

    // Main loop
    while (true) {
        printf("Hello, World!\n");
        sleep_ms(500); // Sleep for 500 milliseconds (0.5 seconds)
    }

    return 0;
}