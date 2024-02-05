a=10
b=5

resultat = a*b
print(resultat)

A=7.2
B=10.1
#Il y a 4 objets

resultat = A+B
print(resultat)
#Le 2ème résultat remplace le 1er

rm(a,b,A,B,resultat,resulutat,reslutat) 


vecteur= c(1,2,3,4,5)
class(vecteur)
vecteur[3]

v1 = vecteur

v2= v1 + 3
print(v2)

v3= 1:6
v4= v3**2
v5=v4/2

jours = c("Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche")
class(jours)
jours[c(2,7)]

vf <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
class(vf)

deci = c(1.2, 2.5, 3.8, 4.1, 5.6)
class(deci)
deci[-3]

mois=c("Janvier", "Février", "Mars", "Avril", "Mai", 
        "Juin", "Juillet", "Août", "Septembre", "Octobre",
        "Novembre", "Décembre")
class(mois)
mois[c(1,2,3)]

neg=c(-1,-2,-3,-4,-5)
class(neg)
neg[c(5,1)]

fruits=c("pommme","banane","ananas","coco","cerise")
class(fruits)
fruits[-c(1,2)]


manque= c(1, 2, NA, 4, 5)
class(manque)


#Les fonctions c(), seq(), length()


sequence = seq(from=1, to= 10)
length(sequence)

ma_sequ <- seq(from = 2, to = 20, by = 2)
length(ma_sequ)

ma_se <- seq(from = 0, to = -5)
length(ma_se)

sequen <- seq(from = 5, to = 50, by = 5)
length(sequen)

ma_sequence <- seq(from = 10, to = 1, by = -1)
length(ma_sequence)

ma_sequence <- seq(from = 0, to = 1, by = 0.1)
length(ma_sequence)

ma_sequence <- seq(from = 5, to = -5, by = -1)
length(ma_sequence)

ma_sequence <- seq(from = 1, to = 10, by = 2)
length(ma_sequence)


repet=rep(3, times=5)

repett=rep(c('A','B','C'), times=3)

numb= rep(1:3 ,times=3)

vf <- rep(c(TRUE, FALSE), times = 4)


rm(list = ls())

#EX 3

alea = runif(n = 5, min = 0, max = 1)
alea
mean(alea)
median(alea)
min(alea)
max(alea)




















