#! /usr/bin/env bash

## Bash script to setup PX4 development environment on Ubuntu LTS (18.04, 16.04).
## Can also be used in docker.
##
## Installs:
## - Common dependencies and tools for nuttx, jMAVSim, Gazebo
## - NuttX toolchain (omit with arg: --no-nuttx)
## - jMAVSim and Gazebo9 simulator (omit with arg: --no-sim-tools)
##
## Not Installs:
## - FastRTPS and FastCDR

# source ubuntu.sh
set -e

INSTALL_NUTTX="true"
INSTALL_SIM="true"

# NuttX toolchain (arm-none-eabi-gcc)
echo
echo "Installing NuttX dependencies"

sudo DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends install \
	autoconf \
	automake \
	bison \
	bzip2 \
	flex \
	gdb-multiarch \
	gperf \
	libncurses-dev \
	libtool \
	pkg-config \
	vim-common \
	;



# arm-none-eabi-gcc
NUTTX_GCC_VERSION="7-2017-q4-major"

if [ $(which arm-none-eabi-gcc) ]; then
	GCC_VER_STR=$(arm-none-eabi-gcc --version)
	GCC_FOUND_VER=$(echo $GCC_VER_STR | grep -c "${NUTTX_GCC_VERSION}")
fi

	if [[ "$GCC_FOUND_VER" == "1" ]]; then
		echo "arm-none-eabi-gcc-${NUTTX_GCC_VERSION} found, skipping installation"

	else
		echo "Installing arm-none-eabi-gcc-${NUTTX_GCC_VERSION}";
		wget -O /tmp/gcc-arm-none-eabi-${NUTTX_GCC_VERSION}-linux.tar.bz2 https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-${NUTTX_GCC_VERSION}-linux.tar.bz2 && \
			sudo tar -jxf /tmp/gcc-arm-none-eabi-${NUTTX_GCC_VERSION}-linux.tar.bz2 -C /opt/;

		# add arm-none-eabi-gcc to user's PATH
		exportline="export PATH=/opt/gcc-arm-none-eabi-${NUTTX_GCC_VERSION}/bin:\$PATH"

		if grep -Fxq "$exportline" $HOME/.profile;
		then
			echo "${NUTTX_GCC_VERSION} path already set.";
		else
			echo $exportline >> $HOME/.profile;
		fi
	fi


echo "Reboot or logout, login computer before attempting to build NuttX targets"

