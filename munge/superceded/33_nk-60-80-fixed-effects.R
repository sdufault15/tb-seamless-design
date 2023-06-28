###########################################################################
# Call in log10(TTP) data and add random duration component
# Separate file per sample size
###########################################################################
source(here("lib","fixed-effects-function.R"))

k <- 5 # number of regimens
d <- c(16)  # durations per regimen (weeks) -- fixed for now, except for in control arm
nkd <- 30 # number of participants per regimen and duration at interim
enroll.time.weeks <- (nkd*k*length(d))/10 # enrolling 10 participants per day, aiming for total sample size of nkd*k*d 

files <- file.info(list.files(here("data", "simulated-datasets/"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_even-increases_nk60-80"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

nk_60_even <- df_sims_s1 %>%
  map(~.x[[1]]) %>% # take the 60 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

nk_80_even <- df_sims_s1 %>%
  map(~.x[[2]]) %>% # take the 80 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s1) # for space

files <- file.info(list.files(here("data", "simulated-datasets/"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_cluster-low-high_nk60-80"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

nk_60_highlow <- df_sims_s2 %>%
  map(~.x[[1]]) %>% # take the 60 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

nk_80_highlow <- df_sims_s2 %>%
  map(~.x[[2]]) %>% # take the 60 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s2) # for space

files <- file.info(list.files(here("data", "simulated-datasets/"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_clustered-high_nk60-80"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

nk_60_high <- df_sims_s3 %>%
  map(~.x[[1]]) %>% # take the 60 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

nk_80_high <- df_sims_s3 %>%
  map(~.x[[2]]) %>% # take the 60 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s3) # for space

nk_60_even <- fixed_effects_function(simdata = nk_60_even,
                                     d = d,
                                     nkd = nkd,
                                     enroll.time.weeks = enroll.time.weeks)

nk_60_highlow <- fixed_effects_function(simdata = nk_60_highlow,
                                        d = d,
                                        nkd = nkd,
                                        enroll.time.weeks = enroll.time.weeks)

nk_60_high <- fixed_effects_function(simdata = nk_60_high,
                                     d = d,
                                     nkd = nkd,
                                     enroll.time.weeks = enroll.time.weeks)

nk_60_fixed_effects <- 
  list(nk_60_even = nk_60_even,
       nk_60_highlow = nk_60_highlow,
       nk_60_high = nk_60_high)

save(nk_60_fixed_effects,
     file = here("data", "simulated-datasets", 
                 paste0(Sys.Date(),"_log10ttp-fixed-effects-simulated-data-nk60.RData")))

rm(nk_60_even, nk_60_high, nk_60_highlow, nk_60_fixed_effects)

nk_80_even <- fixed_effects_function(simdata = nk_80_even,
                                     d = d,
                                     nkd = nkd,
                                     enroll.time.weeks = enroll.time.weeks)

nk_80_highlow <- fixed_effects_function(simdata = nk_80_highlow,
                                        d = d,
                                        nkd = nkd,
                                        enroll.time.weeks = enroll.time.weeks)

nk_80_high <- fixed_effects_function(simdata = nk_80_high,
                                     d = d,
                                     nkd = nkd,
                                     enroll.time.weeks = enroll.time.weeks)

nk_80_fixed_effects <- 
  list(nk_80_even = nk_80_even,
       nk_80_highlow = nk_80_highlow,
       nk_80_high = nk_80_high)

save(nk_80_fixed_effects,
     file = here("data", "simulated-datasets", 
                 paste0(Sys.Date(),"_log10ttp-fixed-effects-simulated-data-nk80.RData")))

rm(nk_80_even, nk_80_high, nk_80_highlow, nk_80_fixed_effects)
