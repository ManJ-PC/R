##
## EDA - Exploratory Data Analysis
##

library(ggplot2)
library(GGally)

# a correlation table
ggpairs(mtcars[,1:5])

# Now, using ggplot2 to plot the graphics
# To avoid cluttering the graphic I'm dividing the columns into 2 groups
# first columns 1 to 4
ggpairs(mtcars, columns = 1:4, ggplot2::aes(colour=factor(cyl), alpha=0.5))
# and now columns 2 to 6
ggpairs(mtcars, columns = 2:6, ggplot2::aes(colour=factor(cyl), alpha=0.5))

# the correlation triangle
ggcorr(mtcars, palette = "RdBu", label = TRUE)

# Using package skimr to create a report on a dataset
library(skimr)
s <- skim(mtcars)
s

# Using package summarytools to create a report on a dataset
library(summarytools)
s <- dfSummary(mtcars)
s

### 
library(readxl)
library(naniar)
# Load a sample dataset (go for the world Hapiness Report)
s <- read_excel(file.choose())
# Visualize missing data patterns using vis_miss()
vis_miss(s)

###
library(mice)
# Load sample dataset with missing values
data(airquality)
summary_stats <- summary(airquality)

# Perform multiple imputation (5 different values) using mice
imputed_data <- mice(airquality, m = 5, method = "mean")

# Access the imputed dataset
imputed_data_complete <- complete(imputed_data)

# Perform summary statistics on imputed data
summary_stats_imputed <- summary(imputed_data_complete) # organização das varíaveis pelo ponto decimal para todos os parâmetros

# Compare the summary statistics of the imputed data and original
summary_stats_imputed
summary_stats


