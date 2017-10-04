library(magrittr)

# ==============================================================================
# =                                                                            =
# =                         THEME 2 : MAGRITTR                                 =
# =                                                                            =
# ==============================================================================

# ==================================
# =   Opérateur de piping simple   =
# ==================================

# Ecrire plusieurs fonctions l'une dans l'autre est parfois illisible

x = runif(20)
y = mean(sqrt(diff(cumsum(x))+1)/3)

# Pour résoudre ce problème on peut créer des sous variables

xcum = cumsum(x)
xcumdiff = diff(xcum)
xcumdiff = xcumdiff + 1
xxx = sqrt(xcumdiff)/3
y = mean(xxx)

# Ce n'est pas vraiment mieux. On ne comprend pas plus le code, le choix des noms de
# variable est difficile (manque cruel d'inspiration)

# La solution la plus élégante étant les opérateurs de piping. On lit alors le code
# comme du francais

y = x %>% cumsum %>% diff %>% add(1) %>% sqrt %>% divide_by(3) %>% mean

# ==================================
# =   Opérateur de piping double   =
# ==================================

data = data.frame(colonne1 = runif(10), colonne2 = runif(10))

data$colonne2 = sqrt(data$colonne2)

data = data.frame(colonne1 = runif(10), colonne2 = runif(10))

data$colonne2 %<>% sqrt

# ==================================
# =   Opérateur de piping de nom   =
# ==================================

data = data.frame(Parcelle = rep(1:5, 5), 
                  Hauteur  = rnorm(25, 20, 2), 
                  Diametre = runif(25, 0.5, 1), 
                  Qualite  = sample(1:5, 25, T))

# Sans pipe

data$Parcelle = as.factor(data$Parcelle)

plot(data$Hauteur, data$Diametre, col = data$Parcelle, cex = data$Qualite)

# Avec pipe

data$Parcelle %<>% as.factor

data %$% plot(Hauteur, Diametre, col = Parcelle, cex = Qualite)
