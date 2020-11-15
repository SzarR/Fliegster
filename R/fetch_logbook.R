fetch_logbook <- function(dummy = TRUE) {
# get latest logbook ------------------------------------------------------
#require(googlesheets4)
require(tidyverse)

# De-authorize ------------------------------------------------------------
googlesheets4::gs4_deauth()

# Set column names --------------------------------------------------------
header_spec <-
  c(
    "Date",
    "Aircraft",
    "Reg",
    "DEP",
    "DEST",
    "Remarks",
    "IAPP",
    "LDGs",
    "SEL",
    "MEL",
    "XC",
    "Day",
    "Night",
    "IMC",
    "S_IMC",
    "Ground",
    "Dual",
    "PIC",
    "Total"
  )

# # Fetch data --------------------------------------------------------------
# logbook_cloud <-
# googlesheets4::read_sheet(
#   "https://docs.google.com/spreadsheets/d/1Y40I5aJPH0zBj-gKRjlwDiTSq3zxDF3mew6G87nFdW4/edit?usp=sharing",
#   col_names = header_spec
# )
if(dummy == TRUE) {
  logbook <-
    readr::read_csv(file = "./data/dummy_data.csv",
                    col_names = header_spec)
} else {
}

# Filter variables --------------------------------------------------------
logbook <-
  logbook %>% 
  select(-MEL, -Remarks, -Ground)

return(logbook)
}

