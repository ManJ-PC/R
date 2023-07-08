library(ggplot2)
library(gcookbook)


# a very simple dataset
BOD

ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + geom_point()

# Let's make Time a factor
BOD1 <- BOD
BOD1$Time <- factor(BOD$Time)
BOD1

#####

library(ggplot2)

# # Criando um conjunto de dados fictício ChatGPT
# dados <- data.frame(altura = c(160, 165, 170, 175, 180),
#                     peso = c(60, 65, 70, 75, 80))
# 
# # Criando o gráfico usando ggplot2
# ggplot(data = dados, aes(x = altura, y = peso)) +
#   geom_point() + geom_line()


####

# When the x variable is a factor we need to tell ggplot how to group the points
# Use aes(group=...) to ensure ggplot() knows which data points belong together
# (to same group) and that should connected by a line
ggplot(BOD1, aes(x=Time, y=demand, group="xpto")) +
  geom_line() + geom_point()

# Use ylim() to begin Y axis from 0
ggplot(BOD1, aes(x=Time, y=demand, group=1)) +
  geom_line() + geom_point() + ylim(0, max(BOD$demand))




##
## Another dataset..
head(ToothGrowth,35) # 10 guinea pigs * 3 Vitamin C dosage levels (0.5, 1, 2) * 2 delevery methods (orange juice or ascorbic acid)

library(plyr) # so we can use ddply() to create the example dataset

# Use ddply to split data, apply function and then combine in a new column
# 'length' is the new column
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len)) #tipo group by do python: 
# Ele agrupa os dados pelas colunas "supp" e "dose" e calcula a média do comprimento ("len") para cada grupo
# We are combining *all* supp with *all* dose, and in each case using
# the mean of the length

tg

ggplot(tg, aes(x=dose, y=length, color=supp)) + geom_line()

# we may also want to convert the "dose" to a factor ("categorical variable")
# notice the group=supp to give information on how to group the data
ggplot(tg, aes(x=factor(dose), y=length, color=supp, group=supp)) +
  geom_line() # supp is feature column, supplement type (VC or OJ), ascorbic acid or orange juice ,  
# ascorbic acid is (actually synthetic / the purest form of) vitamin C
# The term "VC" is often used as an abbreviation to denote ascorbic acid, which is another name for vitamin C

# will draw separate lines for each unique combination of the supp variable
# while using the same color mapping specified by the color aesthetic.


# Notice what happens if we do not group:
ggplot(tg, aes(x=dose, y=length)) + geom_line()

# this problem happened because there are multiple points at each y location

# Playing with markers...
ggplot(tg, aes(x=factor(dose), y=length, shape=supp, group=supp)) +
  geom_line() + geom_point(size=4)

# using a unique shape and fill it according to variable values
# (must be a categorical variable)
ggplot(tg, aes(x=factor(dose), y=length, fill=supp, group=supp)) +
  geom_line() + geom_point(size=5, shape=23)


# IMPORTANT: points should be drawn after lines, so they stay on the top layer

##
## New dataset 
## sunspot.year is a time series dataset (not a data.frame)
str(sunspot.year)
sunspot.year

# Create a data.frame from a time series
sunspotyear <- data.frame(
  year = as.numeric(time(sunspot.year)) ,
  sunspots = as.numeric(sunspot.year)
)
sunspotyear

# We now will use geom_area 
ggplot(sunspotyear, aes(x=year, y=sunspots)) + geom_area()

# alpha is the transparency of the filled region (the smaller, the more transparent)
ggplot(sunspotyear, aes(x=year, y=sunspots)) +
  geom_area(color="black", fill="blue", alpha=0.1)

ggplot(sunspotyear, aes(x=year, y=sunspots)) +
  geom_area(fill="green", alpha=0.2) + geom_line()



## Let's now use the USPOPAGE
##
head(uspopage,15)

library(scales) # to avoid scientific numbers on the axis : scale_y_continuous(labels = comma)

ggplot(uspopage, aes(x=Year, y= Thousands, fill=AgeGroup)) +
  geom_area() +
  scale_y_continuous(labels = comma) # to use normal number in y axis


# change palette to a range of blues, add thin lines between areas
# and use some transparency
ggplot(uspopage, aes(x=Year, y= Thousands, fill=AgeGroup)) +
  geom_area(color="black", size=0.2, alpha=0.72) +
  scale_fill_brewer(palette="Blues") +
  scale_y_continuous(labels = comma)


# BTW, let's see the R palettes ----------
library(RColorBrewer)

display.brewer.all()
display.brewer.all(colorblindFriendly=TRUE)

# Get 8 colors (max) from palette Dark2
display.brewer.pal(n=8, name="Dark2")

# To get the colors
brewer.pal(n=8, name="Dark2")

# ----------------------------------------

# first, create a modified dataset to include the proportional field
uspopage_prop <- ddply(uspopage, "Year", transform,
                       Percent = Thousands / sum(Thousands) * 100)

head(uspopage_prop,10)

ggplot(uspopage_prop, aes(x=Year, y=Percent, fill=AgeGroup)) +
  geom_area(color="black", size=.3, alpha=.4) +
  scale_fill_brewer(palette="Blues")


## Finally, let0s see one more dataset
# Climate dataset
head(climate)

# Note: Anomaly10y is a 10-year running average of the deviation from
# the average 1950-1980 temperature
# Unc10y is the 95% confidence interval


# get a subset of the climate data
clim <- subset(climate, Source=="Berkeley",
               select=c("Year", "Anomaly10y", "Unc10y"))

head(clim,10)

# Create the confidence region
# We must use the geom_ribbon() and map values to ymin and ymax
ggplot(clim, aes(x=Year, y=Anomaly10y)) +
  geom_ribbon(aes(ymin=Anomaly10y - Unc10y, ymax = Anomaly10y + Unc10y),
              alpha=0.2) + geom_line(color="blue")

# Homework: represent the above graph using 3 lines,
# 2 for the confidence region and 1 for the series

# -------------

# To see scales let's use the worldpop dataset
worldpop

# see how the population if growing
ggplot(worldpop, aes(x=Year, y=Population)) +
  geom_line() + geom_point() +
  scale_y_continuous(labels = comma)

# Use log scale in the Y axis
ggplot(worldpop, aes(x=Year, y=Population)) +
  geom_line() + geom_point() + scale_y_log10()
