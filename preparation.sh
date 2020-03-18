#!/bin/bash
# Copyright (C) 2020 The TeamOpenWRT Open Source Project
# BenLue
set +xe
export PATH=~/bin:$PATH

./scripts/feeds update -a
./scripts/feeds install -a

rm -rf /home/benlue/openwrt/.config/wdr4300.base.config
wget https://www.twist.tu-berlin.de/_downloads/69d6a8db1986cae83afbbec2bc44019b/wdr4300.base.config -O /home/benlue/openwrt/.config/wdr4300.base.config

rm -rf /home/benlue/openwrt/target/linux/ar71xx/config-3.18
wget https://www.twist.tu-berlin.de/_downloads/40d30713599afc3e747f35e0b5398b9b/wdr4300.base.kernel.config -O /home/benlue/openwrt/target/linux/ar71xx/config-4.14

make oldconfig

make V=s
