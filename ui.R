
# Global Options ----------------------------------------------------------

library(shiny)
library(shinythemes)
library(shinyalert)
library(tidyverse)
library(DT)

# UI specification --------------------------------------------------------

ui <-
    navbarPage(
        useShinyalert(),
        title = tags$strong("Fliegster"),
        selected = "Logbook Connect",
        windowTitle = "Flight Logger",
        id = 'navbar',
        inverse = FALSE,
        theme = shinytheme("yeti"),
        tabPanel(
            title = "Logbook Connect", ##
            sidebarLayout(
                sidebarPanel(
                    "Welcome to my logbook analytical platform. As some of you
                    may know, I am a private pilot with over two hundred hours
                    logged. This shiny app helps analyze the flights I have
                    made as a pilot.",
                    br(),
                    br(),
                    "Connect to my logbook by clicking the action button below. 
                    My logbook and flight history will serve as the basis for
                    all further visualizations in this web app. For the time
                    being, this interface loads a static logbook data file that
                    does not get automatically updated after every flight. With
                    time, I will  build a custom API to read in the latest
                    logbook data for analytics.",
                    br(),
                    br(),
                    actionButton(
                        inputId = "get_logbook",
                        label = "Logbook Connect",
                        width = 220
                    ),
                    br(),
                    br(),
                    "In a future version of this application, you will be able
                    to upload your own logbook for custom analytics on your
                    flying history.",), 
                mainPanel(id = "logbook_table", DT::dataTableOutput("table_logbook")
                )
            ) #sidebar layout
        ),
        tabPanel(title = "Visualization",
        sidebarLayout(
            sidebarPanel("First, we investigate the number of hours of flights by
                         month and year. From the drop down below, please select
                         a valid year for analysis.",
                         selectInput(inputId = "YearSelect", label = h3("Select Year"), 
                                     choices = unique(logbook_Year), 
                                     selected = NULL,
                                     multiple = FALSE)),
            mainPanel(plotOutput("viz_year"))
        )),
        tabPanel(title = "Quit", 
                 value="stop", 
                 icon = icon("circle-o-notch"))

    ) #overall UI
