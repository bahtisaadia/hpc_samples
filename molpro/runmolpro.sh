#!/bin/bash
export MOLPROROOT=/opt/molpro2010/molpros_2010_1_Linux_x86_64_i8/
export PATH=$PATH:$MOLPROROOT/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MOLPROROOT/lib
export WFUPATH=/mnt/workdir/wfu
mkdir -p $WFUPATH
molpro -W $WFUPATH $1
