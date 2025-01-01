#!/bin/bash

SCREEN_NAME="pulsar_dev_session"
DOCKER_COMMAND="docker run -it \
  --privileged \
  --device /dev/snd \
  --network host \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $(pwd):/Work \
  --gpus all \
  pulsardev:latest"

# Create a new screen session and run the Docker command
xhost +local:docker && screen -dmS $SCREEN_NAME bash -c "$DOCKER_COMMAND; exec bash"
