# strsplit(imdb$genre, ",")

# a<-
#   imdb %>%
#   mutate(id=1:nrow(imdb)) %>%
#   nest(-id) %>%
#   mutate(b=lapply(data,
#                   function(x)
#                     {
#                     data.frame(genero=strsplit(x$genre,","))
#               
#                   }))
imdb <- 
  imdb %>%
  mutate(id=1:nrow(imdb))

# res <- NULL
# 
# for(i in 1:nrow(imdb))
# {
#   genres <- unlist(strsplit(imdb[i,"genre"], ","))
#   new_imdb <- imdb[i,]
#   
#   data.frame(genero=strsplit(imdb[i, "gender"],","))
# }

res<- NULL
for(i in:nrow(imdb))
{
  genres <- unlist(strsplit(imdb[i, "genre"], ","))
  
  res(rbind(res,
            data.frame(genero=genres,
                       id = rep(imdb[i, "id"], length(genres))
                       )))
}

res_pivot <-
  res %>%
  mutate(dummy=1) %>%
  pivot_wider(id_cols = "id", names_from = "genero", values_from = "dummy")