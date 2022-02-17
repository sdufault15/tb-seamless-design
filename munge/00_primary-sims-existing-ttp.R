###########################################################################
# Primary file for simulating seamless design data from existing log10(TTP)
###########################################################################
library(here)
library(tidyverse)

source(here("munge","01_nk-30-fixed-effects.R"))
source(here("munge","02_nk-30-survival-outcomes.R")) # this takes a few hours to run - would be better on cluster
