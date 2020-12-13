fetch_logbook <- function(static=TRUE) {
# get latest logbook ------------------------------------------------------

#require(googlesheets4)
library(lubridate)

# Set column names --------------------------------------------------------
header_spec <-
  c(
    "Date",
    "Aircraft",
    "Reg",
    "DEP",
    "DEST",
    "Remarks",
    "IA",
    "LDG",
    "SEL",
    "MEL",
    "XC",
    "Day",
    "Night",
    "IMC",
    "SIMC",
    "Ground",
    "Dual",
    "PIC",
    "Total"
  )

# # Fetch data --------------------------------------------------------------

if(static == TRUE) {
  logbook <-
    readr::read_csv(file = "./data/logbook_12.10.2020.csv",
                    col_names = header_spec,
                    col_types = cols(
                      Date = col_date(format = "%m/%d/%y")
                    ))

} else {
  
}

# Filter variables --------------------------------------------------------
logbook <-
  logbook %>% 
  select(-MEL, -Remarks, -Ground) 

# Check column requirements -----------------------------------------------
if(is.Date(logbook$Date) == FALSE) {
  logbook <-
    logbook %>% 
    mutate(Date = mdy(Date))
}

# Get unique years --------------------------------------------------------

logbook_Year <- 
  logbook %>% 
  mutate(year = lubridate::year(logbook$Date)) %>% 
  select(year) %>% 
  pull(year) %>%  unique()

return(logbook)
}

