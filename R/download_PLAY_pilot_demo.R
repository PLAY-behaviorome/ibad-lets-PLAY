library(databraryapi)
library(tidyverse)

this.vol <- 444
vol.444 <- databraryapi::download_csv(this.vol)

vol.444 %>%
  select(session.date, session.release,
         participant.ID, participant.gender,
         participant.race, participant.ethnicity,
         participant.gestational.age,
         participant.birth.weight,
         participant.disability,
         participant.language,
         group.name) %>%
  write_csv(path = "csv/play-pilot-demographics.csv")