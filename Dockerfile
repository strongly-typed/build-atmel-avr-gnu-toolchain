FROM stronglytyped/docker-atmel-avr-toolchain-build
MAINTAINER Sascha Schade (strongly-typed) <stronglytyp3d@gmail.com>
LABEL Description="Image for building Atmel AVR GNU toolchain 3.6.1 for Linux"
WORKDIR /work

COPY . /work

CMD /work/build.sh
