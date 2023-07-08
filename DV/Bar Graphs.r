str(diamonds)


# And now making plot about the cut
# notice that in here we do not have aggregated data
ggplot(diamonds, aes(x=cut)) + geom_bar()

# Obs: Carat denotes the weight of a diamond, not the size.
ggplot(diamonds, aes(x=carat)) + geom_bar()

# We will get back to this later...

##
## Let's change again the dataset to the US population change
head(uspopchange)

# First, let's introduce the rank function
# (it will be used in population change dataset)
r<-c(3,4,6,1,8) # Obs: the ordered set is 1 3 4 6 8 | 23415 ao invés de 
rank(r)

# Now, select the top 10 states by filtering the dataset
upc <- subset(uspopchange, rank(Change)>40)
upc

# to make things easier, let's sort the list
upc2 <- upc[order(upc$Change, decreasing=TRUE),]
upc2

# Check that the values in x ARE NOT reordered
ggplot(upc2, aes(x=Abb, y=Change, fill=Region)) +
  geom_bar(stat="identity")


# To fix this let's reorder the bars Decreasingly right in the chart
# We will use function reorder() and - (minus) for reversing
ggplot(upc, aes(x=reorder(Abb, -Change), y=Change, fill=Region)) +
  geom_bar(stat="identity", color="black") +
  scale_fill_manual(values=c("#772233", "#CC2244")) +  # we need 2 colors
  xlab("State") # create a more informative label for the x axis


##
## Another dataset: The climate dataset with 499 observations and 6 variables
climate

# Create subset only from Berkeley and in a period of time
csub <- subset(climate, Source=="Berkeley" & Year >= 1900) # subset vai vos ser mto útil...
head(csub) 

# Now, create a new column (pos) which indicates whether the Anomaly10y
# is positive or not
csub$pos <- (csub$Anomaly10y >= 0)
head(csub, 80)

# Use the new variable to map color
ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
  geom_bar(stat="identity")
