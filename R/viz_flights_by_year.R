viz_flights_by_year <- function() {
  
  # returns a bar chart by month for a given year
  # where y-axis equates to PIC/DUAL/TOTAL hours, stacked.
  
  # specify requirements
  req(logbook)
  req(logbook_Year)
  
  # Run graphic code
  viz_year <- 
  logbook %>% 
    filter(lubridate::year(logbook$Date) == Year_Select) %>%
    mutate(month = month.abb[lubridate::month(Date)]) %>%
    mutate(month = factor(month, levels = month.abb)) %>%
    group_by(month, .drop = FALSE) %>% 
    summarise(Total = sum(Total, na.rm = TRUE)) %>%
    ggplot(aes(x = month, y = Total)) +
    geom_bar(stat = "identity") +
    xlab("Month") +
    ylab("Total Logged Flight Hours") +
    theme_minimal()
    
    return(viz_year)
}
