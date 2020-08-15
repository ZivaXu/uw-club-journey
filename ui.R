library(shinydashboard)
library(shiny)
library(ggplot2)
library(dplyr)
library(R.utils)
library(lubridate)
library(scales)
library(plotly)
library(rsconnect)
library(gapminder)

shinyUI(dashboardPage(
  skin = "purple",
  dashboardHeader(title = "UW Club Journey", titleWidth = 250),
  dashboardSidebar(
    width = 250,
    sidebarMenu(
      id = "sidebar",
      menuItem("My Journey", tabName = "journey", icon = icon("map")),
      menuItem("Clubs", tabName = "clubs", icon = icon("stream")),
      menuItem("Top Chart", tabName = "topchart", icon = icon("chart-line"))
    ),
    uiOutput("style_tag")
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
      # First tab content
      tabItem(
        tabName = "journey",
        align = "center",
        h2(strong("Passport stuff")),
        imageOutput("meme")
      ),
      
      # Second tab content
      tabItem(
        tabName = "clubs",
        h2("Starred Clubs"),
        h2("All Clubs")
      ),
      
      # Third tab content
      tabItem(
        tabName = "topchart",
        h2("Top Users")
      )
    )
  )
))
