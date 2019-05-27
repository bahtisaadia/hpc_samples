#!/bin/bash
#SBATCH -J SPADES_Serial_Job    
#SBATCH --ntasks=32
##SBATCH --ntasks-per-core=1
#SBATCH ---mem=120G
#SBATCH ---partition=shortq
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

#load modules
module load SPAdes

echo "Running SPAdes with $SLURM_NTASKS cores and $SLURM_MEM_PER_NODE G " 
metaspades.py -1 metag_1.fastq -2 metag_2.fastq -t $SLURM_NTASKS -m $SLURM_MEM_PER_NODE	 -o output.osd
echo "Done"
