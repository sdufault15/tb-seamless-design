########################
# Primary File
########################
library(here)
library(tidyverse)

# Variable durations (RUN LOCALLY)
# load(here("data", "simulated-datasets","2022-02-24_full-data-nk30-survival-97.RData"))
# identifier <- "var-duration"
# evenTTP <- nk_30_outcome_1$nk_30_even
# highlowTTP <- nk_30_outcome_1$nk_30_highlow
# highTTP <- nk_30_outcome_1$nk_30_high
# source(here("analysis", "01_relapse-counts.R"))
# load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-even-30.RData") 
# load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-high-30.RData") 
# load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-highlow-30.RData") 
# nk <- 30
# mcmc_mods_even <- mcmc_mods_even_30
# mcmc_mods_high <- mcmc_mods_high_30
# mcmc_mods_highlow <- mcmc_mods_highlow_30
# source(here("analysis", "02_advance-ttp.R"))
# even_relapse <- nk_30_outcome_1$nk_30_even
# high_relapse <- nk_30_outcome_1$nk_30_high
# highlow_relapse <- nk_30_outcome_1$nk_30_highlow
# rm(nk_30_outcome_1)
# source(here("analysis", "03_advance-relapse.R"))


# Fixed 4-mo duration, 30 participants per arm (RUN LOCALLY)
load(here("data", "simulated-datasets","2022-03-04_full-data-nk30-survival-97_4mo-fixed.RData"))
identifier <- "nk30_4mo-duration"
evenTTP <- nk_30_outcome_1$nk_30_even
highlowTTP <- nk_30_outcome_1$nk_30_highlow
highTTP <- nk_30_outcome_1$nk_30_high 
source(here("analysis", "01_relapse-counts.R"))
load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-even-30.RData") 
load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-high-30.RData") 
load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-highlow-30.RData") 
nk <- 30
mcmc_mods_even <- mcmc_mods_even_30
mcmc_mods_high <- mcmc_mods_high_30
mcmc_mods_highlow <- mcmc_mods_highlow_30
source(here("analysis", "02_advance-ttp.R"))
even_relapse <- nk_30_outcome_1$nk_30_even
high_relapse <- nk_30_outcome_1$nk_30_high
highlow_relapse <- nk_30_outcome_1$nk_30_highlow
rm(nk_30_outcome_1)
source(here("analysis", "03_advance-relapse.R"))

# Fixed 4-mo duration, 40 participants per arm
load(here("data", "simulated-datasets","2022-03-04_full-data-nk40-survival-97_4mo-fixed.RData"))
identifier <- "nk40_4mo-duration"
evenTTP <- nk_40_outcome_1$nk_40_even
highlowTTP <- nk_40_outcome_1$nk_40_highlow
highTTP <- nk_40_outcome_1$nk_40_high 
source(here("analysis", "01_relapse-counts.R"))
load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-even-40.RData") 
load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-high-40.RData") 
load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-highlow-40.RData") 
nk <- 40
mcmc_mods_even <- mcmc_mods_even_40
mcmc_mods_high <- mcmc_mods_high_40
mcmc_mods_highlow <- mcmc_mods_highlow_40
source(here("analysis", "02_advance-ttp.R"))
even_relapse <- nk_40_outcome_1$nk_40_even
high_relapse <- nk_40_outcome_1$nk_40_high
highlow_relapse <- nk_40_outcome_1$nk_40_highlow
rm(nk_40_outcome_1)
source(here("analysis", "03_advance-relapse.R"))

# Fixed 4-mo duration, 60 participants per arm
load(here("data", "simulated-datasets","2022-03-06_full-data-nk60-survival-97.RData"))
identifier <- "nk60_4mo-duration"
evenTTP <- nk_60_outcome_1$nk_60_even
highlowTTP <- nk_60_outcome_1$nk_60_highlow
highTTP <- nk_60_outcome_1$nk_60_high 
source(here("analysis", "01_relapse-counts.R"))
load(here("data","bayes-generated","2022-03-03_simulated-lmm_intercept-only_lod-25_nk-60_even-condition_mcmc-200.RData")) 
load(here("data","bayes-generated","2022-03-04_simulated-lmm_intercept-only_lod-25_nk-60_high-condition_mcmc-200.RData")) 
load(here("data","bayes-generated","2022-03-06_simulated-lmm_intercept-only_lod-25_nk-60_highlow-condition_mcmc-200.RData")) 
nk <- 60
mcmc_mods_even <- mcmc_mods_even_60
mcmc_mods_high <- mcmc_mods_high_60
mcmc_mods_highlow <- mcmc_mods_highlow_60
source(here("analysis", "02_advance-ttp.R"))
even_relapse <- nk_60_outcome_1$nk_60_even
high_relapse <- nk_60_outcome_1$nk_60_high
highlow_relapse <- nk_60_outcome_1$nk_60_highlow
rm(nk_60_outcome_1)
source(here("analysis", "03_advance-relapse.R"))

# Fixed 4-mo duration, 80 participants per arm
load(here("data", "simulated-datasets","2022-03-06_full-data-nk80-survival-97.RData"))
identifier <- "nk80_4mo-duration"
evenTTP <- nk_80_outcome_1$nk_80_even
highlowTTP <- nk_80_outcome_1$nk_80_highlow
highTTP <- nk_80_outcome_1$nk_80_high 
source(here("analysis", "01_relapse-counts.R"))
load(here("data","bayes-generated","2022-03-03_simulated-lmm_intercept-only_lod-25_nk-80_even-condition_mcmc-200.RData")) 
load(here("data","bayes-generated","2022-03-04_simulated-lmm_intercept-only_lod-25_nk-80_high-condition_mcmc-200.RData")) 
load(here("data","bayes-generated","2022-03-06_simulated-lmm_intercept-only_lod-25_nk-80_highlow-condition_mcmc-200.RData")) 
nk <- 80
mcmc_mods_even <- mcmc_mods_even_80
mcmc_mods_high <- mcmc_mods_high_80
mcmc_mods_highlow <- mcmc_mods_highlow_80
source(here("analysis", "02_advance-ttp.R"))
even_relapse <- nk_80_outcome_1$nk_80_even
high_relapse <- nk_80_outcome_1$nk_80_high
highlow_relapse <- nk_80_outcome_1$nk_80_highlow
rm(nk_80_outcome_1)
source(here("analysis", "03_advance-relapse.R"))
