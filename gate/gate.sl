#!/bin/bash
#SBATCH -J Gate8.2
#SBATCH --partition=shortq
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load modules 
ml geant4/gcc/64/4.10.05
ml root/gcc/64/6.16.00
ml gate/gcc/64/8.2
ml VTK/gcc/64

#prepare working dir
export WORK_DIR=/data/$USER/gate_$SLURM_JOB_ID

mkdir -p $WORK_DIR
cp $PWD/benchPET/* $WORK_DIR
cp $PWD/GateMaterials.db $WORK_DIR/
echo "Running gate in $WORK_DIR"

cd $WORK_DIR

echo "Running Gate in $WORK_DIR"

Gate benchPET.mac
root -b -q benchmarkPET.C

echo "Done"

