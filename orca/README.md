Il ne faut pas utiliser  mpirun pour lancer orca en parallèle.il faut plutot utilser la directive **!PalX** le dans le fichier input .
ci dessous un exemple pour utiliser 4 cores : 
>  ! B3LYP def2-SVP  Opt PAL4

le nombre déclaré  dans le fichier input doit correspondre au nombre déclaré dans le script 
