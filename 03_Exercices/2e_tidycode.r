# **********
# Exercice 2
# **********

rm(list=ls())

data = data.frame(experience = 1:10,
                  angle      = runif(10, 0, 90),
                  distance   = rnorm(10, 10, 1),
                  intensity  = rnorm(10, 10, 1),
                  metric1    = rnorm(10, 6, 1),
                  metric2    = rnorm(10, 5, 0.3),
                  metric3    = rnorm(10, 5, 0.1))



# Pour chaque metrique il faut normaliser la valeur en fonction de l'intensité émise
# de l'angle d'incidence et de la distance

# x = x *  ( (distance * cos(angle)) / distance_ref)  / intensity

data$nmetric1 = data$metric1 * (data$distance * cos(data$angle*pi/180)) / 10 / data$intensity
data$nmetric2 = data$metric2 * (data$distance * cos(data$angle*pi/180)) / 10 / data$intensity
data$nmetric3 = data$metric3 * (data$distance * cos(data$angle*pi/180)) / 10 / data$intensity

# Réécrivez un code lisible comme un roman.

# Error: pas de solution encore
