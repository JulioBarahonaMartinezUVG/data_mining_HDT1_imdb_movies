#HDT1: Analisis explorativo 

#librerias  y set up
if (!require("dplyr"))    {install.packages("dplyr");   library("dplyr")}
if (!require("lubridate"))    {install.packages("lubridate");   library("lubridate")}
setwd('/home/julio/Documents/Estudios/UVG/2020/Primer Semestre/Data_Mining/data_mining_HDT1_imdb_movies')

#import data
imdb_movies <- read.csv('tmdb-movies.csv', header = TRUE)
View(head(imdb_movies, 10))

summary(imdb_movies) 

#1 
View(head(imdb_movies[order(imdb_movies$budget, decreasing = TRUE),"original_title"],10))

#2

#
(head(imdb_movies[order(imdb_movies$vote_average, imdb_movies$vote_count,  decreasing = FALSE),"original_title"],1))

#m
res <- cor(select_if(imdb_movies, is.numeric))
res["popularity","revenue"]

#l : asociaciond e meses con lanzamientos
imdb_movies$release_date <- as.Date(imdb_movies$release_date)
imdb_movies <- imdb_movies %>% dplyr::mutate(year = lubridate::year(release_date), 
                month = lubridate::month(release_date), 
                day = lubridate::day(release_date))
earning <- aggregate(imdb_movies$revenue, by=list(month=imdb_movies$month), FUN=sum)
res <- cor(earning)
res["month","x"]  


#¿En qué meses se han visto los lanzamientos máximos?
#group by month, best average sort
topMonth <- imdb_movies %>% 
  group_by(month) %>% 
  summarise(meanPopMonth = mean(popularity)) %>%
  arrange(desc(meanPopMonth))
head(topMonth, 1)  

  
best <- imdb_movies %>% arrange(desc(month, revenue, popularity))
earning <- aggregate(imdb_movies$revenue, by=list(month=imdb_movies$month), FUN=mean)
View(best)
