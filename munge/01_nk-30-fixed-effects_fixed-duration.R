###########################################################################
# Call in log10(TTP) data and add random duration component
# Separate file per sample size
###########################################################################
source(here("lib","fixed-effects-function.R"))

k <- 5 # number of regimens
d <- c(16)  # durations per regimen (weeks) -- fixed for now at 16 weeks EXCEPT for control
nkd <- 30 # number of participants per regimen and duration at interim
enroll.time.weeks <- (nkd*k*length(d))/10 # enrolling 10 participants per day, aiming for total sample size of nkd*k*d 

#load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/simulated-datasets/2022-01-27_simulated-df_even-increases_random-slope.RData")
load("data/2022-01-27_simulated-df_even-increases_random-slope.RData")
nk_30_even <- df_sims_s1 %>%
  map(~.x[[2]]) %>% # take the 30 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s1) # for space

# load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/simulated-datasets/2022-01-27_simulated-df_cluster-low-high_random-slope.RData")
load("data/2022-01-27_simulated-df_cluster-low-high_random-slope.RData")
nk_30_highlow <- df_sims_s2 %>%
  map(~.x[[2]]) %>% # take the 30 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s2) # for space

# load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/simulated-datasets/2022-01-27_simulated-df_clustered-high_random-slope.RData")
load("data/2022-01-27_simulated-df_clustered-high_random-slope.RData")
nk_30_high <- df_sims_s3 %>%
  map(~.x[[2]]) %>% # take the 30 sample size
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s3) # for space



nk_30_even <- fixed_effects_function(simdata = nk_30_even,
                                     enroll.time.weeks = enroll.time.weeks)

nk_30_highlow <- fixed_effects_function(simdata = nk_30_highlow,
                                     enroll.time.weeks = enroll.time.weeks)

nk_30_high <- fixed_effects_function(simdata = nk_30_high,
                                     enroll.time.weeks = enroll.time.weeks)

nk_30_fixed_effects <- 
  list(nk_30_even = nk_30_even,
       nk_30_highlow = nk_30_highlow,
       nk_30_high = nk_30_high)

save(nk_30_fixed_effects,
     file = here("data", "simulated-datasets", 
                 paste0(Sys.Date(),"_log10ttp-fixed-effects-simulated-data-nk30_fixed-4mo-duration.RData")))

rm(nk_30_even, nk_30_high, nk_30_highlow, nk_30_fixed_effects)
