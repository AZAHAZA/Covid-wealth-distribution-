# tab_panel_chart1
library(shiny)
 library(lintr)
 library("tidyverse", warn.conflicts = FALSE)
 library("plotly", warn.conflicts = FALSE)
 library("leaflet", warn.conflicts = FALSE)
 library("ggplot2", warn.conflicts = FALSE)
  #lint("tab_panel_chart1.R")

  protest_data <- read_csv("protest.csv")
  
  police_brutaility <- read_csv("https://raw.githubusercontent.com/washingtonpost/data-police-shootings/master/fatal-police-shootings-data.csv")
  
  No_body_camera <- police_brutaility %>%
    select(date, manner_of_death, armed, signs_of_mental_illness,flee, body_camera, threat_level,body_camera) %>%
    mutate(date = gsub("\\-.*","",date)) %>%
    filter(body_camera == "FALSE") %>%
    group_by(date) %>%
    summarize(
      `No Body Camera` = n()
    )
  
  Not_immediate_threat <- police_brutaility %>%
    select(date, manner_of_death, armed, signs_of_mental_illness,flee, body_camera, threat_level) %>%
    mutate(date = gsub("\\-.*","",date)) %>%
    filter(threat_level != "attack") %>%
    group_by(date) %>%
    summarize(
      `Not Immediate Threat` = n()
      )
  
  Not_fleeing <- police_brutaility %>%
    select(date, manner_of_death, armed, signs_of_mental_illness,flee, body_camera) %>%
    mutate(date = gsub("\\-.*","",date)) %>%
    filter(flee != "car") %>%
    filter(flee != "Car") %>%
    filter(flee != "Foot") %>%
    group_by(date) %>%
    summarize(
      `Not Fleeing` = n()
      )
  
  non_letal_weapon <- police_brutaility %>%
    select(date, manner_of_death, armed, signs_of_mental_illness,flee, body_camera,threat_level) %>%
    mutate(date = gsub("\\-.*","",date)) %>%
    filter(threat_level != "attack") %>%
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
    filter(armed != "samurai sword") %>%
    group_by(date) %>%
    summarize(
      `Non-Letal Weapon` = n()
    )
  
  data_unarmed_trend_data <- police_brutaility %>%
    select(date, manner_of_death, armed, signs_of_mental_illness) %>%
    mutate(date = gsub("\\-.*","",date)) %>%
    filter(armed == "unarmed") %>%
    group_by(date) %>%
    summarize(
      Unarmed = n()
    )
  
  combined_data <- left_join(Not_immediate_threat, Not_fleeing, by = "date")
  combined_data <- left_join(combined_data, non_letal_weapon, by = "date")
  combined_data <- left_join(combined_data, data_unarmed_trend_data, by = "date")
  combined_data <- left_join(combined_data, No_body_camera, by = "date")
  
  multilinedata <- combined_data %>%
    gather(
      key = "Type",
      value = population,
      `Not Immediate Threat`,
      `Not Fleeing`,
      `Non-Letal Weapon`,
      Unarmed,
      `No Body Camera`
    )
  
  trend_data <- protest_data %>%
    select(year, protest) %>%
    group_by(year) %>%
    summarise(
      Protest = sum(protest, na.rm = TRUE)
    )

  line_chart_main_content <- mainPanel(
    plotlyOutput("linechart"),
    plotlyOutput("linechart1")
  )
  
  
  slider <- sliderInput(
    inputId = "date",
    label = "Year Range",
    min = min(trend_data$year),
    max = max(trend_data$year),
    value = c(min(trend_data$year),
              max(trend_data$year))
  )

  graph1 <- tabPanel(
  "Chart 1",
  tags$div(class = "chart_type", "Line Graph"),
  p("The line graphs below show the number of protests worldwide and the number of police brutality"),
  sidebarLayout(
    sidebarPanel(slider
                 ),
    line_chart_main_content,
  ),
  tags$div(
    tags$br(),
  ),
  tags$div(
    tags$br(),
  ),
  tags$div(
    tags$br(),
  ),
  tags$div(
    tags$br(),
  ),
  tags$div(
    tags$br(),
    "The", a("data", href = "https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/HTTWYL"), "from Figure 1 is from the", a("Harvard Dataverse", href = "https://support.dataverse.harvard.edu"), ". 
    According to Figure 1, the number of protests worldwide has had an increasing trend since 1990. 
    The sharp decrease in protests from 2019 to 2020 is probably because of the worldwide pandemic restrictions,
    yet, the number still has a general upward trend."
    ),
  tags$div(
    tags$br(),
    "The data from Figure 2 is from ", a("Washington Post's database", href = "https://www.washingtonpost.com/graphics/investigations/police-shootings-database/"),". The database has been tracking police brutality since 2015. According to figure 2, police not having a body camera has caused the majority of death. Besides, many suspects in the dataset neither fleed nor carried lethal weapons. It seems unreasonable that they got shot by law enforcement. "
  ),tags$div(
    tags$br(),
"The maximum point in Figure 1 correlates with the highest point in Figure2. With the increasing number of protests accompanied by police brutality, the growing concern for overusing crowd control weapons in protest will become the new type of police brutality."
  )
 )
