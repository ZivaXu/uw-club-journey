library(shiny)
library(ggplot2)
library(dplyr)
library(R.utils)
library(lubridate)
library(scales)
library(plotly)
library(shinydashboard)
library(gapminder)
library(DT)

# Sample image in first tab
shinyServer(function(input, output) {
  output$meme <- renderImage({
    return(list(
      src = "image/meme.jpg",
      filetype = "image/jpeg",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
  #Club tab
  output$all_clubs <- DT::renderDataTable({
    DT::datatable(all_clubs, colnames=c("Club Name", "Contact Email"), options = list(paging = FALSE))
  })
  
  output$starred_clubs <- renderTable({
    colnames(starred_clubs) <- c("Club Name", "Contact Email")
    starred_clubs
  })
})



