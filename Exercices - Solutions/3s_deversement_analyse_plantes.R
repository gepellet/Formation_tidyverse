library(dplyr)
library(tidyr)
library(readr)

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/Donnees")

deversement2015 = read_csv("deversement_analyse_plantes_2015.csv")
deversement2016 = read_csv("deversement_analyse_plantes_2016.csv")

deversement = bind_rows(deversement2015, deversement2016) %>% gather(Element, Concentration, `Al (mg/L)`:`Zn (mg/L)`)

variations  = group_by(deversement, Nom, Element) %>% summarise(deltaC = diff(Concentration))

var_moyenne = group_by(variations, Element) %>% summarise(delta_moy = mean(deltaC))

