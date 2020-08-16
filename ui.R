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
library(sass)
library(DT)

sass(
  sass_file("passport.scss"), 
  output = "www/passport.css"
)

shinyUI(dashboardPage(
  skin = "purple",
  dashboardHeader(title = "UW Club Journey", titleWidth = 250),
  dashboardSidebar(
    width = 250,
    sidebarMenu(
      id = "sidebar",
      menuItem("My Journey", tabName = "journey", icon = icon("map")),
      menuItem("Clubs", tabName = "clubs", icon = icon("stream")),
      menuItem("Top Chart", tabName = "topchart", icon = icon("chart-line")),
      menuItem("Sign In/Up", tabName = "signin", icon = icon("user"))
    ),
    uiOutput("style_tag")
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "passport.css")
    ),
    tabItems(
      # First tab content
      tabItem(
        tabName = "journey",
        align = "center",
        h2(strong("My UW Club Journey")),
        # render turn.js
          # render each stamp
        fluidRow(tags$div(class="cover",
                          tags$div(class="book",
                                   tags$label(`for`="page-1", class="book__page book__page--1", HTML("<img class='cover-image' src='https://i.pinimg.com/564x/47/f7/b6/47f7b639b546a284092b20ceae869416.jpg'>")),
                                   tags$label(`for`="page-2", class="book__page book__page--",
                                              tags$div(class="page__content",
                                                       tags$h1(class="page__content-title", "To be continued..."),
                                                       tags$div(class="stamplist", style="filter: grayscale(100%);-webkit-filter: grayscale(100%);",
                                                                imageOutput("teststamp5", width="30%", height="30%"),
                                                                imageOutput("teststamp6", width="30%", height="30%"),
                                                                imageOutput("teststamp7", width="30%", height="30%")
                                                       ),
                                                       tags$div(class="page__number", "3")
                                                       )),
                                   tags$input(type="radio", name="page", id="page-1"),
                                   tags$input(type="radio", name="page", id="page-2"),
                                   tags$label(class="book__page book__page--2",
                                              tags$div(class="book__page-front",
                                                       tags$div(class="page__content",
                                                                tags$h1(class="page__content-book-title", "UW Club Journey"),
                                                                tags$h2(class="page__content-author", "A Happy Husky"),
                                                                tags$div(class="page__content-copyright", tags$p("The University of Washington"), tags$p("2020 - 2021"))
                                                                )),
                                              tags$div(class="book__page-back",
                                                       tags$div(class="page__content",
                                                                tags$h1(class="page__content-title", "Earned Badges"),
                                                                tags$div(class="stamplist",
                                                                         imageOutput("teststamp", width="30%", height="30%"),
                                                                         imageOutput("teststamp2", width="30%", height="30%"),
                                                                         imageOutput("teststamp3", width="30%", height="30%"),
                                                                         imageOutput("teststamp4", width="30%", height="30%")
                                                                         ),
                                                                tags$div(class="page__number", "2")))
                                              )
                                   )))
      ),
      
      # Second tab content
      tabItem(
        tabName = "clubs",
        h2("Starred Clubs"),
        tableOutput(outputId = "starred_clubs"),
        h2("All Clubs"),
        dataTableOutput(outputId = "all_clubs")
      ),
      
      # Third tab content
      tabItem(
        tabName = "topchart",
        h2("Top Users"),
        p("Hover on the graph to see the task counts for each club!!"),
        mainPanel(
          plotlyOutput(outputId = "top_20_club")
        )
      ),
      
      # Fourth tab content
      tabItem(
        tabName = "signin",
        #box(width = 7, h2("Sign In")),
        align = "center",
        tags$h2("LOG IN", class = "text-center", style = "padding-top: 0;color:#333; font-weight:600;"),
        textInput("userName", placeholder="Username", label = tagList(icon("user"), "Username")),
        passwordInput("passwd", placeholder="Password", label = tagList(icon("unlock-alt"), "Password"))
      )
    )
  )
))
