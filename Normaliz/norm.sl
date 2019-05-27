#!/bin/bash
#SBATCH -J Normaliz_Job
#SBATCH --partition=shortq
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load modules
module load normaliz/3.6.2

#prepare working directory 
export WORK_DIR=/data/$USER/${SLURM_JOB_ID}
export INPUT_DIR=$PWD/Input
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR

cd $WORK_DIR

echo "Running Normaliz at $WORK_DIR"

normaliz exemple.in

echo "Done"
