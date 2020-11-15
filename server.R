
library(shiny)

shinyServer(function(input, output) {

# Experiment
#values <<- reactiveValues(logbook = NULL)
  
# Read CSV Upon Action Button ---------------------------------------------
  logbook <- eventReactive(input$get_logbook, {
    fetch_logbook(dummy = TRUE)
  })

# Display table
  output$table_logbook <-
    DT::renderDataTable({
      logbook()
    })

})
