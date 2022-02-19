library(tidyverse)
library(dplyr)
library(tidyr)
library(data.table)
setwd("C:/Users/Atrey/OneDrive/Desktop/Info201Code/final-project-starter-AZAHAZA")


income_distribution <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-AZAHAZA/main/data/dfa-income.csv")



aggregate_table <- data.table(income_distribution)

aggregate_table <- aggregate_table %>%
  select(Date, Category, Net.worth, Assets, Liabilities) %>%
  filter(Date == "1989:Q3" | Date == "1989:Q4" | Date == "2018:Q1" | Date == "2018:Q2" | Date == "2018:Q3" | Date == "2018:Q4" | Date == "2021:Q1" | Date == "2021:Q2" | Date == "2021:Q3")

  


aggregate_table_2 <- data.table(income_distribution)

MeanNetWorth <- aggregate_table_2 %>%
  group_by(Net.worth) %>%
  group_by(Category) %>%
  summarise(Net.worth = mean(Net.worth))

MeanAssets <- aggregate_table_2 %>%
  group_by(Assets) %>%
  group_by(Category) %>%
  summarise(Assets = mean(Assets))

MeanLiabilities <- aggregate_table_2 %>%
  group_by(Liabilities) %>%
  group_by(Category) %>%
  summarise(Liabilities = mean(Liabilities))


AggData <- merge(MeanNetWorth, MeanAssets)
AggregateDataTable <- merge(AggData, MeanLiabilities) 

AggregateDataTable <- AggregateDataTable %>%
  rename(AggregateDataTAble, Net.worth = Net Worth)

            
