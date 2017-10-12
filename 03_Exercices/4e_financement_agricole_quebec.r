# **********
# Exercice 4
# **********

rm(list=ls())
library(readr)

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/Donnees")

financement = read_csv("statistiquespretsproduction.csv")

# Evaluer l'augmentation des prêts agrigole et forestier par le québec entre 2008 et 2013
# relativement à leur nombre independament de leur destination
# Tracer un graphique
# Calculer la somme totale des prêts sur cette période par type de production

# (Celui là il est magique et ce sont nos impôts qui financent :-P)
