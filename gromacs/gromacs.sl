#!/bin/bash
#SBATCH -J Gromacs
#SBATCH --partition=shortq
#SBATCH --ntasks=32
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load gromacs
module load openmpi/gcc/64/2.1.2
module load Gromacs/openmpi/gcc/64/2019.3

#prepare working dir 
export WORK_DIR=/data/$USER/gmx${SLURM_JOB_ID}
export INPUT_DIR=$PWD/ubiquitin
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR
cd $WORK_DIR


echo "Running Gromacs at $WORK_DIR"

mpirun -np $SLURM_NTASKS  gmx_mpi pdb2gmx -f 1ubq.pdb -o protein.gro 

echo "Done"
