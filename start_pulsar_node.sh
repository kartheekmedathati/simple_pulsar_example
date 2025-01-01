docker run -it \
  --network host \
  --name pulsar \
  apachepulsar/pulsar:2.8.0 \
  bin/pulsar standalone 
