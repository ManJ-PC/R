library(tictoc) #  Provides a simple and convenient way to measure the execution time of specific code sections or functions
library(data.table) # Provides a fast and efficient way to manipulate, analyze, and process large datasets

tic() # Start the timer
dt <- fread(file.choose()) # Choose file
toc() # Stop the timer

library(dplyr) # Provides a set of fast and efficient functions that allow you to perform common data manipulation tasks on data frames (ex: select)

str(dt) # Used to display the structure of an R object, including data frames, lists, vectors, and other data types

library(skimr) # Provides a tool for quickly summarizing and visualizing the properties of a dataset (skim)
s <- skim(dt) # Provides a concise and informative overview of the data contained in dt and stores it on s
s # Displays the contents of the variable s in the R console or RStudio viewer.

# Remove columns
dt <- dt %>%
  select(-LocationType, -CrossStreet1, -CrossStreet2,
         -IntersectionStreet1, -IntersectionStreet2,
         -Landmark, -FacilityType, -DueDate, -BBL, -ODchannelType,
         -ParkFacility, -ParkBorough, -Vehicle, -Taxi_CB, -Taxi_PUL,
         -BridgeName, -BridgeDirection, -RoadRamp, -BridgeSegment
  )

# Drop more variables
dt <- dt %>%
  select(-AddressType, -X_plane, -Y_plane, -LocationXY)

# Check the new dataset
tic()
s <- skim(dt)
toc()
s

# Remove the rows with missing values in Latitude or Longitude
dt <- dt[complete.cases(dt[, list(Latitude, Longitude)]), ]

# Save this filtered dataset
fwrite(dt, file=file.choose())

# Plots
library(ggplot2) # Provides capabilities to create high-quality and customizable plots and graphics

# Selects the 15 most frequently occurring values in the "ComplaintType" column
dt_counts <- dt %>%
  group_by(ComplaintType) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  slice_head(n = 15)

# Replace "Noise" with "Noise - General"
dt_counts$ComplaintType <- ifelse(dt_counts$ComplaintType == "Noise", "Noise - General", dt_counts$ComplaintType)

# Plot to visualize the frequency distribution of the top 15 most frequent complaint types
ggplot(dt_counts, aes(x = reorder(ComplaintType, n), y = n)) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Complaint Type") +
  ylab("Number of Complaints") +
  ggtitle("Top 15 Complaint Types") +
  theme_minimal()

# Filtrar os tipos de reclamação que serão destacados em vermelho
highlight_types <- c("Noise - Residential", "Noise - Street/Sidewalk", "Noise - Vehicle", "Noise - Commercial", "Noise - General", "Noise - Helicopter")

# Adicionar uma nova coluna para indicar se o tipo de reclamação está na lista de destaque
dt_counts$Type <- ifelse(dt_counts$ComplaintType %in% highlight_types, "Noise", "Other")

# Plotar o gráfico com barras destacadas em vermelho
ggplot(dt_counts, aes(x = reorder(ComplaintType, n), y = n, fill = Type)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Other" = "gray", "Noise" = "red")) +
  coord_flip() +
  xlab("Complaint Type") +
  ylab("Number of Complaints") +
  ggtitle("Top 15 Complaint Types") +
  theme_minimal()

# Filtrar os tipos de reclamação relacionados ao barulho
noise_types <- c("Noise - Residential", "Noise - Street/Sidewalk", "Noise - Vehicle", "Noise - Commercial", "Noise - General")

# Filtrar as reclamações relacionadas ao barulho e agrupar por cidade e tipo de reclamação
filtered_data <- dt %>%
  filter(ComplaintType %in% noise_types) %>%
  group_by(City, ComplaintType) %>%
  summarise(n = n())

# Plotar o gráfico de barras empilhadas
ggplot(filtered_data, aes(x = n, y = City, fill = ComplaintType)) +
  geom_bar(stat = "identity", position = "stack") +
  xlab("City") +
  ylab("Number of Complaints") +
  ggtitle("Noise Complaints by City") +
  theme_minimal()

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# # Change with time
# # Let's see how some types have evolved over the years
# 
# library(lubridate)
# 
# # Let's use a YearMonth division
# # Mutate the dataframe to add a YearMonth column and filter by "Illegal Parking"
# dt2 <- dt %>%
#   mutate(YearMonth = as.Date(format(strptime(CreatedDate,
#                                              "%m/%d/%Y %I:%M:%S %p"),
#                                     "%Y-%m-01"))) %>%
#   filter(ComplaintType == "Illegal Parking")
# 
# 
# # Group by YearMonth and count the number of complaints
# dt_counts4 <- dt2 %>%
#   group_by(YearMonth) %>%
#   summarise(n = n()) %>%
#   arrange(YearMonth)
# 
# 
# # Plot the counts over time
# ggplot(dt_counts4, aes(x = YearMonth, y = n)) +
#   geom_line() +
#   scale_x_date(date_breaks = "1 year", date_labels = "%Y-%m") +
#   xlab("Year and Month") +
#   ylab("Number of Illegal Parking Complaints") +
#   ggtitle("Illegal Parking Complaints Over Time") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))
# 
# 
# 
# # use ticks and labels in all months
# ggplot(dt_counts4, aes(x = YearMonth, y = n)) +
#   geom_line() +
#   scale_x_date(date_breaks = "1 month", date_labels = "%Y-%m") +
#   xlab("Year and Month") +
#   ylab("Number of Illegal Parking Complaints") +
#   ggtitle("Illegal Parking Complaints Over Time") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
# 
# 
# 
# # Do this with other complaint types
# complaintTypes <- c("Illegal Parking", "Noise - Residential",
#                     "Water System", "HEAT/HOT WATER")
# 
# 
# dt3 <- dt %>%
#   mutate(YearMonth = as.Date(format(strptime(CreatedDate,
#                                              "%m/%d/%Y %I:%M:%S %p"),
#                                     "%Y-%m-01"))) %>%
#   filter(ComplaintType %in% complaintTypes)
# 
# 
# dt_counts5 <- dt3 %>%
#   group_by(YearMonth, ComplaintType) %>%
#   summarise(n = n()) %>%
#   arrange(YearMonth)
# 
# 
# ggplot(dt_counts5, aes(x = YearMonth, y = n, color = ComplaintType)) +
#   geom_line() +
#   scale_x_date(date_breaks = "1 month", date_labels = "%Y-%m") +
#   xlab("Year and Month") +
#   ylab("Number of Complaints") +
#   ggtitle("Complaints Over Time") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
#   scale_color_discrete(name = "Complaint Type")
# 
# 
# # Instead of mutating all the time, we can reuse the dataset
# 
# complaintTypes <- c("Illegal Parking", "Noise - Residential",
#                     "Water System", "HEAT/HOT WATER")
# 
# 
# # This is what we should be doing from the start!
# dt1 <- dt %>%
#   mutate(YearMonth = as.Date(format(strptime(CreatedDate,
#                                              "%m/%d/%Y %I:%M:%S %p"),
#                                     "%Y-%m-01")))
# 
# # Now is much easir and faster...
# dt_filtered <- dt1 %>%
#   filter(ComplaintType %in% complaintTypes)
# 
# dt_counts6 <- dt_filtered %>%
#   group_by(YearMonth, ComplaintType) %>%
#   summarise(n = n()) %>%
#   arrange(YearMonth)
# 
# # Plot the data
# ggplot(dt_counts6, aes(x = YearMonth, y = n, color = ComplaintType)) +
#   geom_line() +
#   scale_x_date(date_breaks = "1 month", date_labels = "%Y-%m") +
#   xlab("Year and Month") +
#   ylab("Number of Complaints") +
#   ggtitle("Complaints Over Time") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
#   scale_color_discrete(name = "Complaint Type")
# 
# 
# 
