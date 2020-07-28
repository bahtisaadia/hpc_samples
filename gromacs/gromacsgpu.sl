#!/bin/bash
#SBATCH -J GromacsGPU
#SBATCH --partition=gpu-prodq
#SBATCH --gres=gpu:1
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load gromacs
module load cuda10.1/toolkit

source /cm/shared/apps/intel/ips_2017/bin/compilervars.sh -arch intel64
source /cm/shared/apps/gromacs/intel/64/2018.3/bin/GMXRC

#prepare working dir 
export WORK_DIR=/data/$USER/gmx${SLURM_JOB_ID}
export INPUT_DIR=$PWD/ubiquitin
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR
cd $WORK_DIR


echo "Running Gromacs with $SLURM_NTASKS  at $WORK_DIR"

mpirun -np $SLURM_NTASKS gmx_mpi pdb2gmx -f 1ubq.pdb -o protein.gro

echo "Done"
