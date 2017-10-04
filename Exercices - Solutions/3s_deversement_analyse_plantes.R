library(dplyr)
library(tidyr)
library(readr)

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/Donnees")

deversement2015 = read_csv("deversement_analyse_plantes_2015.csv")
deversement2016 = read_csv("deversement_analyse_plantes_2016.csv")

# Les données ne sont pas 'tidy'

# Une unité de mesure est une parcelle à une date donnée pour un élément donné. Une mesure est
# une concentration.

# Ici on merge les deux tableaux puis on le reformate immediatement après. C'est plus simple
# que de reformater deux fois puis merger.

deversement = bind_rows(deversement2015, deversement2016) %>% gather(Element, Concentration, `Al (mg/L)`:`Zn (mg/L)`)

# Nous avons maintenant de belles données

# Nous voulons faire un traitement par groupe car on veux faire quelaue chose **pour chaque** 
# parcelle et pour chaque element. C'est une aggregation donc 'group_by'

# Que veut on faire pour chaque groupe? Calculer une unique valeur qui resume le jeu de donnée
# Cette valeur c'est la difference de concentration. Donc 'summarise'

variations  = group_by(deversement, Nom, Element) %>% summarise(deltaC = diff(Concentration))

# Nous avons maintenant les variations pour chaque parcelle pour chaque element. Nous voulons
# résumer encore plus en regardant la moyenne de toute les parcelles **pour chaque** élement.
# Donc 'group_by + summarise'

var_moyenne = group_by(variations, Element) %>% summarise(delta_moy = mean(deltaC))

