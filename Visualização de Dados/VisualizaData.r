install.packages("readxl")
library("readxl")

my_data <- read_excel("H:\\Xpto\\Documents\\GitHub\\R\\Visualização de Dados\\DataPanel_World_Hapiness_Report_2021C2.xlsx")
# world hapinness report


#a) Comparar com outros países e ver se está a aumentar ou a diminuir...

# a distribuição do CO2 em várias componentes, fazer gráficos em stack, já no R
# Visualizações para responderem a perguntas!


# valores
# string, numéricos decimais, não muito grandes, inferiores a 1

# não vamos inventar.., 
# 1 ou dois casos, vams fazer uma importação de valoreres (interpolação ou outro )
# não prever com dados futuros é um erro...
# não temos infromação sobre isso.. métodos entre todos (contexto do problema.. (repetição do último)) não temos o dado em cima....
# fazes yoga, a felicidade está aumentar ...

# a felicidade está a aumentar?
#   grafico e um pais em ordem ao tempo
# 
# comparar médiasa (à bruta)
# 
# correlação (a felicidade está relacionada c/ o PIB
#             
# 4) Países + Felizes são + generosos?


#GGPLOT(DATASET, AES)

head(iris, n=3)

# slide 5 ---
library(ggplot2) 

#Canvas é a tela onde os artistas pitam

# comando básico
ggplot(iris, aes(x=Sepal.Length, y= Sepal.Width)) # até aqui é p canvas...
p1 <- ggplot(iris, aes(x=Sepal.Length, y= Sepal.Width)) + geom_point(size=3, aes(color=Species, shape=Species))



pdf("ggplots.pdf")
print(p1)

dev.off() # transformada do coseno e , perde qualidade sem notar... e 

p <- ggplot(iris, aes(X=Sapal_Length))

ggsave("myPlot.pdf", p1)
# posso associar um gráfico completo a uma variável..,
# Palete a usar.., 



# GGPlot deve-se escrever em primeiro lugar

#podemos tirá-la com constante à legenda

#labs é de labels e não laboratórios..



# 2 tipos cor, dentro e fora depois do 21

# definido alguns parâmetros
ggplot(iris, ars)


head(df, 4)
theme_set(
  theme_bw() + 
    theme(legend.position = "top"))

df <- mtcars
# create the canvas
p <- ggplot(df, aes(x=wt, y=mpg)) # erro --

p + geom_point(color="#FF2255", size = 3, shape=23)
# p + geom_point(aes)

p + geom_point() + geom_smooth(se = FALSE)
p + geom_point() + geom_smooth()
p + geom_point() + geom_smooth(method='lm')

# mudar cor dos pontos por grupos
# p + geom_point(aes(color=cyl, shape=cyl)) +
#   geom_smooth(aes(color=cyl, fill = cyl), method='lm') errro

p +geom_point() + geom_rug()

# p + geom_point(aes(color=cyl))


# plotly, gráfico do país ...

# O plano é GGPLOT chaegar ao PLOTLY (c/ interatividade)

#-> PLOT_LY("MAGIA") " Vai escolher automáticamente -> e pode ser colocado automaticamente no (botões.. caixa de escolha etc) SHINY (DASHBOARDS)

#Caminho linear que não complica mto..

# shyny funciona em sistemas clientes servidor!

# se está do lado do servidor ou do cliene e obter o shiny na nossa apresentação, usando o .. RStudio ou em página Wev
# ou janela do shiny ou browser, utilizando o site do shiny...

# shiny gera, html, css e javascript é possível hackear..