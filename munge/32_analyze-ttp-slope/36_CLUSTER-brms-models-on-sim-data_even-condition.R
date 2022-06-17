##############################################
# Run BRMS models on simulated data
##############################################
library(dplyr)
library(tidyr)
library(purrr)
library(brms)
library(parallelly)
source("~/tb-seamless/lib/df_extract-mcmc-slopes-function.R")

library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallelly::availableCores())

######################
# Sample Size 20
######################

files <- file.info(list.files(here("data"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_even-increases_random-slope"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

nk_20 <- df_sims_s1[sims] %>%
  map(~.x[[1]]) %>%
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s1)

mods_even_20 <- map(nk_20,
                    ~brm(model,
                         data = .x,
                         prior = priors))
# Save the model results
summary_mods_even_20 <- map(mods_even_20,
                            ~summary(.x))
save(summary_mods_even_20,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_even_20)

# Save the MCMC chains
mcmc_mods_even_20 <- map(mods_even_20,
                         ~mcmc_estimates_function(.x))
save(mcmc_mods_even_20,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-", max(sims), ".RData"))

rm(mods_even_20, mcmc_mods_even_20, nk_20)

######################
# Sample Size 30
######################
files <- file.info(list.files(here("data"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_even-increases_random-slope"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

# Separating the simulated data by sample size
nk_30 <- df_sims_s1[sims] %>%
  map(~.x[[2]]) %>%
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s1) # for space

mods_even_30 <- map(nk_30,
                    ~brm(model,
                         data = .x,
                         prior = priors))

# Save the model results
summary_mods_even_30 <- map(mods_even_30,
                               ~summary(.x))
save(summary_mods_even_30,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_even_30)

# Save the MCMC chains
mcmc_mods_even_30 <- map(mods_even_30,
                            ~mcmc_estimates_function(.x))
save(mcmc_mods_even_30,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-", max(sims), ".RData"))

rm(mods_even_30, mcmc_mods_even_30, nk_30)

######################
# Sample Size 40
######################

files <- file.info(list.files(here("data"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "simulated-df_even-increases_random-slope"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

nk_40 <- df_sims_s1[sims] %>%
  map(~.x[[3]]) %>%
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s1)

mods_even_40 <- map(nk_40,
                    ~brm(model,
                         data = .x,
                         prior = priors))
# Save the model results
summary_mods_even_40 <- map(mods_even_40,
                            ~summary(.x))
save(summary_mods_even_40,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_even_40)

# Save the MCMC chains
mcmc_mods_even_40 <- map(mods_even_40,
                         ~mcmc_estimates_function(.x))
save(mcmc_mods_even_40,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-", max(sims), ".RData"))

rm(mods_even_40, mcmc_mods_even_40, nk_40)
