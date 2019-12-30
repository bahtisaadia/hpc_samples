### Créer votre  environnement Python 
Créer le dossier /data/$USER/envs pour y créer les environnements conda et déclarer son chemin via la variable CONDA_ENVS_PATH
```
$export CONDA_ENVS_PATH=/data/$USER/envs
```
Charger le module  anaconda2
```
$module load anaconda2
```
Créer un environnement avec la version de python souhaité
```
$conda create -n my_env_3.6 python=3.6
```
Activer l’environnement 
```
$source activate my_env_3.6
```
### Installer les packages nécessaires sur la machine GPU
Allouer une heure d’accès à la machine GPU
```
$salloc  -t 60  --partition=gpu-testq  
Submitted batch job 24200
```
Se connecter à la machine GPU pour y installer les outils nécessaires 

```$ssh gpu01
$module load cuda91/toolkit/9.1.85
```
 Pour le cas du **Deep learning** , la librairie **cudnn** est déjà installé , pour l’utiliser :
```
$module load cudnn/9.0_v7.4.2.24 
```
 Installer les packages nécessaires (tensorflow par exemple) :
```
$conda install tensorflow-gpu=1.12.0
$conda install otherPackages
```
A la fin de l’installation, fermer la session ssh 
```              
$exit
```
et terminer l’allocation de la machine en annulant le job 
```
$scancel 24200
```
### Lancer votre calcul 
Une fois les outils nécessaires installés, créer le script de lancement du calcul souhaité 
Le script doit contenir la condition suivante pour allouer le nœud GPU au job 
  >   #SBATCH --partition=gpu-testq 
  
  >   #SBATCH --gres=gpu:2

A noter que la partition **gpu-testq** est limitée à 2 heures .elle est utile pour les jobs de tests.
pour des jobs plus long, veuillez utuliser la partition **gpu-prodq** ( qui permet une durée de 7 jours max ) 
