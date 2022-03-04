##############################################
# Run BRMS models on simulated data
##############################################
library(tidyverse)
library(parallelly)
library(brms)
source("~/tb-seamless/lib/df_extract-mcmc-slopes-function.R")

files <- file.info(list.files(here("data", "simulated-datasets/"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_clustered-high_nk60-80"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallelly::availableCores())

######################
# Sample Size 60
######################

# Separating the simulated data by sample size
nk_60 <- df_sims_s3[sims] %>% 
  map(~.x[[1]]) %>% 
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s3)


mods_high_60 <- map(nk_60,
                    ~brm(yij_censored | cens(censored) ~ 1 + week + week:arm + (1 | patient.id),
                         data = .x,
                         prior = set_prior("uniform(-1,1)", lb = -1, ub = 1, class = "b")))

# Save the model results
summary_mods_high_60 <- map(mods_high_60,
                            ~summary(.x))
save(summary_mods_high_60,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-60_high-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_high_60)

# Save the MCMC chains
mcmc_mods_high_60 <- map(mods_high_60,
                         ~mcmc_estimates_function(.x))
save(mcmc_mods_high_60,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-60_high-condition_mcmc-", max(sims), ".RData"))

rm(mods_high_60, mcmc_mods_high_60, nk_60)


#####################
# Sample Size = 80
#####################

files <- file.info(list.files(here("data", "simulated-datasets/"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_clustered-high_nk60-80"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

nk_80 <- df_sims_s3[sims] %>% 
  map(~.x[[2]]) %>% 
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s3)

mods_high_80 <- map(nk_80,
                    ~brm(yij_censored | cens(censored) ~ 1 + week + week:arm + (1 | patient.id),
                         data = .x,
                         prior = set_prior("uniform(-1,1)", lb = -1, ub = 1, class = "b")))

# Save the model results
summary_mods_high_80 <- map(mods_high_80,
                            ~summary(.x))
save(summary_mods_high_80,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-80_high-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_high_80)

# Save the MCMC chains
mcmc_mods_high_80 <- map(mods_high_80,
                         ~mcmc_estimates_function(.x))
save(mcmc_mods_high_80,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-80_high-condition_mcmc-", max(sims), ".RData"))

rm(mods_high_80, mcmc_mods_high_80, nk_80)

