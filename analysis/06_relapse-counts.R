######################
# Even
######################

relapse_count_function <- function(simdf, buffer.weeks = 0){
  # "buffer.weeks" added to account for difference durations of TTP follow-up when assessing how many unfavorable outcomes are 
  # expected by the time of the first interim analysis
  
  # set the date date of interim analysis
  interim_date <- simdf %>% 
    filter((week + buffer.weeks + enroll.day/7) == max(week + buffer.weeks + enroll.day/7)) %>% 
    mutate(interim.week = (week + # date of last visit
                             buffer.weeks + # buffer to account for different lengths of TTP follow up
                             enroll.day/7 + #date of enrollment
                             4 + 1)) # 25 days for culture conversion and one week for analysis
  
  temp <- simdf %>% 
    mutate(observed.relapse = ifelse(status == 1 & eventtime <= 52 - duration, 1, 0),
           observed.relapse.date.trial = ifelse(observed.relapse == 1, eventtime + duration + enroll.day/7, NA)) %>% 
    mutate(relapse.interim1 = ifelse(observed.relapse == 1 & observed.relapse.date.trial <= interim_date$interim.week, 1, 
                                     ifelse(observed.relapse == 0, 0, 0))) %>% 
    mutate(Regimen = paste0("Regimen ", regimen),
           `TTP Followup` = max(week) + buffer.weeks) 
  
  counts <- temp %>% 
    group_by(regimen, `TTP Followup`, 
             relapses_observed = (!is.na(observed.relapse.date.trial) & 
                                    observed.relapse.date.trial <= interim_date$interim.week)) %>% 
    summarise(n_relapses = n_distinct(patient.id)) %>%
    filter(relapses_observed == TRUE) %>% 
    dplyr::select(-relapses_observed)
  
  return(counts)
}

# Count relapses
evenTTP_full <- map_dfr(evenTTP[1:500],
                        ~map_dfr(.x, 
                                 ~relapse_count_function(.x),
                                 .id = "setting"),
                        .id = "simulation")
evenTTP_full2 <- map_dfr(evenTTP[501:1000],
                        ~map_dfr(.x, 
                                 ~relapse_count_function(.x),
                                 .id = "setting"),
                        .id = "simulation")

evenTTP_full <- bind_rows(evenTTP_full,
                          evenTTP_full2)
rm(evenTTP_full2)


full_list <- expand_grid(regimen = factor(2:5), duration = c(8,10,12,14,16))

df_relapses_even <- evenTTP_full %>% 
  mutate(rown = row_number()) %>% 
  filter((rown == 1 & regimen == 1) | regimen != 1) %>% 
  dplyr::select(-rown) %>% 
  # just to add in missing rows
  full_join(full_list) %>% 
  arrange(regimen, duration) %>% 
  distinct()

rm(evenTTP_full)
######################
# High-Low
######################

# Count relapses
highlowTTP_full <- map_dfr(highlowTTP[1:500],
                        ~map_dfr(.x, 
                                 ~relapse_count_function(.x),
                                 .id = "setting"),
                        .id = "simulation")
highlowTTP_full2 <- map_dfr(highlowTTP[501:1000],
                         ~map_dfr(.x, 
                                  ~relapse_count_function(.x),
                                  .id = "setting"),
                         .id = "simulation")


highlowTTP_full <- bind_rows(highlowTTP_full,
                          highlowTTP_full2)
rm(highlowTTP_full2)


full_list <- expand_grid(regimen = factor(2:5), duration = c(8,10,12,14,16))

df_relapses_highlow <- highlowTTP_full %>% 
  mutate(rown = row_number()) %>% 
  filter((rown == 1 & regimen == 1) | regimen != 1) %>% 
  dplyr::select(-rown) %>% 
  # just to add in missing rows
  full_join(full_list) %>% 
  arrange(regimen, duration) %>% 
  distinct()
rm(highlowTTP_full)
######################
# High
######################

# Count relapses
highTTP_full <- map_dfr(highTTP[1:500],
                           ~map_dfr(.x, 
                                    ~relapse_count_function(.x),
                                    .id = "setting"),
                           .id = "simulation")
highTTP_full2 <- map_dfr(highTTP[501:1000],
                            ~map_dfr(.x, 
                                     ~relapse_count_function(.x),
                                     .id = "setting"),
                            .id = "simulation")
 

highTTP_full <- bind_rows(highTTP_full,
                             highTTP_full2)
rm(highTTP_full2)


full_list <- expand_grid(regimen = factor(2:5), duration = c(8,10,12,14,16))

df_relapses_high <- highTTP_full %>% 
  mutate(rown = row_number()) %>% 
  filter((rown == 1 & regimen == 1) | regimen != 1) %>% 
  dplyr::select(-rown) %>% 
  # just to add in missing rows
  full_join(full_list) %>% 
  arrange(regimen, duration) %>% 
  distinct()

rm(highTTP_full)

#####################
df_relapses <- list(df_relapses_even = df_relapses_even,
                    df_relapses_high = df_relapses_high,
                    df_relapses_highlow = df_relapses_highlow)

save(df_relapses,
     file = here("data", "analyzed", paste0(Sys.Date(),
                                            "_relapse-counts-by-simulation_",
                                            identifier, ".RData")))
