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


# but we can make it different - more bins
# and a gradient filling
sp + stat_bin2d(bins=50) +
  scale_fill_gradient(low="lightblue", high="darkblue", limits=c(0,6000))


# -- HEXBIN --
# Now we try with another shape for the bins - hexagons instead of rectangles
library(hexbin)

sp + stat_binhex(bins=60) +
  scale_fill_gradient(low="lightblue", high="darkblue", limits=c(0,6000))

# establishing breaks in the scale
sp + stat_binhex(bins=60) +
  scale_fill_gradient(low="lightblue", high="red", limits=c(0,6000),
                      breaks=c(0,500,1000,2000,4000,6000))


##
## Overplotting within discrete categories

# Let's pick another dataset
head(ChickWeight)
str(ChickWeight)

sp1 <- ggplot(ChickWeight, aes(x=Time, y=weight))
sp1 + geom_point()

# To better understand the cluttering in the columns we will "shake" the points (jitter)

sp1 + geom_point(position="jitter")

# which is quite similar to
sp1 + geom_jitter()

# we can make them jitter horizontally
sp1 + geom_point(position=position_jitter(width=0.3, height=0))

# When data has one discrete axis and one continuous axis
# it might make sense to use boxplots
sp1 + geom_boxplot(aes(group=Time))

# For the sake of curiosity let's check the geom_violin()
sp1 + geom_violin(aes(group=Time))
