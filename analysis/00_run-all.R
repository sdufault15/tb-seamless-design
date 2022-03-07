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
load(here("data", "simulated-datasets","2022-03-04_full-data-nk30-survival-97_4mo-fixed.RData"))
identifier <- "4mo-duration"
source(here("analysis", "01_relapse-counts.R"))
source(here("analysis", "02_advance-ttp.R"))
source(here("analysis", "03_advance-relapse.R"))

# Fixed 4-mo duration, 40 participants per arm
load(here("data", "simulated-datasets","2022-03-04_full-data-nk40-survival-97_4mo-fixed.RData"))
identifier <- "nk40_4mo-duration"
source(here("analysis", "01_relapse-counts.R"))
source(here("analysis", "02_advance-ttp.R"))
source(here("analysis", "03_advance-relapse.R"))

# Fixed 4-mo duration, 60 participants per arm
load(here("data", "simulated-datasets","2022-03-06_full-data-nk60-survival-97.RData"))
identifier <- "nk60_4mo-duration"
source(here("analysis", "01_relapse-counts.R"))
source(here("analysis", "02_advance-ttp.R"))
source(here("analysis", "03_advance-relapse.R"))

# Fixed 4-mo duration, 80 participants per arm
load(here("data", "simulated-datasets","2022-03-06_full-data-nk80-survival-97.RData"))
identifier <- "nk80_4mo-duration"
source(here("analysis", "01_relapse-counts.R"))
source(here("analysis", "02_advance-ttp.R"))
source(here("analysis", "03_advance-relapse.R"))
