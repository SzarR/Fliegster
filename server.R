
shinyServer(function(input, output) {
  
# Read CSV Upon Action Button ---------------------------------------------
  logbook <- eventReactive(input$get_logbook, {
    fetch_logbook(static = TRUE) #
  })

# Display table
  output$table_logbook <-
    DT::renderDataTable({
      logbook()
    })
  
# Render viz_year plot
  output$viz_year <-
    renderPlot({
      graph1 <- viz_flights_by_year()
    })
  
  # Capture year.
  observeEvent(input$YearSelect,
               {
                 Year_Select <<- input$YearSelect
               })

})
