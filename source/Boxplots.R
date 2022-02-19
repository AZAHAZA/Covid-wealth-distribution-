#Box Plots for P02

setwd("/Users/school/INFO-201code/projects/final-project-starter-AZAHAZA")
#setwd("~/Desktop/Info201Project/final-project-starter-AZAHAZA/source")

library("ggplot2")
library("dplyr")
library("stringr")

#First Plots are race by year.  Second Plots show net woth by category 

dfa.race <- read_csv("../data/dfa-race.csv",show_col_types = FALSE)
#RACE:White

White<-dfa.race %>%
  filter(Category=='White')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



White_Plot<-ggplot(White, aes(Date,Net.worth))+geom_boxplot()+labs(title = "Distriution Of White Wealth Pre and Post Pandemic",xlab="Year",ylab="Net Worth") 

#Race:Black 

Black<-dfa.race %>%
  filter(Category=='Black')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



Black_Plot<-ggplot(Black, aes(Date,Net.worth))+geom_boxplot()+labs(title = "Distriution Of Black Wealth Pre and Post Pandemic",xlab="Year",ylab="Net Worth") 

#Race:Hispanic

Hispanic<-dfa.race %>%
  filter(Category=='Hispanic')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



Hispanic_Plot<-ggplot(Hispanic, aes(Date,Net.worth))+geom_boxplot()+labs(title = "Distriution Of Hispanic Wealth Pre and Post Pandemic",xlab="Year",ylab="Net Worth") 

#Race:Other

Other<-dfa.race %>%
  filter(Category=='Other')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



Other_Plot<-ggplot(Other, aes(Date,Net.worth))+geom_boxplot()+labs(title = "Distriution Of Other Wealth Pre and Post Pandemic",xlab="Year",ylab="Net Worth") 

#RACE

#prepandemic 2016
race2<-dfa.race %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2016:Q1"))%>%
  summarise(Net_Worth=mean(Net.worth))
boxplot(race2$Net_Worth~race2$Category,xlab = "Race",ylab = "Net Worth",
        main="Prepandemic Wealth Distribution by Race")

#postpandemic
race3<-dfa.race %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2021:Q3"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(race3$ave_net~race3$Category, xlab = "Race",ylab = "Net Worth",
        main="Post-pandemic Wealth Distribution by Race")

#AGE

#prepandemic 2016
age2<-dfa.age %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2016:Q1"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(age2$ave_net~age2$Category,xlab = "Age",ylab = "Net Worth",
        main="Prepandemic Wealth Distribution by Age")

#postpandemic
age3<-dfa.age %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2021:Q3"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(age3$ave_net~age3$Category, xlab = "Age",ylab = "Net Worth", 
        main="Post-pandemic Wealth Distribution by Age")


#Education Level

#prepandemic 2016
education2<-dfa.education %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2016:Q1"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(education2$ave_net~education2$Category,xlab = "Education Level",ylab = "Net Worth",
        main="Prepandemic Wealth Distribution by Education Level")

#postpandemic
ecucation3<-dfa.education %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2021:Q3"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(ecucation3$ave_net~ecucation3$Category, xlab = "Education Level",ylab = "Net Worth",
        main="Post-pandemic Wealth Distribution by Education Level")

#Income


#prepandemic 2016
income2<-dfa.income %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2016:Q1"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(income2$ave_net~income2$Category,xlab = "Income Level",ylab = "Net Worth",
        main="Prepandemic Wealth Distribution by Income Level")

#postpandemic
income3<-dfa.income %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2021:Q3"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(income3$ave_net~income3$Category, xlab = "Inncome Level",ylab = "Net Worth",
        main="Post-pandemic Wealth Distribution by Income Level")

#Networth

#prepandemic 2016
networth2<-dfa.networth %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2016:Q1"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(networth2$ave_net~networth2$Category,xlab = "Wealth Level",ylab = "Net Worth",
        main="Prepandemic Wealth Distribution by Wealth Level")

#postpandemic
networth3<-dfa.networth %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2021:Q3"))%>%
  summarise(ave_net=mean(Net.worth))
boxplot(networth3$ave_net~networth3$Category, xlab = "Wealth Level",ylab = "Net Worth",
        main="Post-pandemic Wealth Distribution by Wealth Level")

      



