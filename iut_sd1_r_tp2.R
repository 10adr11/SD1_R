df = read.csv("L:/BUT/SD/Promo 2023/agiurgiu/R/dataset/fao.csv", header = TRUE, dec = ",", sep = ";")
nrow(df)
summary(df)
moyenne_all = mean(df$Dispo_alim)
somme = sum(df$Population,na.rm = TRUE)
ecart_import= sd(df$Import_viande,na.rm = TRUE)
ecart_export = sd(df$Export_viande,na.rm = TRUE)
median = median(df$Prod_viande,na.rm = TRUE)
quantile_ka=quantile(df$Dispo_alim,na.rm = TRUE)
centilles = quantile(df$Import_viande, probs = seq(0,1,0.1), na.rm = TRUE)

top5_moins = head(order(x=df$Population,decreasing = FALSE), 5)
resultat= df[top5_moins, ]
View(resultat)

top5= head(order(x=df$Population,decreasing = TRUE), 5)
resultat2=df[top5, ]
View(resultat2)

top5viande= head(order(x=df$Prod_viande,decreasing = TRUE), 5)
resultat3=df[top5viande, ]
View(resultat3)

top5imp_viande= head(order(x=df$Import_viande,decreasing = TRUE), 5)
resultat4=df[top5imp_viande, ]
View(resultat4)


dispall = df[df$Dispo_alim >= 2300 , ]
View(dispall)            
nrow(dispall)



gros = df[df$Dispo_alim > 3500 & df$Import_viande >= 1000, ]
View(gros)            

fretbl = df[df$Nom == "France" | df$Nom == "Belgique",  ]
View(fretbl)


port_export = df$Export_viande/df$Prod_viande
df2 = cbind(df, port_export)


dispo_alim_pays= df$Dispo_alim/365
df3 = cbind(df2, dispo_alim_pays)


write.table(x=df3, file= "")









