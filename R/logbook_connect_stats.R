logbook_connect_stats <- function() {
  
# # Get total flight numbers ----------------------------------------------

stats <-
  logbook %>% 
  summarise(`Number of Flights` = nrow(logbook),
            `Total Hours` = sum(Total, na.rm = TRUE),
            PIC = sum(PIC, na.rm = TRUE)) %>% 
  pivot_longer(cols = c("Number of Flights",
                        "Total Hours",
                        "PIC"),
               values_to = "value")

return(stats)
}
