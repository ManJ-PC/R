22 %% 7
a = 5
b = 6
b > a
7 -> c
c = 8
x = 2:8
b %in% x
x
A = TRUE
D = 5L
F = "R is not FUN"
vtr = c(1,2,3)
ppp = c(8,6,10,13)
sort(ppp)
### Ponto faz parte da variável
banck.Account = 100
deposit = 20
banck.Account <- banck.Account + deposit
a = 2.2
b = F
c = "f"
vec = c(1,2,3,5.6)
class(vec)
vec2 = c("P","t")
class(vec2)
temps = c(1,2,3)
names(temps) = c('A','B','C')
temps

v1 = c(1,2,3)

i = sum(v1)
max(v1)
std(v1)
sd(v1)
prod(v1)
v1 < 2

stock.prices = c(23,27,23,21,34)

names(stock.prices) = c('Mon','Tue','Wed','Thu','Fri')
stock.prices
mean(stock.prices)

over.23 = stock.prices[stock.prices > 23]

max(over.23)

t = 1:10
m = matrix(t, nrow = 2)

m2 = matrix(1:12, byrow = FALSE, nrow = 4)

m3 = matrix(1:12, byrow = TRUE, nrow = 4)



days = c('Mon','Tue','Wed','Thur','Fri')
temp = c(22.2,21,23,24,24.5)
rain = c(T,T,F,T,F)
data.frame(days,temp,rain)
df = data.frame(days,temp,rain)


write.csv(mtcars,file = 'my_example.csv')
head(ex)

x = c(3,7,1)
t = c(3,7,1,4)

if(x%%2 == 0){
  print("Even")
} else{
  print("Not even")
}
y = 0

while(y < 10){
  print(y)
  y=y+1
}

ciclo.for = function(x){
  for(i in x){
    print(i)
  }
}
ciclo.for(t)


t = append(t,8)
sort(t)
rev(sort(t))
as.list(t)

text = "Hello, do you know?"
grepl("you",text)
grep("yu", text)


# Por em data
c = "1990-01-01"
my.date = as.Date(c)
my.date = as.Date("Jun-04-97", format = "%b-%d-%y")
my.date = as.Date("June,01,2002", format ="%B,%d,%Y")


### DPLYR
head(filter(flights,month == 11, day == 3, carrier =="AA"))
slice(flights,1:10)
head(arrange(flights, year, month, day, desc(air_time)))


head(select(flights, carrier,arr_time))
head(rename(flights, airline_carrier = carrier))
distinct(select(flights,carrier))
head(mutate(flights, new_col = arr_delay-dep_delay))
head(transmute(flights, new_col = arr_delay*dep_delay))
summarise(flights, avg_airtime = mean(air_time,na.rm= TRUE))
sample_n(flights,10)


df = mtcars
### Com Pipe
# Data %>% op1 %>% op2 

result = df %>% filter(mpg>20) %>% sample_n(size=5) %>% arrange(desc(mpg))

### Exercicios DPLYR
df %>% filter(mpg > 20 & cyl == 6)

result = df %>% arrange(cyl, desc(wt))
head(result)

head(select(df, mpg, hp))
distinct(select(df, gear))


head(transmute(df, Performance = hp/wt))

summarise(df, mean = mean(mpg))

std_hp = df %>% filter(cyl == 6) %>% summarise(avg_hp = mean(mpg))


### TIDYR
gather(df,Quarter, Revenue, Qtr1:Qtr4)

library(ggplot2)
library(ggplot2movies)

pl = ggplot(movies,aes(x=rating))

pl2 = pl + geom_histogram(binwidth = 0.1, alpha = 0.7, aes(fill=..count..))

pl3 = pl2 + xlab('Movie Rating') + ylab("Count") + ggtitle("Título")
 

df = mtcars
## DATA
pl = ggplot(df,aes(x=wt,y = mpg))
##GEOMETRY
pl = pl + geom_point(aes(size= hp, shape =factor(cyl), color = factor(cyl)))

library(plotly)

pl = ggplot(mtcars,aes(mpg,wt)) + geom_point()
print(pl)

## plotly não funciona


Batting <- read.csv("//srv-files1/ficheiros/Bloco Grafico/Div_Editorial_Escolar/Business Analytics/Eduarda Santos/Curso R/Training Exercises/Capstone and Data Viz Projects/Capstone Project/Batting.csv")
head(Batting)
str(Batting)
head(Batting$AB)
head(Batting$X2B)

df = student_mat <- read.csv("//srv-files1/ficheiros/Bloco Grafico/Div_Editorial_Escolar/Business Analytics/Eduarda Santos/Curso R/Machine Learning with R/student-mat.csv", sep = ";")
library(caTools )
set.seed(101)
sample = sample.split(df$G3, SplitRatio = 0.7)
train = subset(df,sample == TRUE)
test = subset(df,sample == FALSE)
# ~. todas as outras colunas
model = lm(G3 ~ ., data = train)

print(summary(model))

