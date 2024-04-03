setwd("L:/BUT/SD/Promo 2023/agiurgiu/R/nba")
getwd()

fichiers = list.files(path = getwd(),
                       pattern = ".csv$",
                       full.names = TRUE)

library(tools)
print(fichiers[1])
nom_fichier = basename(path = fichiers[1])
nom_fichier_sans_csv = file_path_sans_ext(x = nom_fichier)
print(nom_fichier_sans_csv)


assign(x = nom_fichier_sans_csv, 
       value = read.csv(fichiers[1],
                        sep = ",",
                        dec = "."))



for (fichier in fichiers) {
  nom_objet = file_path_sans_ext(basename(fichier))
  
 
  start_time = Sys.time()
  assign(nom_objet, read.csv(fichier, 
                             sep = ",",
                             dec = "."))
  end_time = Sys.time()
  execution_time = end_time - start_time
  cat("Importation : ",nom_objet, "=" , execution_time , "\n")
}



df_x = subset(team, city == "Los Angeles", select = c("id", "city"))
df_y = subset(game, select = c("game_id", "team_id_home"))
dfJoin = merge (df_x , df_y, by.x = "id",  by.y = "team_id_home", all.x = TRUE )
View(dfJoin)


df_x = dfJoin
df_y = subset(game_info, select = c("game_id", "attendance"))
dfJoin = merge(x = df_x, y = df_y, 
               by = "game_id",
               all.x = TRUE)
mean(dfJoin$attendance, na.rm = TRUE)
View(dfJoin)


df_x = subset(game_summary, season == 2020,
              select = c("game_id", "season"))
dfJoin = merge(x = df_x, y = officials, 
               by = "game_id",
               all.x = TRUE)
length(unique(dfJoin$official_id))
View(dfJoin)

df_x = subset(game_summary,
              select = c("game_id", "season"))
df_y = subset(officials, first_name == "Dick" & last_name == "Bavetta")
dfJoin = merge(x = df_x, y = df_y, 
               by = "game_id",
               all.y = TRUE)
View(dfJoin)
table(dfJoin$season)


install.packages("dbi")
















