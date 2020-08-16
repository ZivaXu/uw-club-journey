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

shinyServer(function(input, output) {
  # Read task stamp
  task_list <- read.csv("tasks/task-list.csv")
  
  # Output stamp image
  output$teststamp <- renderImage({
    return(list(
      src = "image/stamp/1.png",
      filetype = "image/png",
      width = "100%",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
  output$teststamp2 <- renderImage({
    return(list(
      src = "image/stamp/3.png",
      filetype = "image/png",
      width = "100%",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
  output$teststamp3 <- renderImage({
    return(list(
      src = "image/stamp/5.png",
      filetype = "image/png",
      width = "100%",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
  output$teststamp4 <- renderImage({
    return(list(
      src = "image/stamp/9.png",
      filetype = "image/png",
      width = "100%",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
  output$teststamp5 <- renderImage({
    return(list(
      src = "image/stamp/23.png",
      filetype = "image/png",
      width = "100%",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
  output$teststamp6 <- renderImage({
    return(list(
      src = "image/stamp/48.png",
      filetype = "image/png",
      width = "100%",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
  output$teststamp7 <- renderImage({
    return(list(
      src = "image/stamp/51.png",
      filetype = "image/png",
      width = "100%",
      alt = "Welcome to Trash Panda's Nest!"
    ))
  }, deleteFile = FALSE)
  
  #Tasks tab
  output$rec_tasks <- DT::renderDataTable({
    DT::datatable(rectask1, colnames=c("Task Name", "Description"), options = list(paging = FALSE))
  })
  
  output$my_tasks <- DT::renderDataTable({
    DT::datatable(user_tasklist11, colnames=c("Task Name", "Description", "Completed?"), options = list(paging = FALSE))
  })
  
  #Club tab
  output$all_clubs <- DT::renderDataTable({
    DT::datatable(all_clubs, colnames=c("Club Name", "Contact Email"), options = list(paging = FALSE))
  })
  
  output$starred_clubs <- renderTable({
    colnames(starred_clubs) <- c("Club Name", "Contact Email")
    starred_clubs
  })
})



