#!/bin/bash
#SBATCH -J QE_thermo
#SBATCH --ntasks-per-core=4 # for testing , use higher  ( max is 80 for all user jobs  )
#SBATCH --partition=defq #for testing , replace with production partition shortq mediumq or longq
#SBATCH --time=0-01:00:00 # for testing , replace with estimated duration  days-hh:mm:ss
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

module load thermo_pw/1.4.0-qe6.6

export OMP_NUM_THREADS=1

#prepare work dir

#run
echo "Running THERMO_PW with $SLURM_NTASKS"

./run_example

echo "Done"
