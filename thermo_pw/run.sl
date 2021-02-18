#!/bin/bash
#SBATCH -J QE_thermo
#SBATCH --nodes=1 #for testing  , remove if you don t need processes to run on same node
#SBATCH --ntasks-per-node=4 # for testing , use higher  ( max is 80 for all user jobs  )
#SBATCH --ntasks-per-core=4
#SBATCH --partition=defq #for testing , replace with production partition shortq mediumq or longq
#SBATCH --time=0-01:00:00 # for testing , replace with estimated duration  days-hh:mm:ss
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

module load qe/openmpi/gcc/64/6.6-with_thermo_pw
export OMP_NUM_THREADS=1

#prepare work dir

#run
echo "Running THERMO_PW with $SLURM_NTASKS"

./run_example

echo "Done"
