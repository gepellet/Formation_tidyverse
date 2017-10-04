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

tidy = data %>% gather(drug, heartrate, a:b)
tidy$drug %<>% as.factor

t.test(heartrate~drug, data = tidy)

# ************
# Exercice 2
# ************

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/Donnees")

regeneration = read_csv("regeneration.csv") %>% gather(placette, presence, `1`:`10`)
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

lm1 = lm(poids~taille+groupe, data = data)
summary(lm1)
