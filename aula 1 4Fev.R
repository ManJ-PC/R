dados <- c(3,7,8)
dados <- rnorm(100)
mean(dados)
#?mean ?hist  ?rnorm
hist(dados, main = "Histograma da Variável Dados", freq = FALSE) #paste("Histograma of", dados))#)
density(dados)
rug(dados)
?hist

plot(density(dados))


# x <- c(0:10, 50)
# xm <- mean(x)
# c(xm, mean(x, trim = 0.10))
