FROM ubuntu:16.04
RUN apt-get update && apt-get -y install \
    gcc-arm-linux-gnueabi \
    gcc-arm-linux-gnueabihf \
    gdb-multiarch \
    make \
    qemu \
    qemu-user

RUN echo 'alias cc="arm-linux-gnueabi-gcc"' >> /aliases && \
    echo 'alias cchf="arm-linux-gnueabihf-gcc"' >> /aliases && \
    echo 'alias run="qemu-arm -L /usr/arm-linux-gnueabi"' >> /aliases && \
    echo 'alias runhf="qemu-arm -L /usr/arm-linux-gnueabihf"' >> /aliases

WORKDIR /work
