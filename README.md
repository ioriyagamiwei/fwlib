# Fanuc fwlib example
An example that connects to a machine specified by MACHINE_IP & MACHINE_PORT in `main.c`  

# Docker Instructions
```bash
# Build the image
docker build -t fwlib-example .
# Run the image
docker run --rm --network=host fwlib-example
```

# Manual Instructions
1. `mkdir build && cd build`  
2. `CC=arm-linux-gnueabihf-gcc cmake ..` 
3. `make`  
4. `LD_LIBRARY_PATH=/usr/arm-linux-gnueabihf/lib/ ./bin/fanuc_example` 

The example is configured for armhf on aarch64.
