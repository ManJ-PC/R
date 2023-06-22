library(ggplot2)
library(readr)
library(scales)
library(dplyr)
library(corrplot)
#house_prices = read_csv(file.choose())#
setwd("C:/Users/manue/Downloads/House Price Prediction Challenge/dataset")
house_prices = read_csv('./train.csv')

summary(house_prices)

table_posted_by <- table(house_prices$POSTED_BY)
barplot(table_posted_by, , main = "Category marking who has listed the property")


# Assuming 'dataset' is your dataset object and 'column_name' is the name of the column with 0 and 1 values
proportions <- prop.table(table(house_prices$UNDER_CONSTRUCTION))
proportions <- as.numeric(proportions)
labels <- paste0(c("0", "1"), " (", scales::percent(proportions), ")")
pie(proportions, labels = labels, main = "Under Construction or Not")

proportions <- prop.table(table(house_prices$RERA))
labels <- paste0(c("0", "1"), " (", sprintf("%.1f%%", proportions*100), ")")
pie(proportions, labels = labels, main = "Rera approved or No")


numeric_columns <- house_prices[, sapply(house_prices, is.numeric)]
correlation <- cor(numeric_columns, use = "pairwise.complete.obs")

# Create the heatmap
heatmap(correlation, main = "Correlation Heatmap")

# Create the correlation plot with diagonal values only
corrplot(correlation, type = "lower", order = "hclust")

#view(dataset)
library(tidyverse)
#na

# resume select columns
#filter
#
#str_detect
# res_aov , curva normaç
# curva da Anova

# correlação revenue e score
#profit em percentagem

# normalizar..

# sales tipo 3

# cluster segundo dois métodos...
# análisar cluster, relacionar com as features..

#usaram revenue and the budget, relações entre observações e não variáveis...Encontrar perfis tipo coisas em comum
# profits

aes (x =)

group_by summarize