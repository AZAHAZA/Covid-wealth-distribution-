#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("DT")
library("shinythemes")
source("tab_panel_intro.R")
source("tab_panel_chart1.R")
source("tab_panel_chart2.R")
source("tab_panel_chart3.R")
source("tab_panel_summary.R")
source("tab_panel_report.R")

ui <- navbarPage(
  theme = shinytheme("slate"),
  title = "Economic Inequality",
  position = "fixed-top",

  # A simple header
  header = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("Economic Inequality and its Dynamics in the United States"),
    hr()
  ),

  # A simple footer
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("INFO-201 (Winter 2022) Group: AD-4"),
    hr()
  ),

  # The project introduction
  tab_panel_intro,
  includeCSS("Project_CSS_styles.css"),
  # The three charts
  tab_panel_chart1,
  tab_panel_chart2,
  tab_panel_chart3,

  # The project summary
  tab_panel_summary,

  # The project report
  tab_panel_report
)

