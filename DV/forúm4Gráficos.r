# Sample data
dates <- c("2023-06-01", "2023-06-02", "2023-06-03", "2023-06-04", "2023-06-05")
air_quality <- c(80, 75, 90, 85, 95) # Air quality indices
electricity_consumption <- c(500, 550, 600, 520, 580) # Electricity consumption in kilowatts/hour

# Creating the grouped bar chart
bar_data <- data.frame(dates, air_quality, electricity_consumption)

# Convert dates to Date format
bar_data$dates <- as.Date(bar_data$dates)

# Load required packages
library(ggplot2)

# Create the grouped bar chart
ggplot(bar_data, aes(x = dates)) +
  geom_bar(aes(y = air_quality, fill = "Air Quality"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = electricity_consumption, fill = "Electricity Consumption"), stat = "identity", position = "dodge") +
  labs(x = "Date", y = "Value", fill = "") +
  scale_fill_manual(values = c("Air Quality" = "blue", "Electricity Consumption" = "red")) +
  theme_minimal()
