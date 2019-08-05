#!/bin/bash
#SBATCH --job-name=myGPUjob
#SBATCH --ntasks=1
#SBATCH -N 1
#SBATCH --partition=gpu-testq
#SBATCH --gres=gpu:1
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err

module load cuda91/toolkit
module load cudnn
export CONDA_ENVS_PATH=/data/$USER/env
module load anaconda2
source activate my_env_3.6
unset PYTHONPATH
python myPythonCode.py
