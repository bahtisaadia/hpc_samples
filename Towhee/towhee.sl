#!/bin/bash
#SBATCH -J Towhee
#SBATCH --partition=shortq
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load Towhee
module load OpenMPI/4.0.3-GCC-9.3.0
module load Towhee/mpi

export OMPI_MCA_opal_common_ucx_opal_mem_hooks=1
export OMPI_MCA_pml_ucx_verbose=100

#prepare working dir 
export WORK_DIR=/data/$USER/Towhee_${SLURM_JOB_ID}
export INPUT_DIR=/data/$USER/towhee_input
mkdir -p $WORK_DIR

cp -R $INPUT_DIR/* $WORK_DIR

cd $WORK_DIR


echo "Running Towhee at $WORK_DIR"

towhee towhee_input


echo "Done"


