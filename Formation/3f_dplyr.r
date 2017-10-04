# ==============================================================================
# =                                                                            =
# =                         THEME 3 : DPLYR                                    =
# =                                                                            =
# ==============================================================================

library(dplyr)
library(readr)

setwd("~/Documents/Thèse/Cours/Formations/Formation R - tidyverse/Donnees/")
data = read_csv("mesure_arbre.csv")

# Est-ce que le jeu de données est bien présenté?

# =========
# filter
# =========

filter(data, Zone == "Quebec" & Temps == 5)
data %>% filter(Zone == "Quebec" & Temps == 5)
data %>% filter(Zone == "Quebec", Temps == 5)

# =========
# mutate
# =========

data %>% mutate(V = Diametre^2/4*Hauteur/3)

# =========
# summarise
# =========

data %>% summarise(Vtot = sum(V))

data %>% filter(Temps == 1) %>% summarise(Vtot = sum(V))
data %>% filter(Temps == 3) %>% summarise(Vtot = sum(V))
data %>% filter(Temps == 5) %>% summarise(Vtot = sum(V))

# =========
# group_by
# =========

datag = data %>% group_by(Temps)

# ====================
# group_by + summarise
# ====================

# 95% des problèmes

data %>% group_by(Temps) %>% summarise(Vtot = sum(V))

data %>% group_by(Temps, Zone) %>% summarise(Vtot = sum(V))

# ====================
# groub_by + mutate
# ====================

# 4.9% des problèmes restants

diff = function(x)
{
  n = length(x)
  d = x[2:n] - x[1:(n-1)]
  c(0, d)
}

data %<>% group_by(Zone, Espece) %>% mutate(Accroissement_H = diff(Hauteur), Accroissement_D = diff(Diametre))

# =========
# jointure
# =========

Nomenclature = data.frame(Espece = c("Peuplier", "Bouleau", "Erable", "Chene", "Pin"), code = 1:5)

data %<>% left_join(Nomenclature, by = c("Espece" = "code"))

data %<>% rename(Essence = Espece.y) %>% select(-Espece)

# ===================
# case_when vs ifelse
# =================== 



