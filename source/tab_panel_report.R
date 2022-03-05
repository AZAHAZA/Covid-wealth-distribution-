# tab_panel_report

library(shiny)

tab_panel_report <-tabPanel(
  "Report",
  fluidRow(
    column(
      12,
      includeMarkdown("../docs/report.md")
    )
  )
)
