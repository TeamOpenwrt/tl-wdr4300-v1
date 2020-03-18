#!/bin/bash
# Copyright (C) 2020 The TeamOpenWRT Open Source Project
# BenLue
set +xe
export PATH=~/bin:$PATH

TARGET=$1
OPENWRT_VERSION="openwrt-19.07"

SCRIPTS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT_DIR=${SCRIPTS_DIR}/..
cd ${ROOT_DIR}

# Install all necessary packages
#sudo apt-get install build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core libssl-dev unzip python wget time

if [[ ! -d openwrt/.git ]]
then
    rm -rf openwrt
    git clone https://github.com/openwrt/openwrt.git -b $OPENWRT_VERSION openwrt
fi

cd ${ROOT_DIR}/openwrt
git fetch -a

git reset --hard HEAD^
git checkout -f ${OPENWRT_VERSION}

./scripts/feeds update -a
./scripts/feeds install -a

rm -rf ${ROOT_DIR}/openwrt/files


#cp ${ROOT_DIR}/configs/${TARGET}.config ${ROOT_DIR}/openwrt/.config
cp ${ROOT_DIR}/build_script/diffconfig ${ROOT_DIR}/openwrt/.config
cat diffconfig >> .config
make defconfig

make clean

make -j$(nproc) || make V=s # Retry with full log if failed
