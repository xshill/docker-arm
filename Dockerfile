FROM ubuntu:16.04

RUN apt-get update && apt-get -y install \
    gcc-arm-linux-gnueabi \
    gcc-arm-linux-gnueabihf \
    gdb-multiarch \
    make \
    qemu \
    qemu-user

ARG UID
RUN useradd -u $UID armuser -m

USER armuser

RUN echo 'alias cc="arm-linux-gnueabi-gcc"' >> /home/armuser/.bashrc && \
    echo 'alias cchf="arm-linux-gnueabihf-gcc"' >> /home/armuser/.bashrc && \
    echo 'alias run="qemu-arm -L /usr/arm-linux-gnueabi"' >> /home/armuser/.bashrc && \
    echo 'alias runhf="qemu-arm -L /usr/arm-linux-gnueabihf"' >> /home/armuser/.bashrc

WORKDIR /work
