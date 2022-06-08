##############################################
# Run BRMS models on simulated data
##############################################
library(tidyverse)
library(parallelly)
library(brms)
source("~/tb-seamless/lib/df_extract-mcmc-slopes-function.R")

files <- file.info(list.files(here("data", "simulated-datasets/"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_cluster-low-high_nk60-80"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallelly::availableCores())


######################
# Sample Size 60
######################

# Separating the simulated data by sample size
nk_60 <- df_sims_s2[sims] %>% 
  map(~.x[[1]]) %>% 
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s2)

mods_highlow_60 <- map(nk_60,
                    ~brm(model,
                         data = .x,
                         prior = priors))

# Save the model results
summary_mods_highlow_60 <- map(mods_highlow_60,
                            ~summary(.x))
save(summary_mods_highlow_60,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_highlow_60)

# Save the MCMC chains
mcmc_mods_highlow_60 <- map(mods_highlow_60,
                         ~mcmc_estimates_function(.x))
save(mcmc_mods_highlow_60,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-", max(sims), ".RData"))

rm(mods_highlow_60, mcmc_mods_highlow_60, nk_60)

######################
# Sample Size 80
######################

files <- file.info(list.files(here("data", "simulated-datasets/"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_cluster-low-high_nk60-80"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

nk_80 <- df_sims_s2[sims] %>% 
  map(~.x[[2]]) %>% 
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s2)

mods_highlow_80 <- map(nk_80,
                    ~brm(model,
                         data = .x,
                         prior = priors))
# Save the model results
summary_mods_highlow_80 <- map(mods_highlow_80,
                               ~summary(.x))
save(summary_mods_highlow_80,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_highlow_80)

# Save the MCMC chains
mcmc_mods_highlow_80 <- map(mods_highlow_80,
                            ~mcmc_estimates_function(.x))
save(mcmc_mods_highlow_80,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-", max(sims), ".RData"))

rm(mods_highlow_80, mcmc_mods_highlow_80, nk_80)
