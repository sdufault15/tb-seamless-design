#########################
# Updated simulation file
# Suzanne M. Dufault
# Initiated: June 27, 2023
# Updated: June 27, 2023
#########################
library(here)
library(tidyverse)
library(MASS)
library(simsurv)
library(furrr)
library(future)

#################################
# Global conditions
#################################
k <- 5 # number of regimens
d <- c(16)  # durations per regimen (weeks) -- fixed for now at 16 weeks EXCEPT for control
nkd <- c(20,30,40,60,80) # number of participants per regimen and duration at interim
nsims <- 1000

# Simulate TTP data
source(here("munge", "01_simulate-ttp-data.R"))

# Simulate Fixed Effects data
source(here("munge", "02_add-fixed-effects.R"))

# Simulate unfavorable outcome data
source(here("munge", "03_simulate-survival-outcomes.R"))
