library(ggplot2)
library(gcookbook)

# the diamonds dataset is huge
head(diamonds)

# 1 carat = 200 milligrams
# Prepare dataset for a scatter plot
sp <- ggplot(diamonds, aes(x=carat, y=price))
sp

sp + geom_point()
# It displays about 54000 points

# Since the display is over plotted (cluttered) it is impossible to get
# a sense of relative density of points in certain areas

# -- Alpha --
# We will make the points semitransparent (90% transparent - alpha=0.1)
sp + geom_point(alpha=0.1)

# Now, make them even more transparent (99% transparent - alpha=0.01)
sp + geom_point(alpha=0.01)

# We observe the tendency for round values of carats - indicating that
# diamonds tend to be cut to those sizes


# -- BIN2D --
# Let's try a another solution: binning the points into rectangles
# this function divides the space (x and y) into 30 groups
# in a total of 900 bins (30x30)
sp + stat_bin2d()

# Substituiu ponto por densidade de pontos..., a cor deve-se à qtdd de pontos que existe lá dentro!
# but we can make it different - more bins
# and a gradient filling
sp + stat_bin2d(bins=50) +
  scale_fill_gradient(low="lightblue", high="darkblue", limits=c(0,6000))


# -- HEXBIN --
# Now we try with another shape for the bins - hexagons instead of rectangles
library(hexbin) #pontos equidistantes

sp + stat_binhex(bins=60) +
  scale_fill_gradient(low="lightblue", high="darkblue", limits=c(0,6000))

# establishing breaks in the scale
sp + stat_binhex(bins=60) +
  scale_fill_gradient(low="lightblue", high="red", limits=c(0,6000),
                      breaks=c(0,500,1000,2000,4000,6000)) # auxilia melhor ao olho o número de pontos que contrastam..

#4.2


geom_violin() +
scale_fill_brewer((palette="Blues", direction=-1))

# 5.1
ds1 <- subset(diamonds, clarity == 'IF' & cut == 'Ideal')

#Ex. 2
ds2 <- subset(diamonds, carat >1)

#5.3
ds3 <- subset(diamonds , color == 'J')


#5.4
ds1$Subset <- "IF-Ideal"
ds2$Subset <- "Heavy"
ds3$Subset <- "Color-J"


# rbind(data, dataset por adiante)


#5.5
combined <-rbind(ds1, ds2, ds3)


#5.6
ggplot(combined, aes(x=carat, y=price, color=Subset)) + 
  geom_point() +
  labs(x="Carats", y="Price",
       title="Scatter plot: Price vs Carats")
  ##
## Overplotting within discrete categories


#6.1
ggplot(combined, aes(x=price)) +
  geom_histogram(bins=50, fill="cyan", color='black')+
  labs(x="Price", y="Count",
       title="Histogram of Diamond Prices")

#6.2
ggplot(combined, aes(x=price)) +
  geom_histogram(binwidth=400, fill="cyan", color='black')+
  labs(x="Price", y="Count",
       title="Histogram of Diamond Prices") # Notas bins= 20 ou binwidth a ser 1

# Ex.7


ggplot(diamonds, aes(x=cut, y=price)) +
  geom_boxplot() +
  labs(x="Cut", y="Price",
       title="Boxplots of Price by Cut")
       
# Ex.8
library(gridExtra)

# create the scatter plot
sp <- ggplot(diamonds, aes(x=carat, y = price, color=clarity)) +
  geom_point(alpha=0.6) +
  labs(x="Carat", y="Price", 
  title="Scatterplot of Price vs Carat", color="Clarity")
  
bp <- ggplot(diamonds, aes(x=cut, y=price, fill=cut)) +
  geom_boxplot() + 
  labs(x="Cut", y="Price",
       title="Boxplot of Price by Cut")

grid.arrange(sp, bp, ncol=2)

# Let's pick another dataset
head(ChickWeight) # tamanho (peso) das aves
str(ChickWeight)

sp1 <- ggplot(ChickWeight, aes(x=Time, y=weight))
sp1 + geom_point()

# To better understand the cluttering in the columns we will "shake" the points (jitter)

sp1 + geom_point(position="jitter") # não apresentar assim os gráficos...finais... só para intermédio, dar uma intuição

# which is quite similar to
sp1 + geom_jitter()

# we can make them jitter horizontally
sp1 + geom_point(position=position_jitter(width=0.3, height=0))

# When data has one discrete axis and one continuous axis
# it might make sense to use boxplots
sp1 + geom_boxplot(aes(x=factor(Time), y=weight))


sp1 + geom_boxplot(aes(group=Time)

# se houver .. poucas observações para uma variável... as formas 
# For the sake of curiosity let's check the geom_violin()
sp1 + geom_violin(aes(group=Time))
