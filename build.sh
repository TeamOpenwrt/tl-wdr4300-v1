#!/bin/bash
# Copyright (C) 2020 The TeamOpenWRT Open Source Project
# BenLue
set -xe
export PATH=~/bin:$PATH
SCRIPTS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )	mkdir -p $ROOT_DIR/$OPENWRT_CONFIG_DIR/
ROOT_DIR=${SCRIPTS_DIR}/..	ls -lah $ROOT_DIR/$OPENWRT_CONFIG_DIR/
cd ${ROOT_DIR}

mkdir -p $ROOT_DIR/$OPENWRT_CONFIG_DIR/
ls -lah $ROOT_DIR/$OPENWRT_CONFIG_DIR/
# Install all necessary packages
#sudo apt-get install build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core libssl-dev unzip python wget time

# Clean Workspace
make clean

#feeds
./scripts/feeds update -a
./scripts/feeds install -a

cat ${ROOT_DIR}/build_script/diffconfig >> .config

## ToDo; cp config files
# system
cp /$SCRIPT_DIR/system $OPENWRT_CONFIG_DIR

# firewall
cp /$SCRIPT_DIR/firewall $OPENWRT_CONFIG_DIR

# network
cp /$SCRIPT_DIR/network $OPENWRT_CONFIG_DIR

# wireless
cp /$SCRIPT_DIR/wireless $OPENWRT_CONFIG_DIR

cat /${ROOT_DIR}/build_script/diffconfig >> .config
make defconfig;make oldconfig
make -j$(nproc) || make V=s # Retry with full log if failed
