#!/bin/bash
#SBATCH -J Molpro
#SBATCH --partition=defq
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err


module load singularity
module load molpro/2010_1


#prepare working dir
export WORK_DIR=/data/$USER/${SLURM_JOB_ID}
export INPUT_DIR=$PWD/myInput
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR/
cp $PWD/runmolpro.sh $WORK_DIR/
cd $WORK_DIR/

echo "Running Molpro at working dir :  $WORK_DIR"
chmod +x runmolpro.sh

singularity exec --bind $WORK_DIR:/mnt/workdir $MOLPRO_IMG  ./runmolpro.sh test.com

echo " Done "
