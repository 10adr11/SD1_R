df = read.csv(file = "L:/BUT/SD/Promo 2023/agiurgiu/R/velov.csv",
              header = TRUE,
              sep = ";", 
              dec = "," )
summary(df)
df$statuts = as.factor(df$status)

df$CodePostal = as.factor(df$CodePostal)


df$bornes = ifelse(df$capacity != (df$bikes + df$stands), "KO" , "OK")
table(df$bornes)

histo = hist(x = df$capacity, main = "Capacité des bornes", col = "red", xlab = "Capacité", probability = TRUE, ylim = c(0,0.1))
abline(h=100, col = "blue", lty = 6)
lines(x = density(df$capacity), col = "blue", lwd = 2)

boxplot(x = df$capacity, main = "Capacité des bornes", outline = FALSE)
points(x = mean(df$capacity), pch = 15, col = "red", cex = 2)

par(mfrow=c(1,2)) #fenêtre sur 1 ligne et 2 colonnes
#7ème
df7 = subset(df, CodePostal == "69007")
boxplot(x = df7$bikes, 
        main = "Boxplot nb vélos \n 69007",
        ylim = c(0,40))
#8ème
df8 = subset(df, CodePostal == "69008")
boxplot(x = df8$bikes, 
        main = "Boxplot nb vélos \n 69008",
        ylim = c(0,40))

par(mfrow=c(1,1)) #fenêtre sur 1 ligne et 1 colonne
# Tracer le graphique boxplot
boxplot(formula = bikes ~ bonus,
        data = df, 
        main = "Dispo vélos vs Stations Bonus")

points(x = tapply(X = df$capacity, INDEX = df$bonus, FUN = mean), pch = 11, cex = 5)


effectif = table(df$bonus)
freq = prop.table(x = effectif)
barplot(height = freq,
        main = "Répartition du nombre \n de station bonus", horiz = TRUE, xlim = c(0,0.03))

effectif = table(df$banking, df$bonus)
barplot(height = effectif, main = "Titre", xlab = "Bonus", ylab = "Terminal de paiement", ylim = c(0,0.025))

#Calcul des pourcentages
frequence = prop.table(x = effectif, margin = 2)
barplot(height = frequence,
        main = "Bonus vs Banking",
        xlab = "Station Bonus ?",
        col = c("red","green"), beside = TRUE)

#Préparer les labels
legend_labels <- colnames(frequence)
#Ajouter une légende
legend(x = "topright", 
       legend = legend_labels, 
       fill  = c("red","green"))

#Afficher les fréquences pour vérifier le graphique
print(frequence)


pie(x = effectif, main = "Titre du camembert", col = c("yellow", "green"))

etiquette = paste(rownames(effectif),"\n",effectif)
pie(x = effectif,
    main = "Répartition du nombre \n de station bonus",
    col = c("yellow","green"),
    labels = etiquette)

install.packages('leaflet')
install.packages('dplyr')
install.packages('ggplot2')
# Librairies nécessaires
library(leaflet)
library(dplyr)
library(ggplot2)

# Créer une carte Leaflet
maCarte <- leaflet(df) %>% 
  addTiles() %>% 
  addMarkers(~position_longitude, 
             ~position_latitude, 
             popup = ~address)

# Afficher la carte
maCarte

