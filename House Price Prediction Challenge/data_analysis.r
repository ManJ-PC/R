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

# Define the exchange rate (example value)
exchange_rate <- 1113.69#0.011

# Create a new column with the target price in euros
#house_prices$target_price_eur <- house_prices$TARGET(PRICE_IN_LACS) * exchange_rate
house_prices$target_price_eur <- house_prices$`TARGET(PRICE_IN_LACS)` * exchange_rate



hp_sample <- house_prices %>% sample_n(4999)
shapiro.test(hp_sample$target_price_eur)

res_aov <- aov(house_prices)

house_prices %>%
  filter(target_price_eur >= 0L & target_price_eur <= 500000L) %>%
  ggplot() +
  aes(x = target_price_eur) +
  geom_histogram(bins = 20L, fill = "#112446") +
  theme_minimal()


summary(house_prices)





#str(house_prices$target_price_eur)

house_prices + ggplot(geom_violin(aes(group=target_price_eur)))

boxplot(house_prices$target_price_eur, main = "Prices Distribution Plot", ylab = "Values")
# Install and load the vioplot package
install.packages("vioplot")
library(vioplot)

# Assuming you have a dataset named 'df' and want to plot the quartile distribution of the column 'column_name'
vioplot(house_prices$target_price_eur, col = "skyblue", main = "Prices Distribution Plot", ylab = "Values")

# Assuming you have a dataset named 'house_prices' and want to create a violin plot for the 'target_price_eur' column
vioplot(house_prices$target_price_eur, col = "skyblue", main = "Prices Distribution Plot", ylab = "Values")

# Remove scientific notation from the y-axis
options(scipen = 999)

# Plot the violin plot again
vioplot(house_prices$target_price_eur, col = "skyblue", main = "Prices Distribution Plot", ylab = "Values", yaxt = "n")



# Assuming you have a dataset named 'house_prices' and want to create a bar plot for the 'target_price_eur' column
barplot(house_prices$target_price_eur, col = "skyblue", main = "Prices Distribution Plot", ylab = "Values")

# Remove scientific notation from the y-axis
options(scipen = 999)

# Get the y-axis labels without scientific notation
y_labels <- formatC(house_prices$target_price_eur, format = "f", digits = 0)

# Plot the bar plot again with adjusted y-axis labels
barplot(house_prices$target_price_eur, col = "skyblue", main = "Prices Distribution Plot", ylab = "Values", names.arg = y_labels)














str(house_prices)

library(ggplot2)




# Assuming you have a dataset named 'house_prices' and want to create a violin plot for the 'target_price_eur' column
ggplot(house_prices, aes(x = "", y = target_price_eur)) +
  geom_violin(fill = "skyblue", color = "black") +
  labs(title = "Prices Distribution Plot", y = "Values") +
  theme_minimal()


numeric_columns <- house_prices[, sapply(house_prices, is.numeric)]
correlation <- cor(numeric_columns, use = "pairwise.complete.obs")

# Create the heatmap
heatmap(correlation, main = "Correlation Heatmap")

# Create the correlation plot with diagonal values only
corrplot(correlation, type = "lower", order = "hclust")


shapiro.test(house_prices$target_price_eur)


#view(dataset)
library(tidyverse)
#na
library(GGally)
library(dbscan)
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


# Create the table of frequencies
table_posted_by <- table(house_prices$POSTED_BY)

# Create the barplot
barplot(table_posted_by)

# Calculate the percentages
percentages <- round((table_posted_by / sum(table_posted_by)) * 100, 1)

# Add percentage labels to the bars
text(x = barplot(table_posted_by),main = "Category marking who has listed the property", y = table_posted_by, labels = paste0(percentages, "%"), pos = 3)



# cluster segundo dois métodos...
# análisar cluster, relacionar com as features..

#usaram revenue and the budget, relações entre observações e não variáveis...Encontrar perfis tipo coisas em comum
# profits

aes (x =)

group_by summarize