#!/bin/bash
#SBATCH -J QE
#SBATCH --ntasks=16
#SBATCH --ntasks-per-core=1
#SBATCH --partition=defq
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load QuantumESPRESSO
module load QuantumESPRESSO/6.6-foss-2019b

#prepare work dir
export WORK_DIR=/data/$USER/Qe${SLURM_JOB_ID}
export INPUT_DIR=$PWD/myInput
export ESPRESSO_PSEUDO=/data/$USER/pseudo
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR
cd $WORK_DIR

#run
echo "Running Quantum Espresso with $SLURM_NTASKS at $WORK_DIR"

mpirun -np $SLURM_NTASKS pw.x -i myInputFile.in > myOutputFile.out

echo "Done"
