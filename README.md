# docker-arm
A Dockerfile and script for compiling, running and debugging ARM programs.

## Building the image
`docker build . -t xshill/arm`

## Running
Running `./docker-arm.sh` will call `docker run` on the image with the following arguments:

`--rm -it -v $(pwd):/work -u $UID:$UID`

Any arguments you pass to the script will be passed to `docker run` in addition to the default arguments.
For example, to forward port 1234, you can run:

`./docker-arm.sh -p 1234:1234`

Running the script will run bash on the container in `/work`, which is a volume for the working directory of the host.

## Aliases
There is a file at `/aliases` on the image that you can source. It contains the following aliases:

* `cc`: alias for `arm-linux-gnueabi-gcc`
* `cchf`: alias for `arm-linux-gnueabihf-gcc`
* `run`: alias for `qemu-arm -L /usr/arm-linux-gnueabi`
* `runhf`: alias for `qemu-arm -L /usr/arm-linux-gnueabihf`

It is not sourced by default. You need to source it yourself.
