#!/bin/bash
#SBATCH -J QE_intel #jobname
#SBATCH --ntasks=32 #number of cpus 
#SBATCH --ntasks-per-core=1
#SBATCH --partition=mediumq #partition depending on job duration
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load modules
source /cm/shared/apps/intel/ips_2017/bin/compilervars.sh -arch intel64 -platform linux
source /cm/shared/apps/intel/ips_2017/mkl/bin/mklvars.sh intel64
module load qe/intel/6.4

#prepare working directory 
export WORK_DIR=/data/$USER/qe64_${SLURM_JOB_ID}
export INPUT_DIR=$PWD/myInput
export ESPRESSO_PSEUDO=/data/$USER/pseudo
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR
cd $WORK_DIR


echo "Running Quantum Espresso with $SLURM_NTASKS at $WORK_DIR"

mpirun -np $SLURM_NTASKS pw.x -i test.pw-in > test.pw-out

echo "Done"


