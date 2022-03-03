########################
# Primary File
########################
library(here)
library(tidyverse)

# Variable durations
load(here("data", "simulated-datasets","2022-02-24_full-data-nk30-survival-97.RData"))
identifier <- "var-duration"
source(here("analysis", "01_relapse-counts.R"))
source(here("analysis", "02_advance-ttp.R"))
source(here("analysis", "03_advance-relapse.R"))


# Fixed 4-mo duration, 30 participants per arm
load(here("data", "simulated-datasets","2022-03-02_full-data-nk30-survival-97.RData"))
identifier <- "4mo-duration"
source(here("analysis", "01_relapse-counts.R"))
source(here("analysis", "02_advance-ttp.R"))
source(here("analysis", "03_advance-relapse.R"))
