# **********
# Exercice 4
# **********

rm(list=ls())

library(readr)

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/02_Donnees")

financement = read_csv("statistiquespretsproduction.csv")

# Evaluer la variations des prêts accordés par le québec entre 2008 et 2013
# (relativement à leur nombre) independament du secteur d'activité.
# Tracer un graphique
#
# Calculer la somme totale des prêts sur cette période par secteur d'activité.
# Tracer un graphique 

# (Celui là il est magique et ce sont nos impôts qui financent :-P)
