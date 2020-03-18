#!/bin/bash
# Copyright (C) 2020 The TeamOpenWRT Open Source Project
# BenLue
set +xe
export PATH=~/bin:$PATH

SCRIPTS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT_DIR=${SCRIPTS_DIR}/..
cd ${ROOT_DIR}

# Install all necessary packages
#sudo apt-get install build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core libssl-dev unzip python wget time

//./scripts/feeds update -a
//./scripts/feeds install -a
ls -lah

cp $ROOT_DIR/build_script/diffconfig $ROOT_DIR/.config
cat diffconfig >> .config
make defconfig

make clean

make -j$(nproc) || make V=s # Retry with full log if failed
