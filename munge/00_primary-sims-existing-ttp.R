###########################################################################
# Primary file for simulating seamless design data from existing log10(TTP)
###########################################################################
library(here)
library(tidyverse)



load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/simulated-datasets/2022-01-27_simulated-df_even-increases_random-slope.RData")

nk_30 <- df_sims_s1[1] %>%
  map(~.x[[2]]) %>%
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer
