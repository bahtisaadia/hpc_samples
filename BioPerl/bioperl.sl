#!/bin/bash
#SBATCH -J BioPerl_Job
#SBATCH --partition=shortq
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load module
module load BioPerl/1.007002

#prepare working dir
export WORK_DIR=/home/$USER/${SLURM_JOB_ID}
mkdir -p $WORK_DIR
cp biocode.pl $WORK_DIR/
cd $WORK_DIR/

echo " Running perl code on `hostname` at `date` "

perl biocode.pl

echo " Job Done"
