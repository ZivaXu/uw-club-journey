library(shiny)
library(ggplot2)
library(dplyr)
library(R.utils)
library(lubridate)
library(scales)
library(plotly)
library(shinydashboard)
library(gapminder)

shinyServer(function(input, output) {
  # Read task stamp
  task_list <- read.csv("tasks/task-list.csv")
  # Output stamp image
  output$one <- renderImage({
    return(list(
      src = "image/stamp/1.png",
      filetype = "image/png",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
})
