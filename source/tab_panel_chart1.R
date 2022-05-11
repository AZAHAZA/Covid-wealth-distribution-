# tab_panel_chart1
library(shiny)
 library(lintr)
 library("tidyverse", warn.conflicts = FALSE)
 library("plotly", warn.conflicts = FALSE)
 library("leaflet", warn.conflicts = FALSE)
 library("ggplot2", warn.conflicts = FALSE)
  lint("tab_panel_chart1.R")
  wealth_race <- read_csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-AZAHAZA/main/data/dfa-race.csv")
  
  total_assets <- wealth_race %>%
    select(Assets) %>%
    summarize(
      Assets = sum(Assets, na.rm = TRUE)
    ) %>%
    pull(Assets)
  
  total_net_worth <- wealth_race %>%
    rename(Net_worth = `Net worth`) %>%
    select(Net_worth) %>%
    summarize(
      Net_worth = sum(Net_worth, na.rm = TRUE)
    ) %>%
    pull(Net_worth)
  
  proportion <- wealth_race %>%
    select(Category, Assets, `Net worth`) %>%
    group_by(Category) %>%
    rename(Net_worth = `Net worth`,
           Race = Category
           ) %>%
    summarize(
      Assets = sum(Assets, na.rm = TRUE),
      Net_worth = sum(Net_worth, na.rm = TRUE)) %>%
    mutate(
      proportion_wealth = Assets / total_assets,
      proportion_Net_worth = Net_worth / total_net_worth
    )
    
select_values <- colnames(proportion)

bar_chart_main_content <- mainPanel(
  plotlyOutput("barchart")
)

x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = select_values,
  selected = "Race"
)

y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = select_values,
  selected = "Assets"
)

color_input <- selectInput(
  "color",
  label = "Color",
  choices = list("Red" = "red", "cyan", "Blue" = "blue", "Violet" = "purple3")
)

tab_panel_chart1 <- tabPanel(
    "Chart 1",
    tags$div(class = "chart_type", "Bar Chart"),
    p("This is a bar chart that illustrates the magnitude
      of income inequality among different
      races in the United States."),
    sidebarLayout(
      sidebarPanel(x_input,
                   y_input,
                   color_input),
      bar_chart_main_content,
    ),
    tags$div(
      tags$br(),
      "Our group wants to examine wealth distribution among different races.
      Since the bar chart is effective in showing the
      distribution of categorical data and numerical data,
      it is appropriate to employ the chart in our analysis.
      We also include the interactive select input to allow
      the user to choose which variable to display.
      According to the chart, White Americans occupied "
      , strong("more than 80 percent"), " of the wealth in the nation.
      However, none of the minority groups has exceeded more
      than 10 percent of the total wealth.
      It is very concerning the effect of wealth inequality
      on the minorities, especially during the
      pandemic when unemployment surged due to lockdown.
      They have less disposable income than White Americans,
      which cause their life more difficult than before. "
    )
)
