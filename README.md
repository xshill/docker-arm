# docker-arm
This is a Dockerfile that contains tools to compile, run and debug
ARM programs. More specifically, it contains the GCC toolchain for ARM,
gdb-multiarch and qemu. This image is intended to be used as a semi-permanent environment
for running and compiling ARM binaries, rather than for running one-off commands.

## Building the image
Use the following command to build the image:

```
sudo docker build . -t xshill/arm --build-arg UID=<MY_UID>
```

Replace `<MY_UID>` with your own user ID. If you don't know it, you can use the following linux command to find it:

```
id -u
```

The UID parameter is used to create an internal container user that has the same permissions as your current user.

## Running
Use `sudo docker run -it xshill/arm` to launch the container. This will drop
you in an interactive bash session where you can use the tools. The working directory is `/work`.

### Using external files
You will most likely
want to access files that are outside of the container. To achieve this, you can use the `-v` flag to create a volume (a folder shared between your host and your container). For example:

```
sudo docker run -it -v /tmp/my_arm_files:/work xshill/arm
```

This will create a container with a link from the `/work` folder in the container to the `/tmp/my_arm_files` folder on the host.

## Aliases
The following aliases are available to the container user:
* `cc`: compile program for ARM using gcc
* `cchf`: compile program for ARMHF using gcc
* `run`: run ARM programs using qemu
* `runhf`: run ARMHF programs using qemu
