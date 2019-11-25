#!/bin/bash
#SBATCH -J LMP
#SBATCH --ntasks=16
#SBATCH --ntasks-per-core=1
#SBATCH --partition=shortq
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

source /cm/shared/apps/intel/ips_2017/bin/compilervars.sh -arch intel64
module load openmpi/gcc/64/1.10.7
module load lammps/gcc/64/12Dec18

export WORK_DIR=/data/$USER/LMP${SLURM_JOB_ID}
export INPUT_DIR=$PWD/myInput
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR
cd $WORK_DIR


echo "Running Lammps with  $SLURM_NTASKS at : $WORK_DIR"

mpirun -np $SLURM_NTASKS lmp -in indent.in.min
