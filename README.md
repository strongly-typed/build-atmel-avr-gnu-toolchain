# Build Atmel AVR GNU GCC Toolchain from source <span style="float:right;"><a href="https://circleci.com/gh/strongly-typed/workflows/build-atmel-avr-gnu-toolchain/tree/master" style="border-bottom:none">![Build Status](https://circleci.com/gh/strongly-typed/build-atmel-avr-gnu-toolchain/tree/master.svg?style=shield)</a></span>

Atmel provides [source code of an adopted GCC toolchain for their AVR 8-bit](http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/3.6.1/)
microcontrollers. Sadly, they do not upstream their changes to GCC.

And unfortunately, they do not provide binaries for Linux and the AVR compiler
version in Debian and Ubuntu are always some versions behind.

| Release             | Toolchain                                                         |
|---------------------|-------------------------------------------------------------------|
| Ubuntu Trusty 14.04 | [4.8-2.1](https://packages.ubuntu.com/trusty/gcc-avr)             |
| Ubuntu Xenial 16.04 | [4.9.2+Atmel3.5.0-1](https://packages.ubuntu.com/xenial/gcc-avr)  |
| Ubuntu Zesty  17.04 | [4.9.2+Atmel3.5.3-1](https://packages.ubuntu.com/zesty/gcc-avr)   |
| Ubuntu Artful 17.10 | [5.4.0+Atmel3.6.0-1](https://packages.ubuntu.com/artful/gcc-avr)  |
| Ubuntu Bionic       | [5.4.0+Atmel3.6.0-1](https://packages.ubuntu.com/bionic/gcc-avr)  |
| Debian Wheezy 7     | [4.7.2-2](https://packages.debian.org/wheezy/gcc-avr)             |
| Debian Jessie 8     | [4.8.1+Atmel3.4.4-2](https://packages.debian.org/jessie/gcc-avr)  |
| Debian Stretch 9    | [4.9.2+Atmel3.5.3-1](https://packages.debian.org/stretch/gcc-avr) |
| Debian Buster       | [5.4.0+Atmel3.6.0-1](https://packages.debian.org/buster/gcc-avr)  |
| Debian Sid          | [5.4.0+Atmel3.6.0-1](https://packages.debian.org/sid/gcc-avr)     |

Newer compiler versions provide more recent C++ support and the device coverage
for the Atmel compiler is larger.

You can either build the toolchain on your host in a Docker container or let
CircleCI build the toolchain on their infrastructure.

## Building locally with Docker

There is a Docker image with all prerequisites for building. Start it with:

```sh
    docker run -it stronglytyped/atmel-avr-toolchain-build bash
```

It is quite huge (1 GiB) as Atmel requires LaTeX for creating a manual.

Inside the Docker container get this repository

```sh
    git clone https://github.com/strongly-typed/build-atmel-avr-gnu-toolchain.git
```

Run the build.sh script

```sh
    cd build-atmel-avr-gnu-toolchain
    time bash build.sh
```

It takes about 45 minutes on a MBP 13 Early 2013 so get some tea. The toolchain
will be in `avr-gcc`.

## Building in CircleCI

There is a CircleCI job defined in `.circleci/config.yml` which builds the
toolchain using the Docker container. For tagged commits, a Github release
will be created with the toolchain put into a downloadable `.tar.bz2` at
[Releases](https://github.com/strongly-typed/build-atmel-avr-gnu-toolchain/releases).

