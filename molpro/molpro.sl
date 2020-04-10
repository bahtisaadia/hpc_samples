#!/bin/bash
#SBATCH -J Molpro
#SBATCH --partition=defq
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err


module load singularity
module load molpro/2010_1

echo "Running  molpro "

$MOLPRO_IMG_EXEC ./runmolpro.sh test.com

echo " Done "
