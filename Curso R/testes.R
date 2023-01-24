Age = c(22,25,26)
Weight = c(150,165,120)
Sex = c("M","M","F")

df = data.frame(Age,Weight,Sex)
row.names(df) = c("Sam","Frank","Amy")



is.data.frame(mtcars)

mat = matrix(1:25, nrow = 5)
mat = as.data.frame(mat)


df = mtcars
df[1:6,]
mean(df$mpg)
str(df)
summary(df)


df[df$cyl == 6,]

df[,c('am','gear','carb')]

df$performance = df$hp/df$wt
df$performance = round(df$performance, 2)

mean(subset(df, hp > 100 & wt > 2.5)$mpg)
mean(df[df$hp > 10 & df$hp > 2.5,]$mpg)
mean(df["Hornet Sportabout",]$mpg)
lista = list(1,2,3)
nomes.lista = list(primeiro =  1, segundo = 2, terceiro = 3, quarto = df) 
nomes.lista
nomes.lista$primeiro
