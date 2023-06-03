hprices <- read.csv("H:\\Xpto\\Documents\\GitHub\\R\\para_alunos\\datasets\\Housing.csv")

paste("Data Exploration")
dim(hprices)
nrow(hprices)
ncol(hprices)

paste("Column names")
colnames(hprices)

summary(hprices)
