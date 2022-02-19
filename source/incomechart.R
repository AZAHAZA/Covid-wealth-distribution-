install.packages("stringr")
install.packages("dplyr")

library("stringr")
library("dplyr")
library("tidyverse",warn.conflicts = FALSE)
library("ggplot2")

#chart for Q1 from the data 
incomeQ1 <- read_csv("Q1income - dfa-income.csv")
View(incomeQ1)

plot0020 <- filter(incomeQ1, Category == "pct00to20") 
plot2040 <- filter(incomeQ1, Category == "pct20to40") 
plot4060 <- filter(incomeQ1, Category == "pct40to60") 
plot6080 <- filter(incomeQ1, Category == "pct60to80") 
plot8099 <- filter(incomeQ1, Category == "pct80to99") 

p <- ggplot(incomeQ1, aes(x = Date, color = Asset)) + 
  geom_freqpoly()


ggplot() +
  geom_line(data = plot0020, aes(x = Date, y = Assets), color = "#339999", group = plot0020 ) +
  geom_line(data = plot2040, aes(x = Date, y = Assets), group = 1) +
  geom_line(data = plot4060, aes(x = Date, y = Assets), color = "#000066", group = plot2040) + 
  geom_line(data = plot6080, aes(x = Date, y = Assets), color = "#663399", group = plot4060) + 
  geom_line(data = plot8099, aes(x = Date, y = Assets), color = "#3a97c9", group =plot8099) +
  ggtitle("Line plot of the Assets change between different groups") 


#chart for Q2 from the data 

incomeQ2 <- read_csv("Q2income - dfa-income.csv")
View(incomeQ2)

plot0020 <- filter(incomeQ2, Category == "pct00to20") 
plot2040 <- filter(incomeQ2, Category == "pct20to40") 
plot4060 <- filter(incomeQ2, Category == "pct40to60") 
plot6080 <- filter(incomeQ2, Category == "pct60to80") 
plot8099 <- filter(incomeQ2, Category == "pct80to99") 

p <- ggplot(incomeQ1, aes(x = Date, color = Asset)) + 
  geom_freqpoly()


ggplot() +
  geom_line(data = plot0020, aes(x = Date, y = Assets), color = "#339999", group = plot0020 ) +
  geom_line(data = plot2040, aes(x = Date, y = Assets), group = 1) +
  geom_line(data = plot4060, aes(x = Date, y = Assets), color = "#000066", group = plot2040) + 
  geom_line(data = plot6080, aes(x = Date, y = Assets), color = "#663399", group = plot4060) + 
  geom_line(data = plot8099, aes(x = Date, y = Assets), color = "#3a97c9", group =plot8099) +
  ggtitle("Line plot of the Assets change between different groups") 

#chart for Q3 from the data 

incomeQ3 <- read_csv("Q3income - dfa-income.csv")
View(incomeQ3)

plot0020 <- filter(incomeQ3, Category == "pct00to20") 
plot2040 <- filter(incomeQ3, Category == "pct20to40") 
plot4060 <- filter(incomeQ3, Category == "pct40to60") 
plot6080 <- filter(incomeQ3, Category == "pct60to80") 
plot8099 <- filter(incomeQ3, Category == "pct80to99") 

p <- ggplot(incomeQ1, aes(x = Date, color = Asset)) + 
  geom_freqpoly()


ggplot() +
  geom_line(data = plot0020, aes(x = Date, y = Assets), color = "#339999", group = plot0020 ) +
  geom_line(data = plot2040, aes(x = Date, y = Assets), group = 1) +
  geom_line(data = plot4060, aes(x = Date, y = Assets), color = "#000066", group = plot2040) + 
  geom_line(data = plot6080, aes(x = Date, y = Assets), color = "#663399", group = plot4060) + 
  geom_line(data = plot8099, aes(x = Date, y = Assets), color = "#3a97c9", group =plot8099) +
  ggtitle("Line plot of the Assets change between different groups") 

#chart for Q4 from the data 

incomeQ4 <- read_csv("Q3income - dfa-income.csv")
View(incomeQ4)

plot0020 <- filter(incomeQ4, Category == "pct00to20") 
plot2040 <- filter(incomeQ4, Category == "pct20to40") 
plot4060 <- filter(incomeQ4, Category == "pct40to60") 
plot6080 <- filter(incomeQ4, Category == "pct60to80") 
plot8099 <- filter(incomeQ4, Category == "pct80to99") 

p <- ggplot(incomeQ1, aes(x = Date, color = Asset)) + 
  geom_freqpoly()


ggplot() +
  geom_line(data = plot0020, aes(x = Date, y = Assets), color = "#339999", group = plot0020 ) +
  geom_line(data = plot2040, aes(x = Date, y = Assets), group = 1) +
  geom_line(data = plot4060, aes(x = Date, y = Assets), color = "#000066", group = plot2040) + 
  geom_line(data = plot6080, aes(x = Date, y = Assets), color = "#663399", group = plot4060) + 
  geom_line(data = plot8099, aes(x = Date, y = Assets), color = "#3a97c9", group =plot8099) +
  ggtitle("Line plot of the Assets change between different groups") 


