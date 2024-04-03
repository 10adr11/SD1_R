#EX1

df = read.csv(file = "L:/BUT/SD/Promo 2023/agiurgiu/R/dataset/NBA2014_2015.csv", sep = ",",
               header = TRUE, dec = ".")
nrow(df)
ncol(df)
colnames(df)

df$PERIOD = as.factor(df$PERIOD)
df$PTS_TYPE = as.factor(df$PTS_TYPE)
df$SHOOTER = as.factor(df$SHOOTER)

#EX2

length(levels(df$PERIOD))
length(df$PTSTYPE)
length(df$SHOTER)
summary(df)
sd(df$SHOT_DIST)
sd(df$SHOT_CLOCK, na.rm = TRUE) #ajouter le na.rm
     
#combien de tirs manqués/réussis
table(df[ "SHOT_RESULTS" , ])
#les quartiles
quartiles_SHOT_CLOCK = quantile(df$SHOT_CLOCK, probs = c(0.25, 0.5, 0.75), na.rm = TRUE )
print(quartiles_SHOT_CLOCK)
#les déciles
deciles_CLOSE_DIST = quantile(df$CLOSE_DEF_DIST, probs = seq(0, 1, by = 0.1), na.rm= TRUE)
print(deciles_CLOSE_DIST)


#nombre de matches différents
liste_game = unique(df$GAME_ID)
length(liste_game)

#nombre de joueurs différents
df$SHOOTER = as.factor(df$SHOOTER)
nlevels(df$SHOOTER)

       
#conversion de la variable SHOT_DIST en mètre pour que les européens comprennent nos chiffres
df$SHOT_DIST = df$SHOT_DIST * 0.30

#nombre de points qu'a rapporté la tentative (0,2 ou 3) 
df$PTS_MARQUES = ifelse(df$SHOT_RESULT == "made", df$PTS_TYPE, 0)

#On supprime la variable GAME_RESULT car elle n'est pas utile
df$GAME_RESULT = NULL
       
#création d'un objet sans la première colonne GAME_ID
df2 = df[, -1]
       
    
#EX3

   
#Les 100 tirs réussis ou manqués les plus loin
rang = order(df$SHOT_DIST, decreasing = FALSE)
df3 = df[rang,]
df3 = df[ 1 : 100 , ]

#Les 100 tirs réussis les plus loin
df4 = subset(df3, SHOT_RESULT = "made")
df4 = df[ 1 : 100 , ]

#Combien de tirs à 3 points a réussi Kobe Bryant ?
df_kobe = subset(df,SHOT_RESULT == "made" &
                   PTS_TYPE == 3 & 
                   SHOOTER == "kobe bryant")

dim(df_kobe)

#Le TOP5 des joueurs qui ont marqués le plus de points dans la saison
df_total = aggregate(PTS_MARQUES ~ SHOOTER, data = df, FUN = "sum")
df_total_tri = df_total[order(df_total$PTS_MARQUES, decreasing = TRUE),]
df_top5 =  df_total_tri[  1:5  ,  ]


#Des graphiques adaptés selon le type de variable

#construction de la fonction
build_graph = function(une_colonne, nom_colonne) {
  if(is.numeric(une_colonne)) {
    print(boxplot(une_colonne, main = nom_colonne))
  }
  if (as.factor(une_colonne)) {
    tri = table(une_colonne)
    print(barplot(tri, main = nom_colonne))
}
  
  #on déroule la fonction sur chaque colonne du data frame.
  
  for (colonne in colnames(df) {
    build_graph(une_colonne = df[colonne , ] , nom_colonne = colone)
  }
}




















