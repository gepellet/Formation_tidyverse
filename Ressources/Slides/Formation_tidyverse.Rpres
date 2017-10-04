Formation R - tidyverve et bonne pratiques de programmation
========================================================
author: Jean-Romain Roussel
date: 24 Ocobre 2017
autosize: true

Pourquoi apprendre à utiliser les package du tidyverse ? 
========================================================

### Pour ne pas voir ca

```r
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
```

- Ce code prend 1h30 de calcul
- Ce code m'a prit 2h à comprendre
- Ce code a sûrement prit 1 journée à écrire.

Pourquoi apprendre à utiliser les package du tidyverse ? 
========================================================

### Mais pour voir ca

```r
calcul_angles = function(azimuts)
{
	n = length(azimuts)
	angles = lead(azimuts) - azimuts
	angles[n] = 360 - azimuts[n] + azimuts[1]
	return(angles)
}


data %>% group_by(num_UC) %>% mutate(angles = calcul_angles(Azimut))
```

- Ce code prend 1 seconde de calcul
- Ce code m'a prit 5 minutes à écrire.
- Ce code est parfaitement lisible

Plan 
========================================================


## Avant propos - informatique

- Pourquoi certain script sont exessivement lent
- R est un language vectoriel
- R est un langague interprété
- tidyverse permet de faire de la programmation vectorielle simplement

## Premiere partie - tidyr

- Utiliser des données correctement structurées
- Restructurer correctement des données mal structurées
   - gather/spread
   - separate/units

## Deuxième partie - magrittr et fonction

- Opérateur de piping
- Élégance du code / lisibilité
- Fonctions

## Troisième partie - dyplr

- filter summarise mutate
- Aggregation de données
  - group_by + summarise
- Modification par groupe
  - group_by + mutate
- Jointures
