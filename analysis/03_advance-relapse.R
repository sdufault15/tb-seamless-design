library(here)
library(tidyverse)
library(furrr)

# load(here("data", "simulated-datasets", "2022-02-24_full-data-nk30-survival-97.RData"))

even_relapse <- nk_30_outcome_1$nk_30_even
high_relapse <- nk_30_outcome_1$nk_30_high
highlow_relapse <- nk_30_outcome_1$nk_30_highlow
rm(nk_30_outcome_1)

dfsim <- even_relapse[[1]]$s90.situation1

relapse_function <- function(dfsim){
  # date of interim analysis
  interim_date <- dfsim %>% 
    filter((week + enroll.day/7) == max(week + enroll.day/7)) %>% 
    mutate(interim.week = (week + # date of last visit
                             enroll.day/7 + #date of enrollment
                             4)) # 25 days for culture conversion
  
  temp <- dfsim %>% 
    dplyr::select(patient.id, eventtime, status, duration, regimen, enroll.day) %>% 
    distinct() %>% 
    mutate(post.treatment.follow.up.duration = 52 - duration) %>% 
    mutate(eventtime.patient.time = 
             eventtime + #when the event occurred in atrisk period
             duration,  # how long they were not at risk 
           eventtime.cal.time = 
             eventtime + #when the event occurred in atrisk period
             duration +  # how long they were not at risk 
             enroll.day/7) %>%  # when they enrolled
    mutate(event.observed.interim1 = ifelse(status == 1 & # if there was an event
                                              eventtime.patient.time <= post.treatment.follow.up.duration & # and it occurred while under follow up observation
                                              eventtime.cal.time <= interim_date$interim.week,# and it occurred before interim 1
                                            1, 0))
  
  temp %>% 
    group_by(regimen) %>% 
    summarise(n_relapse_interim1 = sum(event.observed.interim1))
}

plan(multisession)
t1.s90.situation1.even <- map(even_relapse, ~.x$s90.situation1) %>% 
  future_map_dfr(~relapse_function(.x),
          .id = "sim") %>% 
  mutate(ttp.condition = "even")
t1.s90.situation1.high <- map(high_relapse, ~.x$s90.situation1) %>% 
  future_map_dfr(~relapse_function(.x),
                 .id = "sim") %>% 
  mutate(ttp.condition = "high")
t1.s90.situation1.highlow <- map(highlow_relapse, ~.x$s90.situation1) %>% 
  future_map_dfr(~relapse_function(.x),
                 .id = "sim") %>% 
  mutate(ttp.condition = "highlow")

s90.situation1.results <- bind_rows(t1.s90.situation1.even,
                                    t1.s90.situation1.high,
                                    t1.s90.situation1.highlow)

save(s90.situation1.results,
     file = here("data","analyzed",
                 paste0(Sys.Date(), "_s90-situation1-results_nk30", identifier, ".RData")))
beepr::beep()


plan(multisession)
t1.s90.situation2.even <- map(even_relapse, ~.x$s90.situation2) %>% 
  future_map_dfr(~relapse_function(.x),
                 .id = "sim") %>% 
  mutate(ttp.condition = "even")
t1.s90.situation2.high <- map(high_relapse, ~.x$s90.situation2) %>% 
  future_map_dfr(~relapse_function(.x),
                 .id = "sim") %>% 
  mutate(ttp.condition = "high")
t1.s90.situation2.highlow <- map(highlow_relapse, ~.x$s90.situation2) %>% 
  future_map_dfr(~relapse_function(.x),
                 .id = "sim") %>% 
  mutate(ttp.condition = "highlow")

s90.situation2.results <- bind_rows(t1.s90.situation2.even,
                                    t1.s90.situation2.high,
                                    t1.s90.situation2.highlow)

save(s90.situation2.results,
     file = here("data","analyzed",
                 paste0(Sys.Date(), "_s90-situation2-results_nk30", identifier, ".RData")))
beepr::beep()


plan(multisession)
t1.s90.situation3.even <- map(even_relapse, ~.x$s90.situation3) %>% 
  future_map_dfr(~relapse_function(.x),
                 .id = "sim") %>% 
  mutate(ttp.condition = "even")
t1.s90.situation3.high <- map(high_relapse, ~.x$s90.situation3) %>% 
  future_map_dfr(~relapse_function(.x),
                 .id = "sim") %>% 
  mutate(ttp.condition = "high")
t1.s90.situation3.highlow <- map(highlow_relapse, ~.x$s90.situation3) %>% 
  future_map_dfr(~relapse_function(.x),
                 .id = "sim") %>% 
  mutate(ttp.condition = "highlow")

s90.situation3.results <- bind_rows(t1.s90.situation3.even,
                                    t1.s90.situation3.high,
                                    t1.s90.situation3.highlow)

save(s90.situation3.results,
     file = here("data","analyzed",
                 paste0(Sys.Date(), "_s90-situation3-results_nk30", identifier, ".RData")))
beepr::beep()
