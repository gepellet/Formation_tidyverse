rm(list=ls())
library(tidyr)
library(magrittr)
library(readr)

# ************
# Exercice 1
# ************

data <- data.frame(
  name = c("Wilbur", "Petunia", "Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50)
)

# Les données ne sont pas 'tidy' et donc très diffilenent utilisables.

# La plus petite unité de mesure est une personne prennant un médicament donné et la mesure
# est une fréquence cardiaque.

# Une ligne doit donc contenir une personne, un medicament + une mesure.

# On peut reformater avec 'gather'

tidy = data %>% gather(drug, heartrate, a:b)
tidy$drug %<>% as.factor

# Faire un t-test devient d'une simplicité enfantine

t.test(heartrate~drug, data = tidy)

# ************
# Exercice 2
# ************

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/Donnees")

# Les données ne sont pas 'tidy' et donc très diffilenent utilisables.

# La plus petite unité de mesure est une classe de hauteur pour une essence dans une parcelle 
# et la mesure est la présence ou absence de cette unité.

# Une ligne doit donc contenir une classe de hauteur pour une essence pour une parcelle + une 
# mesure de présence.

# On peut reformater avec 'gather'

# Ici on reformate immediatement après avoir lu sans même stocker le résultat intermédaire

regeneration = read_csv("regeneration.csv") %>% gather(placette, presence, `1`:`10`)

# Nettoyer les données devient très simple.

regeneration$presence[regeneration$presence > 0] = 1

# ************
# Exercice 3
# ************

data <- data.frame(name   = c("Wilbur", "Petunia", "Gregory", "John", "George", "Jean-Romain", "Claude"),
                   age    = c(56, 85, 12, 18, 25, 28, 26),
                   poids  = c(80, 70, 37, 75, 68, 63, 58),
                   taille = c(1.80, 1.75, 1.50, 1.79, 1.82, 1.75, 1.73),
                   sexe   = c("H", "F", "H", "H", "H", "H", "F"),
                   groupe = c("A", "A", "B", "B", "A", "B", "A"))

# Les données sont 'tidy' et sont donc très facilement utilisables.

# Une ligne contient une unité de mesure. Une unité de mesure est une personne et dans
# ce cas il y a 5 mesures

# Faire un modèle linéaire est très simple.

lm1 = lm(poids~taille+groupe, data = data)
summary(lm1)