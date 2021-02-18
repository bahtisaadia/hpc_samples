
Testé avec les exemples fournis avec thermo_pw .

Le script  run_exemple a été  modifié  pour spécifier les variables d'environnement relatives à l'installation HPC-MARWAN :

```
BIN_DIR=$APPS_DIR/qe/openmpi/gcc/64/6.6/bin
PSEUDO_DIR=/data/$USER/thermo_pw/pseudo
TMP_DIR=/data/$USER/thermo_pw/tmp
PARA_PREFIX="mpirun -np $SLURM_NTASKS"
PARA_POSTFIX=" -nk 1 -nd 1 -nb 1 -nt 1 " 
PARA_IMAGE_POSTFIX="-ni 2 $PARA_POSTFIX"
PARA_IMAGE_PREFIX="mpirun -np $SLURM_NTASKS"
BIN_LIST="thermo_pw.x"
PSEUDO_LIST="Si.pz-vbc.UPF"
RESULT_DIR=results$SLURM_JOB_ID
```

PARA_POSTFIX et PARA_IMAGE_POSTFIX à adapter au nombre de cpu alloué ( --ntasks-per-core ) 
