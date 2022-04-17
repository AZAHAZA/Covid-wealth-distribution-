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
source("intro.R")
source("graph1.R")
source("graph2.R")
source("summary.R")
source("sources.R")

ui <- navbarPage(
  theme = shinytheme("paper"),
  title = "Political Violence",
  position = "fixed-top",

  # A simple header
  header = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("The Health Impact of Using Tear Gas as Crowd-Control Weapon"),
    hr()
  ),

  # A simple footer
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("Contributor - Chun Hin Matthew So "),
    hr()
  ),

  # The project introduction
  intro,
  # The three charts
  graph1,
  graph2,
  summary,
  sources

)

