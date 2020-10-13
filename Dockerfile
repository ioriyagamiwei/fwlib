from debian:buster-slim as base

copy libfwlib32-linux-armv7.so.1.0.5 /usr/local/lib/libfwlib32.so.1.0.5
copy fwlib32.h /usr/include/

run ln -s /usr/local/lib/libfwlib32.so.1.0.5 /usr/local/lib/libfwlib32.so && \
  ldconfig && \
  dpkg --add-architecture armhf && \
  apt-get update && apt-get install -y \
    libc6-dev:armhf \
    gcc-arm-linux-gnueabihf


from base as builder

run apt-get install -y cmake build-essential 
workdir /usr/src/fwlib-example
copy . .

run mkdir build && \
  cd build && \
  CC=arm-linux-gnueabihf-gcc cmake .. && \
  make

from base

env LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/arm-linux-gnueabihf/lib/
copy --from=builder /usr/src/fwlib-example/build/bin/fanuc_example /usr/local/bin/

cmd fanuc_example
