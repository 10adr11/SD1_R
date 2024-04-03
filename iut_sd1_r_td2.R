setwd(dir = "L:/BUT/SD/Promo 2023/agiurgiu/R/dataset")
getwd()
bodies_karts = read.csv(file = "bodies_karts.csv", header = TRUE, sep = ";", dec = ",")
drivers = read.csv(file = "drivers.csv", header = TRUE, sep = ";", dec = ",")
gliders = read.csv(file = "gliders.csv", header = TRUE, sep = "|", dec = ".")
tires = read.csv(file = "tires.csv", header = TRUE, sep = "\t", dec = ",")

dim(bodies_karts)
dim(tires)
dim(gliders)
dim(drivers)

summary(bodies_karts)
summary(tires)
summary(gliders)
summary(drivers)

plot(x = drivers$Weight, y = drivers$Acceleration, main = "drivers : Weight / Acceleration")

cor(x = drivers$Weight, y = drivers$Acceleration)

'Vérifier ce résultat en calculant vous même le coéfficient de corrélation.'
covXY = cov(x = drivers$Weight,
            y = drivers$Acceleration)
sX = sd(drivers$Weight)
sY = sd(drivers$Acceleration)
print(covXY / (sX*sY))

'Calculer le coefficient de détermination de cette même relation.'
coefCorr = cor(x = drivers$Weight,
               y = drivers$Acceleration)
coefDeter = coefCorr^2
print(coefDeter)


matriceCor = cor(drivers[ , - 1])
matriceCor = round(matriceCor , 2)
View(matriceCor)


install.packages("corrplot")

library(corrplot)
corrplot(matriceCor, method="circle")



matriceCor = round(cor(tires[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust")

matriceCor = round(cor(drivers[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust")

matriceCor = round(cor(bodies_karts[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust")







