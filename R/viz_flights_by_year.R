viz_flights_by_year <- function() {
  
  # returns a bar chart by month for a given year
  # where y-axis equates to PIC/DUAL/TOTAL hours, stacked.
  
  # Run graphic code
  
  YearData <- attempt2_eventReactive()
  
  p <- 
    YearData %>%
    ggplot(aes(x = month, y = Total)) +
    geom_bar(stat = "identity") +
    xlab("Month") +
    ylab("Total Logged Flight Hours") +
    theme_minimal()
  
    return(p)
}
