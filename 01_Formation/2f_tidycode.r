library(magrittr)

# ==============================================================================
# =                                                                            =
# =                   THEME 2 : MAGRITTR ET FONCTION                           =
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


# ==================================
# =      Ecrivez des fonctions     =
# ==================================

# Ecrivez votre code comme si il devait être lu comme du francais (de l'anglais plutôt).
# Ecrivez votre code comme pour être lu par un autre que vous
# Et oui, un bon code peut être lu (presque) comme un livre.

# Comparez ce code 

for(i in unique(test4$num_UC))
{ 
  for (j in 1:max(test4[test4$num_UC==i,]$num_branch_azi,na.rm=T))
  {
    ifelse(j != max(test4[test4$num_UC==i,]$num_branch_azi,na.rm=T),
    {
      test4[test4$num_UC==i & test4$num_branch_azi==j,]$angle <-test4[test4$num_UC==i & test4$num_branch_azi==j+1,]$Azimut - test4[test4$num_UC==i & test4$num_branch_azi==j,]$Azimut
    },{
      test4[test4$num_UC==i & test4$num_branch_azi==j,]$angle <-360 - test4[test4$num_UC==i & test4$num_branch_azi==j,]$Azimut + test4[test4$num_UC==i & test4$num_branch_azi==1,]$Azimut
    })
  }
}

# Et ce code 

calcul_angles = function(azimuts)
{
  n = length(azimuts)
  angles = lead(azimuts) - azimuts
  angles[n] = 360 - azimuts[n] + azimuts[1]
  return(angles)
}

test4 %>% group_by(num_UC) %>% mutate(angles = calcul_angles(Azimut))

# Quelle difference principale ? (Hormis l'utilisation de dplyr que nous verrons tantôt)


# Créez des fonctions pour:
# - ne pas se répéter
# - simplifier la lecture du code
# - debugger plus facilement
