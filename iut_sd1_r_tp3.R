Modifier votre dossier de travail avec la fonction adaptée
Correction
setwd("C:/Users/Anthony/Documents/asardell/TP3")
Importer le jeu de données dans un objet appelé df. La réponse à cette question vous sera donnée à 14h dans le même dossier que le jeu de données.
Correction
df = read.csv(file = "quiz.csv", sep = "\t", dec = ",")
Combien y a-t-il détudiants ?
Correction
nrow(df)
Combien y a-t-il de colonnes ?
Correction
ncol(df)
Calculer un résumé des données afin de vérifier si les variables ont le bon type. On remarque des valeurs manquantes dans le jeu de données.
Correction
summary(df)
On veut analyser les variables qualitatives en classe factor. Convertir les variables Identifiant, TDet TPen type factor. Vérifiez ensuite si les variables ont la bonne classe.
Correction
df$Identifiant <- as.factor(df$Identifiant)
df$TD <- as.factor(df$TD)
df$TP <- as.factor(df$TP)
class(df$Identifiant)
class(df$TD)
class(df$TP)

Calculer la moyenne de chaque quiz. Quel est le quiz avec la moyenne la plus haute ?
  Correction
mean(df$Quiz1, na.rm = TRUE)
mean(df$Quiz2, na.rm = TRUE)
mean(df$Quiz3, na.rm = TRUE)
#meilleur moyenne sur le quiz1
Calculer la note maximale du Quiz3.
Correction
max(df$Quiz3, na.rm = TRUE)
Calculer la médiane du Quiz2. Que signifie cette valeur médiane par rapport à la moyenne ?
  Correction
median(df$Quiz2, na.rm = TRUE)
#50% ont plus de 11.05/20
Calculer les déciles du Quiz3. Quel pourcentage d'étudiant a eu 11 ou plus ?
Correction
quantile(df$Quiz3, probs = seq(from = 0.1,
                               to = 0.9, 
                               by =0.1), 
         na.rm = TRUE)
#40% ont eu 11 ou plus.
Calculez l'écart-type pour chaque quiz. Qu'est ce qu'on peut dire sur les résultats ?
  Correction
sd(df$Quiz1, na.rm = TRUE)
sd(df$Quiz2, na.rm = TRUE)
sd(df$Quiz3, na.rm = TRUE)
#notes plus homogènes sur le quiz1 et le plus hétérogènes sur le quiz2
Calculer la réparation en effectif du nombre d'étudiant par groupe de TP. Dans quel groupe ya t-il le moins d'étudiant ?
  Correction
table(df$TP)
#le groupe de TP 22
Calculer cette répartition en pourcentage en arrondissant avec deux décimales
Correction
round(prop.table(table(df$TP)), digits = 2)