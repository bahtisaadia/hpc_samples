#!/bin/bash
#SBATCH --job-name="GPU_test"
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p shortq
#SBATCH --nodelist=gpu01
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

module load cuda91/toolkit/9.1.85


export WORK_DIR=$PWD/${SLURM_JOB_ID}
export INPUT_DIR=$PWD
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR

echo "creating work dir $WORK_DIR `hostname`"
cd $WORK_DIR


nvcc sample.cu -o sample.o
srun ./sample.o
