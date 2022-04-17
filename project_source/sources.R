# tab_panel_report

library(shiny)

sources <-tabPanel(
  "Sources and References",
  fluidRow(
    column(
      12,
      includeMarkdown("sources_ref.md")
    )
  )
)
