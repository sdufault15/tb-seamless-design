###########################################################################
# Primary file for simulating seamless design data from existing log10(TTP)
###########################################################################
library(here)
library(tidyverse)

source(here("munge","41_nk-40-fixed-effects_fixed-duration.R"))
source(here("munge","42_nk-40-survival-outcomes.R")) # this takes a few hours to run - would be better on cluster
