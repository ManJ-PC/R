#
# Introduction to reading files and ggplot
# ALSO some solutions for exercises (02)
#

# install.packages("readxl")
library(readxl)

# Use suppressWarnings() to avoid being cluttered with warning messages.
# However, errors are still reported
suppressWarnings(s1 <- read_excel(file.choose()))

# check the sheet structure
s1

library(ggplot2)

# An experience... 
ggplot(s1, aes(x=year, y=total_CO2, color=factor(country))) + geom_line()

# Now, creating subsets
s2 <- subset(s1, country == "Portugal")
s2

# things will get better now!
ggplot(s2, aes(x=year, y=total_CO2)) + geom_line()

# in color
ggplot(s2, aes(x=year, y=total_CO2, color=factor(country))) + geom_line()

# using a combination of conditions
s3 <- subset(s1, country %in% c("Portugal","Afghanistan") & year >= 1980)

ggplot(s3, aes(x=year, y=total_CO2, color=factor(country))) + geom_line()

### Getting back to exercises:

## Ex.6
# it is easier if we pipeline the procedure
# therefore, import the 'dplyr'
library(dplyr)

top_countries <- s1 %>%
  group_by(country) %>%
  summarise(total_emissions = sum(total_CO2, na.rm = TRUE)) %>%
  arrange(desc(total_emissions))

# OBS: na.rm = TRUE is used to ignore missing values
# when summing the emissions

print(top_countries,n=30)

## Ex.7
library(tidyr)

# Calculate the total CO2_solid_fuel and CO2_liquid_fuel for all
# countries per year
total_CO2 <- s1 %>%
  group_by(year) %>%
  summarise(
    total_solid_CO2 = sum(CO2_solid_fuel, na.rm = TRUE),
    total_liquid_CO2 = sum(CO2_liquid_fuel, na.rm = TRUE)
  )

# Create the line plot for each series
ggplot(total_CO2, aes(x = year)) +
  geom_line(aes(y = total_solid_CO2, color = "Solid CO2")) +
  geom_line(aes(y = total_liquid_CO2, color = "Liquid CO2")) +
  labs(
    x = "Year",
    y = "Total CO2 Emissions (All Countries)",
    color = "CO2 Type",
    title = "World Evolution of Solid and Liquid CO2 Emissions"
  ) +
  theme_minimal()

######
# Note: to remove row with missing values
library(tidyr)
s2 <- s1
data_without_nas <- drop_na(s2)
######


## Ex.8
library(ggplot2)

# first we aggregate by year
aggregated_data <- s1 %>%
  group_by(year) %>%
  summarise(total_CO2 = sum(total_CO2, na.rm = TRUE))

ggplot(aggregated_data, aes(x = year, y = total_CO2)) +
  geom_line() +
  labs(x = "Year", y = "Total CO2 Emissions", 
       title = "World Generation of Total CO2 over Time")

