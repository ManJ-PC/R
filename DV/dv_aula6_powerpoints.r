# Load the iris dataset
data(iris)
# Exclude the Species (factor variable) column for PCA
iris.pca <- prcomp(iris[, -5], center = TRUE, scale. = TRUE)
# Create a bi-plot
biplot(iris.pca, cex = 0.6)
# Or we can use ggbiplot for a ggplot2-based biplot
# First we need to install it via devtools as it's not on CRAN
library(devtools)
devtools::install_github("vqv/ggbiplot")
# Now, load the library
library(ggbiplot)
# finally, the ggbiplot version
ggbiplot(iris.pca, obs.scale = 1, var.scale = 1,
         groups = iris$Species, # grouping variable
         ellipse = TRUE, # confidence area
         circle = TRUE) + # correlation area
  theme(legend.direction = 'horizontal',
        legend.position = 'top')