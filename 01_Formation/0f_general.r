# ==============================================================================
# =                                                                            =
# =                 THEME 1 : R EST UN LANGUAGE VECTORIEL                      =
# =                                                                            =
# ==============================================================================

rm(list=ls())
library(Rcpp)
library(microbenchmark)

# ************************************
#   PARTIE 1 : THEORIE INFORMATIQUE
# ************************************

# ======================================
# Notions théoriques de base :
#   - l'OS
#   - la RAM
#   - language haut/bas niveau
#   - notion de typage
#   - allocation dynamique de mémoire
#	  - transtypage dynamique inféré
# 	- recyclage de ménoire
#   - recyclage automatique de mémoire (garbage collection)
#   - fuite de mémoire
#   - temps nécessaire à l'interprétation
# ======================================

# ----- Exemple de R -------

a = 1
a = 1.5
tab = c(4,5,6)    # Création d'un tableau de 3 entiers
tab = c(tab, 7)   # Ajout d'un entier au tableau
tab[2] = 4.5	  # Ajout d'un nombre décimal (float) au tableau
tab[9]

# ************************************
#     PARTIE 2 : THEORIE PRATIQUE
# ************************************

# ======================================
# Analyse de la fonction diff
#   - la pire façon de faire
#   - la bonne méthode de base
#   - la super bonne méthode en R : la vectorisation
#   - la méthode ultime en C++ compilé
# ======================================

# ====== Version originale =====

diff(c(1,2,4,4,3))

# ======= Version de base =======

# Comment beaucoup de gens l'écrivent

# c'est la pire façon possible et imaginable de faire.
# Chaque fois qu'une personne écrit ce type de code en R un
# chaton tout mimi se suicide sous un tracteur. Pensez-y !

f0 = function(x)
{
  output = c()

  for(i in 2:length(x))
  {
    difference = x[i] - x[i-1]
    output = c(output, difference)
  }

  return(output)
}

# ====== Version de base =======

# l'output est déjà remplit avec des 0. Lorsqu'on fait le calcul, la case existe
# déjà en mémoire. On ne fait que changer les valeurs 0 par le calcul au lieu d'ajouter
# des cases. Il n'y a pas de nouvelle allocation de mémoire.

f = function(x)
{
  output = numeric(length(x))

  for(i in 2:length(x))
    output[i] = x[i] - x[i-1]

  return(output)
}

# ------ comparaison de f0 et f ------

# n = 1e3 (x2), n = 1e4 (x10), n = 1e5 (x1000), n = 1e6 (impossible à calculer)

n = 1e4
t = runif(n, 0, 10)

microbenchmark(f(t), f0(t), times = 5)

# ======= Version vectorisée 1 =======

fR = function(x)
{
  return( x[-1] - x[-length(x)] )
}

n = 1e6
t = runif(n, 0, 10)

microbenchmark(fR(t), f(t), times = 10)


# ======= Version vectorisée 2 =======

fR2 = function(x)
{
  return(x - dplyr::lag(x))
}

# ------ comparaison de fR et f ------
# n = 1e5 (x130), n = 1e6 (x100), n = 1e7 (x50) (long)

n = 1e6
t = runif(n, 0, 10)

microbenchmark(fR2(t), fR(t), times = 20)


# ======= Version en C++ =======

cppFunction('
NumericVector fC(NumericVector x)
{
int n = x.size();
NumericVector output(n);
output[0] = 0;

for(int i = 1 ; i < n ; ++i)
output[i] = x[i] - x[i-1];

return output;
}')
			
# ----- comparaison de fC et fR2  -----
# n = 1e3 (x8), n = 1e7 (x6), n = 1e8 (!! dépassement de RAM)

n = 1e7
t = runif(n, 0, 10)

microbenchmark(fC(t), fR2(t), times = 10)

# Comparaison totale

n = 2e4
t = runif(n, 0, 10)
microbenchmark(f0(t), f(t), fR2(t), fC(t), times = 3)

microbenchmark(fR(t), fC(t), diff(t), times = 50)

# ************************************
#       PARTIE 3 : CONCUSIONS
# ************************************

# - R est un language vectoriel.
# - Si vous écrivez des boucles, il vous manque des notions pour mieux utiliser R.
# - R n'est pas lent (si mais moins qu'on le croit).
# - Seul les mauvais codes sont lent.
# - Si un package est lent c'est surement qu'il est mal codé.

# - Les packages du tidyverse permettent de faire de la programmation vectorielle.
# - Les packages du tidyverse sont codés en C++.
