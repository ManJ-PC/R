library(readxl)

## Ex.2
ds02 <- read_excel(file.choose())


## Ex.3
# Let's use skimr to start
library(skimr)
s1 <- skim(ds02)
s1

# Now, use summaryTools
library(summarytools)
s2 <- dfSummary(ds02)
s2

# 3.1
# should be diret reading


# 3.2
print(ds02, n=25)


# 3.3
#


## Ex.4
library(ggplot2)

# First, let's assume Grade is a numerical variable:
# We can either plot a histogram
p <- ggplot(ds02, aes(Grade)) + 
  geom_histogram(binwidth = 1, fill = 'blue', color = 'black') +  #parâmetro que (histograma com variável contínua, dividir istyo em partes...)
  labs(x = 'Grade', y = 'Count', title = 'Histogram of Grades')
p

# We can make this more readable for x-axis
p <- ggplot(ds02, aes(x = as.numeric(as.character(Grade)))) + 
  geom_histogram(binwidth = 1, fill = 'blue', color = 'black') +
  labs(x = 'Grade', y = 'Count', title = 'Histogram of Grades') +
  scale_x_continuous(breaks = unique(ds02$Grade)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
p

# now as a boxplot
p <- ggplot(ds02, aes(y = Grade)) + 
  geom_boxplot(fill = 'cyan', color = 'black') +
  labs(y = 'Grade', title = 'Boxplot of Grades')
p

# or even a violin plot
p <- ggplot(ds02, aes(x = "", y = Grade)) +
  geom_violin(fill = 'cyan', color = 'black') +
  labs(y = 'Grade', title = 'Violin plot of Grades')
p

# If we are to consider Grade as categorical variable, then
# we can create a bar plot
p <- ggplot(ds02, aes(Grade)) + 
  geom_bar(fill = 'blue', color = 'black') +
  labs(x = 'Grade', y = 'Count', title = 'Bar plot of Grades')
p

### BTW, did you noticed the difference from the histogram?
# O histograma assume uma variável contínua
# no de barras está assumir como variável categóricas!

# variáveis continuas que podemos descritizar (histograma)

## Ex.5
# First, we create a column with the number of observations
# (actually we could have used 'idx')
# anyway, let's proceed and create a copy not to modify initial ds
ds1 <- ds02
ds1$Observation <- seq.int(nrow(ds02))

# Create a line plot for Similarity and Distance_part_percent
p <- ggplot(ds1) +
  geom_line(aes(x = Observation, y = Similarity), color = 'blue') +
  geom_line(aes(x = Observation, y = Distance_part_percent), color = 'red') +
  labs(x = 'Observation', y = 'Value', title = 'Evolution of Similarity and Distance Part Percent over Observations')
p


## Ex.6
# Load necessary libraries
library(ggplot2)
library(GGally)

# Subset the dataframe to keep only the variables of interest
ds_subset <- ds02[,c("Grade", "String length", "Distance", "Similarity",
                     "Distance_part_percent")]

ggcorr(ds_subset, label = TRUE)
# nível de funções é pouco provedimental


## for the sake of curiosity:
## there is another way (not in grammar of graphics)

library(corrplot)
# Calculate the correlation matrix
corr_matrix <- cor(ds_subset, use = "pairwise.complete.obs") 
# Create a correlation plot
corrplot(corr_matrix, method = "color", type = "upper", 
         title = "Correlation Matrix", mar = c(0,0,1,0))

## Ex.7 and Ex.8
ds03 <- read_excel(file.choose())

## Ex.9
s03 <- skim(ds03)
s03

# First compare the histograms
p1 <- ggplot(ds02, aes(Grade)) + 
  geom_histogram(binwidth = 1, fill = 'blue', color = 'black') +
  labs(x = 'Grade', y = 'Count', title = 'Histogram of Grades for 02')

p2 <- ggplot(ds03, aes(Grade)) + 
  geom_histogram(binwidth = 1, fill = 'blue', color = 'black') +
  labs(x = 'Grade', y = 'Count', title = 'Histogram of Grades for 03')

# plot them one over the other
library(gridExtra)
grid.arrange(p1, p2, nrow=2)


# Now, compare the correlations (visually)
ds_subset_02 <- ds02[,c("Grade", "String length", "Distance", "Similarity",
                        "Distance_part_percent")]
ds_subset_03 <- ds03[,c("Grade", "String length", "Distance", "Similarity",
                        "Distance_part_percent")]

p1 <- ggcorr(ds_subset_02, label = TRUE)
p2 <- ggcorr(ds_subset_03, label = TRUE)

# plot them side-by-side
grid.arrange(p1, p2, ncol=2)
