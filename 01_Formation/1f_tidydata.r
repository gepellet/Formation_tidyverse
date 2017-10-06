rm(list=ls())
library(tidyr)

# ==============================================================================
# =                                                                            =
# =       THEME 1 : TABLEAUX CONTINGENT BASE DE DONNEE ET TIDYDATA             =
# =                                                                            =
# ==============================================================================

# ====================================================================
# - Qu'est qu'un tableau contingent (ou tableau large)
# - Conversion en tableau large en tableau long type "base de données"
# ====================================================================

# Prenons un tableux contingent contenant des données qui pourrraient être
# des données de génétique

data = data.frame(experience = 1:10,
                  GPQW1      = rnorm(10, 5,0.5),
                  GPQW2      = rnorm(10, 6,0.8),
                  GPQW3      = rnorm(10, 6, 1),
                  PpH42      = rnorm(10, 2, 0.1),
                  PpH42b     = rnorm(10, 3, 0.1))

# Calculer la moyenne et l'écart-type pour chaque gène
# Tracer un graphique des résulats
# Selectionnez uniquement les données qui ont une valeur supérieure à 5

# C'est possible ! MAIS TELLEMENT DIFFICILE !!!
# Et on parle là juste de calculer une moyenne et faire un filtre...

# Conversion en base de données avec le package tidyr (reshape2 aussi)
data2 = gather(data, gene, survie, GPQW1:PpH42b)

# Autre syntaxe
data2 = gather(data, gene, survie, -experience)

# Aggregation (R base)
moy = aggregate(survie~gene, data2, mean)
et  = aggregate(survie~gene, data2, sd)

# Filtre > 5 (R base)
sup5 = data2[data2$survie > 5, ]