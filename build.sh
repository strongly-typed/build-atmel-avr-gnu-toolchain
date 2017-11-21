#!/usr/bin/env bash

SRC="src"
BUILD="build"
INSTALL="install"
DOWNLOAD="download"
mkdir ${SRC}
mkdir ${BUILD}
mkdir ${INSTALL}
mkdir ${DOWNLOAD}

# Get sources
VERSION=3.6.1
wget "http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${VERSION}/build-avr8-gnu-toolchain-git.sh"
wget "http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${VERSION}/avr-binutils.tar.bz2" -P ${DOWNLOAD}
wget "http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${VERSION}/avr-gcc.tar.bz2"      -P ${DOWNLOAD}
wget "http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${VERSION}/avr-gdb.tar.bz2"      -P ${DOWNLOAD}
wget "http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${VERSION}/avr-libc.tar.bz2"     -P ${DOWNLOAD}
wget "http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${VERSION}/avr8-headers.zip"     -P ${SRC}/headers

# Extract Tar Balls
tar xf ${DOWNLOAD}/avr-binutils.tar.bz2 --directory ${SRC}
tar xf ${DOWNLOAD}/avr-gcc.tar.bz2      --directory ${SRC}
tar xf ${DOWNLOAD}/avr-gdb.tar.bz2      --directory ${SRC}
tar xf ${DOWNLOAD}/avr-libc.tar.bz2     --directory ${SRC}

# Set ATMEL-VER which is not included in the tar ball
echo ${VERSION} > ${SRC}/gdb/bfd/ATMEL-VER
echo ${VERSION} > ${SRC}/gcc/gcc/ATMEL-VER

# Get dependencies
wget "https://ftp.gnu.org/gnu/gmp/gmp-5.0.2.tar.bz2"             -P ${SRC}/gmp
wget "http://www.mpfr.org/mpfr-3.0.0/mpfr-3.0.0.tar.gz"          -P ${SRC}/mpfr
wget "http://www.multiprecision.org/mpc/download/mpc-0.9.tar.gz" -P ${SRC}/mpc
wget "https://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz"        -P ${SRC}/ncurses

# Get Ncurses patch
wget "https://depot.galaxyproject.org/software/ncurses_patch/ncurses_patch_5.9p_src_all.patch"

# Patch Atmel's script
patch build-avr8-gnu-toolchain-git.sh < build-avr8-gnu-toolchain-git.sh.patch

# Run Atmel's magic script
export PARALLEL_JOBS=-j4
bash build-avr8-gnu-toolchain-git.sh -b ${BUILD} -p ${INSTALL} -s ${SRC}

# tar.bz2 toolchain