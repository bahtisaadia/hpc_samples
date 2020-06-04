
Vu le fait que l’application ARB fonctionne en mode graphique, on vous demande de lancer l’application dans un nœud de calcul libre en exécutant les étapes suivantes :
```
$salloc -n1 
```
Cette commande permet l’allocation d’un nœud de calcul libre . par défaut , il sera alloué pour une durée de 2 heure (partition defq), vous pouvez la changer en spécifiant la partition avec l’option « -p » 
```
$squeue --job 65467 (JOBID donnée par la commande précédente) 
```
```
$ssh -X node07 (se connecter en mode ssh au noeud réservé au job  donnée par la commande précédente)
```
une fois connecté au nœud , charger les modules nécessaires pour le lancement de l’application ARB : 
```
$module load xerces-c/gcc/64/3.2.2
$module load ARB/gcc/18314
```
Puis lancer l’application 
```
$arb
```
N’oubliez pas de fermer la session à la fin du calcul pour libérer les ressources : 
```
$exit
```

