FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    python3 \
    python3-pip \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /pico

# Clone Pico SDK
RUN git clone https://github.com/raspberrypi/pico-sdk.git && \
    cd pico-sdk && \
    git submodule update --init && \
    cd ..

# Set environment variables
ENV PICO_SDK_PATH=/pico/pico-sdk

# Create a non-root user
RUN useradd -m -s /bin/bash pico && \
    chown -R pico:pico /pico

# Switch to non-root user
USER pico

# Create project directory
RUN mkdir -p /pico/project

# Copy entrypoint script
COPY --chown=pico:pico docker-entrypoint.sh /pico/docker-entrypoint.sh
RUN chmod +x /pico/docker-entrypoint.sh

WORKDIR /pico/project
ENTRYPOINT ["/pico/docker-entrypoint.sh"]
CMD ["bash"] 