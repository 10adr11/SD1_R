# Créer une toile de fond vide pour le graphique
par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), ylim=c(0, 1), xlab="X", 
     ylab="Densité de probabilité", 
     main="Densités de probabilité \n de lois normales")


# Tracer la densité de probabilité pour chaque simulation
moyennes = c(0, 0, 0, -2)
sigmas = c(0.45, 1, 2.25, 0.7)
colors = c("red", "blue", "green", "orange")
legend_labels = c()
for (i in 1:length(moyennes)) {
  serie = rnorm(n = 1000, 
                mean = moyennes[i], 
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

simu = rnorm(n = 1e4, mean = 0, sd = 1)

hist(simu, main = "loi normal centrée-réduite",
     probability = TRUE, col= "orange" )
lines(density(simu), col = "blue")


median(simu)
quantile(simu)

quantile(simu, 
         probs = seq(from = 0, 
                     to = 1, by = 0.01))
quantile(serie, 
         probs = 0.95)
                
qnorm(p = 0.95, mean = 0, sd = 1)

pnorm(q = 1.644854, mean = 0, sd = 1)

qnorm(p = 0.975, mean = 0, sd = 1)

1- pnorm(q = 1.959964, mean = 0, sd = 1)


indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#on crée un vecteur vide pour ajouter les probas au fur et à mesure
all_probas = c()
#On parcourt les indices lignes
for (i in indices_lignes){
  proba = pnorm(q = i, mean = 0, sd = 1)
  #on ajoute la nouvelle proba au vecteur existant
  all_probas = c(all_probas,proba)
  all_probas = round(all_probas,digits = 4)
}


indices_colones = seq(from = 0.00, to = 0.09, by = 0.01)
indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#On crée un objet résultat vide.
resultat = NULL
#On parcourt les indices colonnes
for (j in indices_colones) {
  #on crée un vecteur vide pour ajouter les probas au fur et à mesure
  all_probas = c()
  #On parcourt les indices lignes
  for (i in indices_lignes){
    quantile = i + j
    proba = pnorm(q = quantile, mean = 0, sd = 1)
    #on ajoute la nouvelle proba au vecteur existant
    all_probas = c(all_probas,proba)
    all_probas = round(all_probas,digits = 4)
  }
  #On ajoute une colonne au resultat
  resultat = cbind(resultat,all_probas)
}

class(resultat)
table = data.frame(resultat)
colnames(table) = indices_colones
rownames(table) = indices_lignes
View(table)


moyenne=171
ecarttype=9
population=rnorm(n = 1e7,mean=moyenne, sd=ecarttype)

mean(population)
sd(population)

hist(population, col = "blue",main = "Hitograme de la taille")


taille190 = population[population < 190]
length(taille190)
length(taille190) / length(population)


pnorm(q = 190, mean=moyenne, sd=ecarttype)*1e7


taille200 = population[population > 200]
length(taille200)
length(taille200) / length(population)


inf200 = pnorm(q = 200, mean=moyenne, sd=ecarttype)
1 - inf200


tailleechantillon = 100
echantillon = sample(x = population, size = tailleechantillon, replace = TRUE)
mean(echantillon)
sd(echantillon)

largeur = qnorm(p = 0.975,mean=0,sd=1)*ecarttype/sqrt(tailleechantillon)
borne_inf = moyenne-largeur
borne_sup = moyenne+largeur


taille_ech = 100
nb_replicat = 1000
echantillons = replicate(n = nb_replicat,expr =  sample(population,taille_ech, 
                                                       replace = TRUE))

moyennes = apply(X = echantillons,
                MARGIN = 2, FUN = function(x) mean(x))
ecart_types = apply(echantillons,
                   MARGIN = 2,FUN = function(x) sd(x))


hist(moyennes, col = "pink", main = " Moyennes des échantillons")

mean(moyennes)
sd(moyennes)


moy172 = moyennes[moyennes > 172]
length(moy172)
length(moy172) / length(moyennes)

inf172 = pnorm(q = 172, 
                      mean=moyenne, sd=ecarttype/sqrt(taille_ech))

1 - inf172


largeur= apply(X = echantillons,
               MARGIN = 2,FUN = function(x) pnorm(0.975)*sd(x)/taille_ech)

borneinf = moyennes-largeur
bornesup=moyennes+largeur

resultats =  data.frame(largeur, borneinf, bornesup)


moyenne_echantillon<-function(V,n) {
  return(mean(sample(x = V,size = n, replace=TRUE)))
}

moyennes_20<-replicate(n = nb_replicat, 
                       expr = moyenne_echantillon(V = population,
                                                  n = 20))
moyennes_30<-replicate(n = nb_replicat, 
                       expr = moyenne_echantillon(V = population,
                                                  n = 30))
moyennes_50<-replicate(n = nb_replicat, 
                       expr = moyenne_echantillon(V = population,
                                                  n = 50))
moyennes_100<-replicate(n = nb_replicat, 
                        expr = moyenne_echantillon(V = population,
                                                   n = 100))
moyennes_500<-replicate(n = nb_replicat, 
                        expr = moyenne_echantillon(V = population,
                                                   n = 500))

par(mfrow=c(2,3))
hist(moyennes_20, xlim=c(161,181), main="20")
hist(moyennes_30, xlim=c(161,181), main="30")
hist(moyennes_50, xlim=c(161,181), main="50")
hist(moyennes_100, xlim=c(161,181), main="100")
hist(moyennes_500, xlim=c(161,181), main="500")

population<-runif(n = 1e7, min = 0, max = 1)
moyennes_20<-replicate(nb_replicat, moyenne_echantillon(population,20))
moyennes_30<-replicate(nb_replicat, moyenne_echantillon(population,30))
moyennes_50<-replicate(nb_replicat, moyenne_echantillon(population,50))
moyennes_100<-replicate(nb_replicat, moyenne_echantillon(population,100))
moyennes_500<-replicate(nb_replicat, moyenne_echantillon(population,500))
par(mfrow=c(2,3))
hist(moyennes_20, xlim=c(0,1), main="20")
hist(moyennes_30, xlim=c(0,1), main="30")
hist(moyennes_50, xlim=c(0,1), main="50")
hist(moyennes_100, xlim=c(0,1), main="100")
hist(moyennes_500, xlim=c(0,1), main="500")


