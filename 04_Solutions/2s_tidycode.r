rm(list=ls())
# **********
# Exercice 1
# **********

data = data.frame(experience = 1:10,
                  angle      = runif(10, 0, 90),
                  distance   = rnorm(10, 10, 1),
                  intensity  = rnorm(10, 10, 1),
                  metric1    = rnorm(10, 6, 1),
                  metric2    = rnorm(10, 5, 0.3),
                  metric3    = rnorm(10, 5, 0.1))


library(magrittr)

# Je crée une fonction deg2rad pour convertir de degrés vers radian. Dans le code, lire
# deg2rad sera plus facilement compréhensible que *pi/180. Ici on peut dire que *pi/180 est 
# évident mais dans le cas général c'est toujours mieux de créer une fonction lisible.

deg2rad = function(x) 
{ 
  return(x*pi/180) 
}

# Finalement normaliser la mesure c'est simplement multiplier par un facteur de correction
# je créé donc une fonction pour calculer un facteur de correction

correction = function(angle, dist, intensity, dist_ref)
{
  angle = deg2rad(angle)
  factor = dist * cos(angle) / dist_ref / intensity
  return(factor)
}

# Finalement je crée une fonction normalize pour normaliser mes données 

normalize = function(data, field, distance_ref)
{
  x = data[, field] 
  factor = data %$% correction(angle, distance, intensity, distance_ref)
  return (x*factor)
}

# J'applique mes fonctions sur mes données

distance_ref = 10

data$nmetric1 = normalize(data, "metric1", distance_ref)
data$nmetric2 = normalize(data, "metric2", distance_ref)
data$nmetric3 = normalize(data, "metric3", distance_ref)

# Certes le code est plus long mais:
# - bien plus lisible pour vous et vos collaborateurs
# - bien plus facile à debugger
# - ce n'est qu'un mini mini exemple. Ici on peut trouver cela compliqué pour rien
#   mais dans le cadre d'un vrai code la discussion n'a pas lieue d'être.