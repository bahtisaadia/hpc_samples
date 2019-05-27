Créer un dossier dans votre dossier personel sur /data pour y installer les librairies R dont vous avez besoins :
```
mkdir -p /data/$USER/myLibs/R_LIBS
```
déclarer la variable R_LIBS pour 
```
export R_LIBS=/data/$USER/myLibs/R_LIBS
```
Installer les libraries dont vous avez besoin via la job install.sl en spécifiant la liste des libraries dans un fichier reqs.R 

```
sbatch install.sl
```

une fois le job d'installation terminé , vous pouvez lancer votre job de traitement de donées avec le script slurm   run.sl en spécifiant les commandes dans un fichier R ( exemple : commandes.R) 

```
sbatch run.sl
```
