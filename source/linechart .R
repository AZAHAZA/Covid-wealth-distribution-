library("tidyverse",warn.conflicts = FALSE)
library("plotly",warn.conflicts = FALSE)

wealth_category <- read_csv("../data/dfa-income.csv" ,show_col_types = FALSE)

wealth_dist <- wealth_category %>%
  filter(Date == '2017:Q1' | Date=='2017:Q2'| Date == '2017:Q3' |Date=='2017:Q4' | Date =='2018:Q1'| Date=='2018:Q2'| Date == '2018:Q3' |Date=='2018:Q4'| Date=='2019:Q1'| Date=='2019:Q2'| Date=='2019:Q3'| Date=='2019:Q4'| Date=='2020:Q1'| Date=='2020:Q2'| Date=='2020:Q3'| Date=='2020:Q4'| Date=='2021:Q1'| Date=='2021:Q2'| Date=='2021:Q3')


fig <- plot_ly(
  data = wealth_dist,
  x = ~Date,
  y = ~Assets,
  color = ~Category,
  type = "scatter",
  mode = "lines"
) %>% layout(
    title = "Wealth Distribution prior & during the Pandemic by Income Percentile Groups",
    xaxis = list(title = 'Date'),
    yaxis = list(title = 'Assets')
  )

fig




dfa.income <- read_csv("../data/dfa-income.csv",show_col_types = FALSE)
wealth_dist <- wealth_category %>%
  filter(Date == '2017:Q1' | Date=='2017:Q2'| Date == '2017:Q3' |Date=='2017:Q4' | Date =='2018:Q1'| Date=='2018:Q2'| Date == '2018:Q3' |Date=='2018:Q4'| Date=='2019:Q1'| Date=='2019:Q2'| Date=='2019:Q3'| Date=='2019:Q4'| Date=='2020:Q1'| Date=='2020:Q2'| Date=='2020:Q3'| Date=='2020:Q4'| Date=='2021:Q1'| Date=='2021:Q2'| Date=='2021:Q3')

#RACE:White

pct00to20 <-dfa.income %>%
  filter(Category=='pct00to20')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



pct00to20<-ggplot(pct00to20, aes(Date,Assets))+geom_line()+labs(title = "Distriution Of Wealth Pre and Post Pandemic (pct: 0-20)",xlab="Year",ylab="Net Worth") 
#Race:Black 

pct20to40 <-dfa.income %>%
  filter(Category=='pct20to40')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



pct20to40<-ggplot(pct20to40, aes(Date,Assets))+geom_line()+labs(title = "Distriution Of Wealth Pre and Post Pandemic (pct: 20-40)",xlab="Year",ylab="Net Worth") 
#Race:Hispanic

pct40to60 <-dfa.income %>%
  filter(Category=='pct40to60')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



pct40to60<-ggplot(pct40to60, aes(Date,Assets))+geom_line()+labs(title = "Distriution Of Wealth Pre and Post Pandemic (pct: 40-60)",xlab="Year",ylab="Net Worth") 
#Race:Hispanic
#Race:Other

pct60to80 <-dfa.income %>%
  filter(Category=='pct60to80')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



pct60to80<-ggplot(pct60to80, aes(Date,Assets))+geom_line()+labs(title = "Distriution Of Wealth Pre and Post Pandemic (pct: 60-80)",xlab="Year",ylab="Net Worth") 

pct80to99 <-dfa.income %>%
  filter(Category=='pct80to99')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



pct80to99<-ggplot(pct80to99, aes(Date,Assets))+geom_line()+labs(title = "Distriution Of Wealth Pre and Post Pandemic (pct: 80-99)",xlab="Year",ylab="Net Worth") 

pct99to100 <-dfa.income %>%
  filter(Category=='pct99to100')%>%
  filter(Date =='2018:Q1'| Date=='2019:Q1'| Date=='2020:Q1'| Date=='2021:Q1')



pct99to100<-ggplot(pct99to100, aes(Date,Assets))+geom_line()+labs(title = "Distriution Of Wealth Pre and Post Pandemic (pct: 99-100)",xlab="Year",ylab="Net Worth") 




asset2<-dfa.income %>%
  group_by(Category) %>%
  filter(str_detect(Date, "2016:Q1"))%>%
  summarise(Assets=mean(Assets))

ggplot(asset2, aes(x = Category, y = Assets, group = 1)) +
  ggtitle("Prepandemic Wealth Distribution(assets) by percentage")+
  geom_line() +
  geom_point()

   #postpandemic
  
  asset2<-dfa.income %>%
    group_by(Category) %>%
    filter(str_detect(Date, "2021:Q1"))%>%
    summarise(Assets=mean(Assets))
  
  ggplot(asset2, aes(x = Category, y = Assets, group = 1)) +
    ggtitle("Prepandemic Wealth Distribution(assets) by percentage")+
    geom_line() +
    geom_point()

  #AGE

#prepandemic 2016
  asset3<-dfa.income %>%
    group_by(Category) %>%
    filter(str_detect(Date, "2016:Q1"))%>%
    summarise(`Net worth`=mean(`Net worth`))
  
  ggplot(asset3, aes(x = Category, y = `Net worth`, group = 1))+
    ggtitle("Prepandemic Wealth Distribution (Net Worth) by percentage ")+
    geom_line() +
    geom_point()
  
  #postpandemic
  
  asset3<-dfa.income %>%
    group_by(Category) %>%
    filter(str_detect(Date, "2021:Q1"))%>%
    summarise(`Net worth`=mean(`Net worth`))
  
  ggplot(asset3, aes(x = Category, y = `Net worth`, group = 1))+
    ggtitle("Prepandemic Wealth Distribution (Net Worth) by percentage ")+
    geom_line() +
    geom_point()
  

#Education Level

#prepandemic 2016
  asset4<-dfa.income %>%
    group_by(Category) %>%
    filter(str_detect(Date, "2016:Q1"))%>%
    summarise(`Real estate`=mean(`Real estate`))
  
  ggplot(asset4, aes(x = Category, y = `Real estate`, group = 1))+
    ggtitle("Prepandemic Wealth Distribution (Real estate) by percentage")+
    geom_line() +
    geom_point()
  
  #postpandemic
  
  asset4<-dfa.income %>%
    group_by(Category) %>%
    filter(str_detect(Date, "2021:Q1"))%>%
    summarise(`Real estate`=mean(`Real estate`))
  
  ggplot(asset4, aes(x = Category, y = `Real estate`, group = 1))+
    ggtitle("Prepandemic Wealth Distribution (Real estate) by percentage")+
    geom_line() +
    geom_point()
  
#Income


#prepandemic 2016
  asset5<-dfa.income %>%
    group_by(Category) %>%
    filter(str_detect(Date, "2016:Q1"))%>%
    summarise(`Private businesses`=mean(`Private businesses`))
  
  ggplot(asset5, aes(x = Category, y = `Private businesses`, group = 1))+
    ggtitle("Prepandemic Wealth Distribution (Consumer durables) by percentage")+
    geom_line() +
    geom_point()
  
  #postpandemic
  
  asset5<-dfa.income %>%
    group_by(Category) %>%
    filter(str_detect(Date, "2021:Q1"))%>%
    summarise(`Private businesses`=mean(`Private businesses`))
  
  ggplot(asset5, aes(x = Category, y = `Private businesses`, group = 1))+
    ggtitle("Prepandemic Wealth Distribution (Consumer durables) by percentage")+
    geom_line() +
    geom_point()
  