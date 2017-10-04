library(tidyr)
library(magrittr)
library(readr)

# **********
# Exercice 1
# **********

# On donne a 3 personnes 2 médicamments 'a' et 'b' et on mesure leur fréquence cardiaque
# - Les données sont-elles correctement représentées
# - Si oui faites un t-test pour test l'effet de 'a' par rapport à 'b'
# - Si non faites quand même un t-test pour test l'effet de 'a' par rapport à 'b'

data <- data.frame(
  name = c("Wilbur", "Petunia", "Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50)
)

# **********
# Exercice 2
# **********

# Les données contiennent pour chaque espèce d'arbre une information (supposée) binaire
# d'absence ou de présence de régénération végétale pour 10 parcelles d'échantillonnage.
# - Pourquoi les données sont mal représentées
# - Transformez ce tableau en tidydata
# - Remplacez les données non binaire en donnée binaire

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/Donnees")

regeneration = read_csv("regeneration.csv")

# **********
# Exercice 3
# **********

# On a, pour 7 personnes, le poids, age, taille, sexe ainsi que le groupe sanguin
# - Les données sont-elles correctement représentées
# - Si oui faites un modèle lineraire poids vs taille + groupe sanguin
# - Si non faites quand même un modèle lineraire poids vs taille + groupe sanguin

data <- data.frame(age    = c(56, 85, 12, 18, 25, 28, 26),
                   poids  = c(80, 70, 37, 75, 68, 63, 58),
                   taille = c(1.80, 1.75, 1.50, 1.79, 1.82, 1.75, 1.73),
                   sexe   = factor(c("H", "F", "H", "H", "H", "H", "F")),
                   groupe = factor(c("A", "A", "B", "B", "A", "B", "A")))
