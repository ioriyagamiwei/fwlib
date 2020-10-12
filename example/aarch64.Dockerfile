from arm64v8/debian as base

copy libfwlib32-linux-armv7.so.1.0.5 /usr/local/lib/libfwlib32.so.1.0.5
copy fwlib32.h /usr/include/
run dpkg --add-architecture armhf && \
  ln -s /usr/local/lib/libfwlib32.so.1.0.5 /usr/local/lib/libfwlib32.so && \
  ldconfig

#from base as builder

run apt-get update && \
  apt-get install -y libc6-dev g++ cmake gcc-arm-linux-gnueabihf

workdir /usr/src/mtconnect-adapter

copy example/ . 

run mkdir build && \
  cd build && \
  CC=arm-linux-gnueabihf-gcc cmake .. && \
  make && \
  make install

#from base

run ln -s /usr/arm-linux-gnueabihf/lib/ld-linux-armhf.so.3 /lib/ld-linux-armhf.so.3
#copy --from=builder /usr/src/mtconnect-adapter/build/bin/fanuc_example /usr/local/bin/
env LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/arm-linux-gnueabihf/lib/
cmd fanuc_example
