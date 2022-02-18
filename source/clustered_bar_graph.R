#Bar chart for the PO2

#tidyverse
library("tidyverse")
#setwd("~/Desktop/Info201Project/final-project-starter-AZAHAZA/source")

wealth_race <- read_csv("../data/dfa-race.csv")

wealth_race_dist <- wealth_race %>%
  filter(Date =='2018:Q1'| Date=='2018:Q2'| Date=='2018:Q4'| Date=='2019:Q1'| Date=='2019:Q2'| Date=='2019:Q3'| Date=='2019:Q4'| Date=='2020:Q1'| Date=='2020:Q2'| Date=='2020:Q3'| Date=='2020:Q4'| Date=='2021:Q1'| Date=='2021:Q2'| Date=='2021:Q3')

 chart <- ggplot(wealth_race_dist)+
geom_col(mapping = aes(x = Date, y = Assets,fill = Category), position = "dodge") +

labs(
  title = "Income distribution among different race during pre-panedmic and pandemic", 
  x = "Year", 
  y = "Assets",
)

