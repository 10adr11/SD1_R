install.packages("readxl")

library(readxl)
pokemon = read_excel(path = "pokemon.xlsx",sheet = "pokemon")
dim(pokemon)
ncol(pokemon)
nrow(pokemon)
pokemon$is_legendary = as.factor(pokemon$is_legendary)
pokemon$generation = as.factor(pokemon$generation)
pokemon$type = as.factor(pokemon$type)
summary(pokemon)

med = median(pokemon$attack)
pokemon$attack_group = ifelse(pokemon$attack >= med, "attack+","attack-")
pokemon$attack_group = as.factor(pokemon$attack_group)
summary(pokemon$attack_group)

pokemon$water_fire = ifelse(pokemon$type %in% c("water","fire"), "yes","no")
pokemon$water_fire = as.factor(pokemon$water_fire)
summary(pokemon$water_fire)

q3_attack = quantile(pokemon$attack, probs = 0.75)
q3_defense = quantile(pokemon$defense, probs = 0.75)
q3_speed = quantile(pokemon$speed, probs = 0.75)
pokemon$best = ifelse(pokemon$attack > q3_attack &
                        pokemon$defense > q3_defense &
                        pokemon$speed > q3_speed , "yes","no")
pokemon$best = as.factor(pokemon$best)
summary(pokemon$best)



requete = subset(pokemon, is.na(weight_kg))
View(requete)

requete = subset(pokemon, !is.na(weight_kg))
View(requete)

med_weight_kg = median(pokemon$weight_kg, na.rm = TRUE)
pokemon$weight_kgNa = ifelse(is.na(pokemon$weight_kg) , 
                             med_weight_kg ,
                             pokemon$weight_kg)

med_height_m = median(pokemon$height_m, na.rm = TRUE)
pokemon$height_mNA = ifelse(is.na(pokemon$height_m) , 
                            med_height_m ,
                            pokemon$height_m)
View(pokemon)

pokemon$weight_group = cut(pokemon$weight_kg,
                           breaks = 3,
                           labels = c("léger","moyen","lourd"))

summary(pokemon$weight_group)

pokemon$height_m_group = cut(pokemon$height_m,
                             breaks = c(0,1,2,3,
                                        max(pokemon$height_m,
                                            na.rm = TRUE)))
summary(pokemon$height_m_group)


pokemon$defense_group = cut(pokemon$defense,
                            breaks = quantile(pokemon$defense,
                                              na.rm = TRUE),
                            include.lowest = TRUE)
summary(pokemon$defense_group)


aggregate(x = attack ~ type, 
          data = pokemon,
          FUN = function(x) mean(x))

aggregate(x = attack ~ generation + type,
          data = pokemon, 
          FUN = function(x) median(x))


aggregate(x = pokedex_number ~ type,
          data = pokemon,
          FUN = function(x) length(x))

aggregate(speed ~ generation + type,
          data = pokemon, 
          FUN = function(x) c(moy = mean(x),
                              med = median(x),
                              eff = length(x) ) )



