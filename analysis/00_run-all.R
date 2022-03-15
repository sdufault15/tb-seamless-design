########################
# Primary File
########################
library(here)
library(tidyverse)

# Variable durations
# load(here("data", "simulated-datasets","2022-02-24_full-data-nk30-survival-97.RData"))
# identifier <- "var-duration"
# source(here("analysis", "01_relapse-counts.R"))
# source(here("analysis", "02_advance-ttp.R"))
# source(here("analysis", "03_advance-relapse.R"))

## THIS NEEDS TO BE UPDATED
# CHANGES WERE LOST IN OS UPDATE :(


# Fixed 4-mo duration, 30 participants per arm
load(here("data", "simulated-datasets","2022-03-04_full-data-nk30-survival-97_4mo-fixed.RData"))
identifier <- "4mo-duration"
source(here("analysis", "01_relapse-counts.R"))
source(here("analysis", "02_advance-ttp.R"))
source(here("analysis", "03_advance-relapse.R"))
