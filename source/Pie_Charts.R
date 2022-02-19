#Pie chart for the PO2

#tidyverse
library("tidyverse",warn.conflicts = FALSE)
library("plotly",warn.conflicts = FALSE)
library("dplyr",warn.conflicts = FALSE)
#setwd("/Users/school/INFO-201code/projects/final-project-starter-AZAHAZA")

dfa.education<-read.csv("../data/dfa-education.csv")
wealth_education_dist <- dfa.education %>%
  filter(Date =='2018:Q1')
View(wealth_education_dist)

wealth_education_dist2 <- dfa.education %>%
  filter(Date =='2021:Q3')
View(wealth_education_dist2)


fig1 <- plot_ly(data = wealth_education_dist, labels = ~Category, values = ~Net.worth, type = "pie",
               textinfo = "label+percent",
               insidetextorientation = "radial")  %>% layout(title = 'Percentage of Wealth by Education Level 2018')

fig2 <- plot_ly(data = wealth_education_dist2, labels = ~Category, values = ~Net.worth, type = "pie",
                textinfo = "label+percent",
                insidetextorientation = "radial")  %>% layout(title = 'Percentage of Wealth by Education Level 2021')

