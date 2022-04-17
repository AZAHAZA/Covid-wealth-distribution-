
library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
 library("plotly", warn.conflicts = FALSE)
 library("leaflet", warn.conflicts = FALSE)
 library("ggplot2", warn.conflicts = FALSE)

police_brutaility <- read_csv("https://raw.githubusercontent.com/washingtonpost/data-police-shootings/master/fatal-police-shootings-data.csv")

General <- police_brutaility

Not_fleeing <- police_brutaility %>%
  select(date, manner_of_death, armed, signs_of_mental_illness,flee, body_camera) %>%
  mutate(date = gsub("\\-.*","",date)) %>%
  filter(flee != "car") %>%
  filter(flee != "Car") %>%
  filter(flee != "Foot")

non_letal_weapon <- police_brutaility %>%
  select(date, manner_of_death, armed, signs_of_mental_illness,flee, body_camera) %>%
  mutate(date = gsub("\\-.*","",date)) %>%
  filter(armed != "gun") %>%
  filter(armed != "guns and explosives") %>%
  filter(armed != "gun and car") %>%
  filter(armed != "gun and knife") %>%
  filter(armed != "gun and machete") %>%
  filter(armed != "gun and vehicle") %>%
  filter(armed != "gun and sword") %>%
  filter(armed != "vehicle and gun") %>%
  filter(armed != "hatchet and gun") %>%
  filter(armed != "machete and gun") %>%
  filter(armed != "sword") %>%
  filter(armed != "samurai sword")


data_unarmed <- police_brutaility %>%
  select(date, manner_of_death, armed, signs_of_mental_illness) %>%
  mutate(date = gsub("\\-.*","",date)) %>%
  filter(armed == "unarmed")


data_unarmed_trend_data <- police_brutaility %>%
  select(date, manner_of_death, armed, signs_of_mental_illness) %>%
  mutate(date = gsub("\\-.*","",date)) %>%
  filter(armed == "unarmed") %>%
  group_by(date) %>%
  summarize(
    violence = n()
  )

bar_chart_main_content <- mainPanel(
  plotlyOutput("barchart")
)

col <- teargas %>%
  select(population,Percentage)

graph2 <- tabPanel(
  "Chart 2",
  sidebarLayout(
    sidebarPanel(
    ),
    bar_chart_main_content,
  )
)

