# Use the NVIDIA CUDA base image with cuDNN support
FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

# Set non-interactive mode for apt-get
ARG DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.10 \
    python3-pip \
    python3-opencv \
    python3-pillow \
    python3-matplotlib \
    git \
    wget \
    curl \
    vim \
    alsa-utils \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python packages
RUN pip3 install --no-cache-dir pulsar-client

# Set the working directory
WORKDIR /Dev

# Copy your application code (if any) into the container
# COPY . .

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]

