library(shiny)
library(ggplot2)
library(dplyr)
library(R.utils)
library(lubridate)
library(scales)
library(plotly)
library(shinydashboard)
library(gapminder)

# Sample image in first tab
shinyServer(function(input, output) {
  output$meme <- renderImage({
    return(list(
      src = "image/meme.jpg",
      filetype = "image/jpeg",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
})
