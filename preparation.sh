#!/bin/bash
# Copyright (C) 2020 The TeamOpenWRT Open Source Project
# BenLue
set +xe
export PATH=~/bin:$PATH
./scripts/feeds update -a
./scripts/feeds install -a
