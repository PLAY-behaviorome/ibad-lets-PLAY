# Script to download/update play-pis.csv data file
library(googlesheets)
play.pis.gs <- gs_title("PLAY-roster")
pis <- gs_read(play.pis.gs, ws="roster")
pis %>% 
  select(Last, First, Gender, Rank, New, Race_eth, Institution_Type, R15_eligible,
         Institution, City, State, Expertise, Collection_role) %>%
  write_csv(., "csv/play-pis.csv")