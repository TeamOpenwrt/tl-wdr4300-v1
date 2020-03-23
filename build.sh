#!/bin/bash
# Copyright (C) 2020 The TeamOpenWRT Open Source Project
# BenLue
set -xe
export PATH=~/bin:$PATH

SCRIPTS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT_DIR=${SCRIPTS_DIR}/..
cd ${ROOT_DIR}

mkdir -p $OPENWRT_CONFIG_DIR
# Install all necessary packages
#sudo apt-get install build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core libssl-dev unzip python wget time

#feeds
./scripts/feeds update -a
./scripts/feeds install -a

# make clean

cp /$SCRIPT_DIR/system /$OPENWRT_CONFIG_DIR

cat ${ROOT_DIR}/build_script/diffconfig >> .config
make defconfig;make oldconfig
make -j$(nproc) || make V=s # Retry with full log if failed
