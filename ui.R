
# Global Options ----------------------------------------------------------

library(shiny)
library(shinyalert)
library(tidyverse)
library(DT)
library(shinydashboard)

# 
# javascript code to collapse box
jscode <- "
shinyjs.collapse = function(boxid) {
$('#' + boxid).closest('.box').find('[data-widget=collapse]').click();
}
"

# UI specification --------------------------------------------------------
ui <- dashboardPage(
    skin = "red",
    dashboardHeader(title = "Logbook Connect"),
    dashboardSidebar(width = 200,
                     sidebarMenu(
                         menuItem(
                             "Import Logbook",
                             tabName = "Import Logbook",
                             icon = icon("dashboard")
                         ),
                         menuItem("Visualization", tabName = "Visualization")
                     )),
    dashboardBody(column(
        width = 8,
        box(
            id = "datalink_panel",
            title = h3("Datalink Connect"),
            width = 6,
            collapsible = TRUE,
            solidHeader = TRUE,
            "For the time being, connecting to my logbook will be required
            to run analyses concerning my flight history. At a later date,
            a data import module will be built that will allow the user
            to upload his or her unique logbook for analysis into this
            web application.",
            br(),
            br(),
            "My flight logbook was saved as a CSV file. The button below
            will establish a secure connection with this CSV file and import
            each row of the flight log as a table into this application. Each
            of the columns of the logbook is sortable, just click on the header
            name to sort the logbook on a particular column.",
            br(),
            br(),
            actionButton(
                inputId = "get_logbook",
                label = "Establish Datalink",
                width = 220)
        )
    ),
    column(
        width = 12,
        box(
            title = h3("Logbook Entries"),
            solidHeader = TRUE,
            width = 12,
            collapsible = TRUE,
            DT::dataTableOutput("table_logbook")
        )
    ))
)

