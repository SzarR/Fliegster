
# Global Options ----------------------------------------------------------

library(shiny)
library(shinyalert)
library(tidyverse)
library(DT)
library(shinydashboard)

# UI specification --------------------------------------------------------
ui <- dashboardPage(
    skin = "red",
    dashboardHeader(title = "Logbook Connect"),
    dashboardSidebar(
        width = 200,
        sidebarMenu(
            menuItem("Import Logbook", tabName = "Import Logbook", icon = icon("dashboard")),
            menuItem("Visualization", tabName = "Visualization")
        )
    ),
    dashboardBody()
)

