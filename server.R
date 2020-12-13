
shinyServer(function(input, output) {
  

# Reactive Values Configuration -------------------------------------------

  Year_Select <- reactive({input$YearSelect})
  
# Read CSV Upon Action Button ---------------------------------------------
  logbook <- eventReactive(input$get_logbook, {
    fetch_logbook(static = TRUE)
  })

# Display table
  output$table_logbook <-
    DT::renderDataTable({
      logbook()
    })
  
# Render viz_year plot
  output$viz_year <- renderPlot({
    viz_flights_by_year()
    })
  
  

})
