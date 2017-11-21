# Build Atmel AVR GNU GCC Toolchain from source

You can either build the toolchain on your host in a Docker container or let CircleCI build the toolchain on their infrastructure.

Toolchain comes from

    http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/3.6.1/

## Building locally with Docker

There is Docker image with all prerequisites

    docker run -it stronglytyped/atmel-avr-toolchain-build bash

It is quite huge (1 GiB) as Atmel requires LaTeX for creating a manual.

Inside the Docker container get this repository

    git clone https://github.com/strongly-typed/build-atmel-avr-gnu-toolchain.git

Run the build.sh script

    cd build-atmel-avr-gnu-toolchain
    time bash build.sh

It takes about 45 minutes on a MBP 13 Early 2013 so get some tea.
