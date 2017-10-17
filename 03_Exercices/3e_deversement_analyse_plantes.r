rm(list=ls())

library(readr)

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/02_Donnees")

deversement2015 = read_csv("deversement_analyse_plantes_2015.csv")
deversement2016 = read_csv("deversement_analyse_plantes_2016.csv")

# Calculer pour chaque éléments chimique, la variation moyenne de concentration entre 2015 
# et 2016 sur l'ensemble du territoire analysé.
