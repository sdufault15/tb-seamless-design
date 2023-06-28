##########################
# Extracting MCMC chains and model results from these massive files
##########################
library(tidyverse)
library(here)

load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/bayes-generated/2021-12-23_simulated-lmm_intercept-only_lod-25_nk-30_even-condition-100.RData") # this is the corresponding result for the sample dataset
source("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/lib/df_extract-mcmc-slopes-function.R")

mcmc_mods_even_30 <- map(mods_even_30,  ~mcmc_estimates_function(.x))
mcmc_modresults_even_30 <- map(mods_even_30,  ~summary(.x))

save(mcmc_mods_even_30,
     file = here("data", "bayes-generated", 
                 paste0(Sys.Date(), "_mcmc-mods_even_30_100.RData")))

save(mcmc_modresults_even_30,
     file = here("data", "bayes-generated", 
                 paste0(Sys.Date(), "_mcmc-modresults_even_30_100.RData")))
