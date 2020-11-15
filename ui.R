# Global Options ----------------------------------------------------------

library(shiny)
library(shinythemes)
library(shinyalert)
library(googlesheets4)
library(tidyverse)
library(DT)

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
            title = "Logbook Connect",
            sidebarLayout(
                sidebarPanel(
                    "Connect to my logbook by clicking the action button below. 
                    It will establish a connection with the latest version of my 
                    logbook. As my logbook is stored on Google Sheets, and I 
                    manually update it after every flight, the button below 
                    will download this data and parse it into a table on the 
                    left hand side.",
                    br(),
                    br(),
                    actionButton(
                        inputId = "get_logbook",
                        label = "Logbook Connect",
                        width = 220
                    ),
                    br(),
                    br(),
                    "You are also able to upload your own logbook below. 
                    An internal QC process will ensure your logbook is 
                    consistent with the expected format.",
                    fileInput(
                        inputId = "task",
                        label = "",
                        accept = ".csv",
                        width = 475,
                        placeholder = "Upload a valid CSV file"
                    )), 
                mainPanel(id = "logbook_table", DT::dataTableOutput("table_logbook")
                )
            ) #sidebar layout
        ),
        tabPanel(title = "Quit", 
                 value="stop", 
                 icon = icon("circle-o-notch"))
        
    ) #overall UI
