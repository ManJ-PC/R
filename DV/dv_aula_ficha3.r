library(ggplot2)
library(gcookbook)


# Visualize as primeiras 10 observações do dataset diamonds
head(diamonds, 10)


# 2. Crie um gráfico de barras para mostrar o número de observações para cada carat (quilate)
# ggplot2(aes(x=))
# ggplot(loanData, aes(factor(loanData$saving_status),fill = loanData$class)) +
#   geom_bar(stat="count", position = "dodge") + 
#   scale_fill_brewer(palette = "Set1"

sp <- ggplot(diamonds, aes(x=carat))

library(scales)



                    
ggplot(diamonds, aes(x=carat, width=0.2)) + 
  geom_bar(stat="identity", position="identity", color="grey") + 
  xlab("quilates") +
  ylab("number_occorences") +
  ggtitle("Number diamonds by carat")                 

# Ex. 3.2

ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point() +
  scale_y_continuous(labels = comma) # temos mais que uma amostra



ggplot(ds, aes(x=carat, y= price, fill=cut)) +
  geom_violin() + 
  scale_color)cut, filled.contour() cut(())