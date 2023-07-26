library(ggplot2)
library(plotly)


# Just to remember the structure of the diamonds dataset
head(diamonds)

p <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
p

p <- ggplot(diamonds, aes(x=carat, y=price)) + geom_hex(bins=200)
p

# Using the plotly library through ggplotly()
p <- ggplot(diamonds, aes(x=carat, y=price)) + geom_hex(bins=40) #diminuio o número de hexagónos
ggplotly(p)

# applying a log to carats and price
p <- ggplot(diamonds, aes(x=log(carat), y=log(price))) + geom_hex(bins=80)
ggplotly(p) 

p <- ggplot(diamonds, aes(x=log(price), color=clarity)) +
geom_freqpoly() # não são linhas sã opoligonos, à zonas de vértices que não são pontos ... e posso desligar os poligonos, 2 labels comparas intertseries
geom_histogram()
ggplotly(p) 

# Visualizing the density (estimated) of points in each bin
# As density is a proportion, rather than a count, it is possible to compare
# different series
p <- ggplot(diamonds, aes(x=log(price), color=clarity)) +
     geom_freqpoly(stat="density") # default is stat="bin"
ggplotly(p) # gráfico de densidade de ponto, diferente para a coloração amarela nota-se bem

p <- ggplot(diamonds, aes(x=log(price), color=clarity)) +
    geom_freqpoly() +
    facet_wrap(.~cut)
ggplotly(p) # várias variações de cut que se tem nos dados!

# another example using the uspopage dataset
library(gcookbook)
library(scales)

head(uspopage,10)

p <- ggplot(uspopage, aes(x=Year, y= Thousands, fill=AgeGroup)) +
    geom_area(color="black", size=0.5, alpha=0.4) +
    scale_fill_brewer(palette="Blues", breaks=levels(uspopage$AgeGroup)) +
    scale_y_continuous(labels = comma)
p

# and now with interactivity using javascript through plotly
ggplotly(p) # com plotly faz ficarem interativos e dá para remover series

