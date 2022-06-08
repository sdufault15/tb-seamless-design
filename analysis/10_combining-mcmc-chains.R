#####################
# Combining separate datasets
# Suzanne Dufault
#####################
library(here)
library(tidyverse)


############  EVEN ############################################################
load(here("data", "bayes-generated", "2022-06-07_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)

mcmc_mods_even_60 <- c(mcmc_100, 
                       mcmc_200, 
                       # mcmc_300,
                       mcmc_400,
                       mcmc_500) 
save(mcmc_mods_even_60,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-60_even.RData")))

############  HIGH ############################################################


############  HIGH-LOW ############################################################
