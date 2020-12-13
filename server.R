# 
# shinyServer(function(input, output) {
# 
# # Reactive Values Configuration -------------------------------------------
# 
#   #Year_Select <- reactive({input$YearSelect})
#   
# # Read CSV Upon Action Button ---------------------------------------------
#   logbook <- eventReactive(input$get_logbook, {
#     fetch_logbook(static = TRUE)
#   })
# 
# # Display table
#   output$table_logbook <-
#     DT::renderDataTable({
#       logbook()
#     })
#   
# # Render viz_year plot
#   output$viz_year <- renderPlot({
#     viz_flights_by_year()
#     })
#   
# # Another attempt
#   attempt2_eventReactive <- eventReactive(input$YearSelect,
#                                           {
#                                             logbook %>% 
#                                               filter(lubridate::year(logbook$Date) == input$YearSelect) %>%
#                                               mutate(month = month.abb[lubridate::month(Date)]) %>%
#                                               mutate(month = factor(month, levels = month.abb)) %>%
#                                               group_by(month, .drop = FALSE) %>% 
#                                               summarise(Total = sum(Total, na.rm = TRUE))
#                                           })
# 
# })

server <- function(input, output) {

  # Read CSV Upon Action Button ---------------------------------------------
    logbook <- eventReactive(input$get_logbook, {
      fetch_logbook(static = TRUE)
    })
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}
