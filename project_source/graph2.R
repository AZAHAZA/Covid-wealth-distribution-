
library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
 library("plotly", warn.conflicts = FALSE)
 library("leaflet", warn.conflicts = FALSE)
 library("ggplot2", warn.conflicts = FALSE)

teargas <- read_csv("teargas.csv")
teargas_problem <- read_csv("tear_health.csv")

bar_chart_main_content <- mainPanel(
  tableOutput('table'),
  tableOutput('table1'),
  plotlyOutput("barchart"),
  
)



graph2 <- tabPanel(
  "Chart 2",
  tags$div(class = "chart_type", "Tables and Bar Chart"),
  p("The tables and the bar chart show the health impact of chemical irritants"),
  fluidPage(
    bar_chart_main_content,
  )
  ,
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
    "The data from both graphs are from the ", a("BMC Public Health", href = "https://www.biomedcentral.com/about"), ". BMC is open access, peer-reviewed journal. The table displays the number of injuries caused by the chemical irritants. It makes us rethink whether the crowd-control weapon is effective if it causes much harm to others. The Bar chart illustrates the ", a("health issues among 2116 adults during the Portland(OR) Protest", href = "https://bmcpublichealth.biomedcentral.com/articles/10.1186/s12889-021-10859-w"),". According to the Bar chart,  93.7 percent or 2114 respondents reported physical health issues, and 72.4 percent or 1635 respondents reported psychological health issues. Most importantly, chemical irritants have significant health impacts on the eye(88.7 percent and 2001 respondents), nose(79.8 percent and 1802 respondents), lung(74.2 percent and 1674 respondents), and mouth(68.3 percent and 1542 respondents). Nonetheless, the ",a("research article", href = "https://bmcpublichealth.biomedcentral.com/articles/10.1186/s12889-017-4814-6")," from the BMC Public Health emphasized that chemical irritants have significant potential for misuse, which causes unnecessary morbidity and mortality."
  )
  ,
  tags$div(
    tags$br(),
    "The research from ", a("Berkely Public Health and Dr. Rohini Haar", href = "https://publichealth.berkeley.edu/news-media/school-news/are-crowd-control-weapons-dangerous/"),"emphasizes that chemicals irritants and crowd control weapons can injure, maim, and kill. Besides, there is a lack of international law and regulations for using crowd control weapons. The lack of accountability and justification will also cause tremendous damage to the public if law enforcement misuses them. Moreover, these crowd control weapons undermine the freedom of assembly because of the psychological fear of harm inflicted by the crowd control weapons. If it is fired in a crowded demonstration, it can target everyone." 
  ),
  tags$div(
    tags$br(),
    "Finally, the ",a("Centers for Disease Control and Prevention(CDC)", href = "https://emergency.cdc.gov/agent/riotcontrol/factsheet.asp")," concludes the long-term health effect if exposed to large doses of teargas or crowd-control weapons. It includes Blindness, Glaucoma, immediate death due to severe chemical burns to the throat and lungs, and respiratory failure possibly, resulting in death."
  )
)