# Protostar-docker

this is a docker version for protostar image: 
[Protostar](https://exploit.education/protostar/)

## About

Protostar introduces the following in a friendly way:

    Network programming
    Byte order
    Handling sockets
    Stack overflows
    Format strings
    Heap overflows

The above is introduced in a simple way, starting with simple memory corruption and modification, function redirection, and finally executing custom shellcode.

In order to make this as easy as possible to introduce Address Space Layout Randomisation and Non-Executable memory has been disabled.

## Getting started

requirements:

- docker installed: https://docs.docker.com/engine/install/

### How to use it:

if you have no experience with docker, use the `protostar.sh` script to manage the building, running ect.

1. `sudo chmod u+x protostar.sh`
2. show help: `./protostar.sh`
3. build the image (you just need to build it at first): `./protostart.sh build`
4. run the protostar container: `./protostar.sh run`
6. connect to the container using `./protostart.sh connect` as root
7. Enjoy!

## Acknowledgement

This docker container setup is actually written by [Oussama Messabih](https://github.com/th3happybit) over [here](https://github.com/th3happybit/protostar-docker).
