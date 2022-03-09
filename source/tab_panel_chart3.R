# tab_panel_chart3

library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
library("plotly", warn.conflicts = FALSE)
library("leaflet", warn.conflicts = FALSE)
library("ggplot2", warn.conflicts = FALSE)
lint("tab_panel_chart3.R")

wealth_education_dist <- read.csv("../data/dfa-education.csv")

box_data <- wealth_education_dist %>%
  select(Category, Net.worth, Assets) %>%
  rename(Education_Level = Category,
         Net_worth = Net.worth)

select_values <- colnames(box_data)

pie_chart_main_content <- mainPanel(
  plotlyOutput("boxplot")
)

x_input <- selectInput(
  "xvar",
  label = "Variable",
  choices = select_values,
  selected = "Education_Level"
)

y_input <- selectInput(
  "yvar",
  label = "Variable",
  choices = select_values,
  selected = "Assets"
)

color_input <- selectInput(
  "colour",
  label = "Color",
  choices = list("Red" = "red", "cyan", "Blue" = "blue", "Violet" = "purple3")
)

tab_panel_chart3 <- tabPanel(
    "Chart 3",
    tags$div(class = "chart_type", "Boxplot"),
    p("This is a boxplot that show the data distribution of the educational
      level and economic inequality"),
    sidebarLayout(
      sidebarPanel(x_input,
                   y_input,
                   color_input
                   ),
      pie_chart_main_content
    ),
    tags$div(
      tags$br(),
      "Examining the distribution of the educational level and the wealth
      allows us to gain insight to change the situation.
      Utilizing a boxplot can help us to achieve the objective because
      it is effective in showing the range and
      distribution of the data among different categories. According to the
      boxplot, there is a correlation between higher education with wealth.
      The median of the college degrees has more assets and higher net worth
      than all other categories. Therefore, ", strong("providing affordable higher
      education to low-income families will improve social mobility.")
    )
)
