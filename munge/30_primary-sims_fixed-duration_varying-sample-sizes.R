###########################################################################
# Primary file for simulating seamless design data from existing log10(TTP)
###########################################################################
library(here)
library(tidyverse)

source(here("munge","31_simulate-data.R"))
source(here("munge","32_analyze-ttp-slope.R", "30_job-file-for-running-on-cluster.R")) # this takes A LONG TIME
source(here("munge","33_nk-60-80-fixed-effects.R")) # add enrolment time
source(here("munge","34_nk-60-survival-outcomes.R")) # adds survival to sample size of 60
source(here("munge","34_nk-80-survival-outcomes.R")) # adds survival to sample size of 80


