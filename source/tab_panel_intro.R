# tab_panel_intro

library(shiny)
setwd("~/Desktop/final-project-starter-AZAHAZA/source")
tab_panel_intro <-tabPanel(
    "Introduction",
    HTML('<center><img src="https://images.squarespace-cdn.com/content/v1/57d9e959d482e972e8434364/1479428409998-2GSOXSQY8AE6H0P0C2FP/image-asset.png";width="400px"; height = "400px"></center>'),
    tags$div(
      tags$br(),
      "Economic inequality is one of the largest issues currently facing the United States and is at the root 
      of many social issues. By looking into such inequality, we are able to examine people’s quality of life 
      and predict determinants of the health and well-being of individuals and families.  Over the past two 
      years, the Covid-19 pandemic has place increased strain on many families as businesses closed and people
      got sick.  The intentions of our project were to determine the effect that Covid-19 had on inequality in 
      the United States across various groups including race, level of education and level of income. The ", 
      a("data", href = "https://www.federalreserve.gov/releases/z1/dataviz/dfa/distribute/chart/#quarter:128;series:Net%20worth;demographic:networth;population:all;units:levels;range:2006.3,2021.3"),"
      used in this data set details individual income levels for different groups and was collected by the National
      Opinion Research Center (NORC) at the University of Chicago. The data is also sponsored by the Federal Reserve
      Board in cooperation with the Department of the Treasury. More information the source of the data 
      and the SCF can be found at this ", a("link", href = "https://www.federalreserve.gov/econres/aboutscf.htm")
    )
)


