##################################
# Run TTP-related metrics
# Suzanne Dufault
# July 7, 2022
##################################

library(tidyverse)
library(here)
library(furrr)

# TPP Thresholds
theta_lrv <- 0
theta_tv <- 20
tau_lrv <- 0.025
tau_tv <- 0.025

nk <- as.list(c(20,30,40,60,80))
names(nk) <- nk

source(here("analysis", "03_tpp-decisions.R"))
source(here("analysis", "04_ranking-probabilities.R"))
source(here("analysis", "05_compare-v-control.R")) # depends on previous script
source(here("analysis", "06_relapse-counts.R"))