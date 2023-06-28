###########################################################################
# Primary file for simulating seamless design data from existing log10(TTP)
###########################################################################
library(here)
library(tidyverse)

source(here("munge","21_nk-30-fixed-effects_fixed-duration.R"))
source(here("munge","22_nk-30-survival-outcomes_fixed-durations.R")) # this takes a few hours to run - would be better on cluster
