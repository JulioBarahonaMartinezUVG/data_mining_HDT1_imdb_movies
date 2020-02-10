#HDT1: Analisis explorativo 

#librerias  y set up
setwd('/home/julio/Documents/Estudios/UVG/2020/Primer Semestre/Data_Mining/data_mining_HDT1_imdb_movies')

#import data
imdb_movies <- read.csv('tmdb-movies.csv', header = TRUE)
View(head(imdb_movies, 10))

summary(imdb_movies)

#1 
View(head(imdb_movies[order(imdb_movies$budget, decreasing = TRUE),"original_title"],10))

#@
