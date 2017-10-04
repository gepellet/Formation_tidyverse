library(readr)

setwd("/home/jr/Documents/Thèse/Cours/Formations/Formation R - tidyverse/Donnees")

financement = read_csv("statistiquespretsproduction.csv")

prets  = financement %>% select(`Production principale`, contains("Montant"))
nombre = financement %>% select(`Production principale`, contains("Nombre"))

prets  %<>% gather(annee, montant, -`Production principale`)
nombre %<>% gather(annee, nombre, -`Production principale`)

prets  %<>% separate(annee, c("x", "y", "z", "t", "annee"), " ") %>% select(-x,-y,-z,-t)
nombre %<>% separate(annee, c("x", "y", "z", "t", "annee"), " ") %>% select(-x,-y,-z,-t)

financement = full_join(prets, nombre)

financement_relatif = financement %>% 
  group_by(annee) %>% 
  summarise(montant = sum(montant),
            nombre  = sum(nombre)) %>% 
  mutate(relatif = montant/nombre)

financement_relatif %$% plot(as.factor(annee), relatif)

financement_par_activite = financement %>%  
  group_by(`Production principale`) %>%  
  summarise(montant = sum(montant),
            nombre  = sum(nombre)) %>% 
  mutate(relatif = montant/nombre)

financement_par_activite %$% plot(as.factor(`Production principale`), montant)