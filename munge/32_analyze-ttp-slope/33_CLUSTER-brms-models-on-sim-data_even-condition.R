##############################################
# Run BRMS models on simulated data
##############################################
library(tidyverse)
library(brms)
library(parallelly)
source("~/phase2b/lib/df_extract-mcmc-slopes-function.R")

library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallelly::availableCores())

######################
# Sample Size 20
######################

load("~/phase2b/data/2022-01-12_simulated-df_even-increases.RData")

# Separating the simulated data by sample size
nk_20 <- df_sims_s1[sims] %>%
  map(~.x[[1]]) %>%
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s1) # for space

mods_even_20 <- map(nk_20,
                    ~brm(yij_censored | cens(censored) ~ 1 + week + week:arm + (1 | patient.id),
                         data = .x,
                         prior = set_prior("uniform(-1,1)", lb = -1, ub = 1, class = "b")))

# Save the model results
summary_mods_even_20 <- map(mods_even_20,
                               ~summary(.x))
save(summary_mods_even_20,
     file = paste0("~/phase2b/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-20_even-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_even_20)

# Save the MCMC chains
mcmc_mods_even_20 <- map(mods_even_20,
                            ~mcmc_estimates_function(.x))
save(mcmc_mods_even_20,
     file = paste0("~/phase2b/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-20_even-condition_mcmc-", max(sims), ".RData"))

rm(mods_even_20, mcmc_mods_even_20, nk_20)

######################
# Sample Size 30
######################

load("~/phase2b/data/2022-01-12_simulated-df_even-increases.RData")

nk_30 <- df_sims_s1[sims] %>%
  map(~.x[[2]]) %>%
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s1)

mods_even_30 <- map(nk_30,
                    ~brm(yij_censored | cens(censored) ~ 1 + week + week:arm + (1 | patient.id),
                         data = .x,
                         prior = set_prior("uniform(-1,1)", lb = -1, ub = 1, class = "b")))
# Save the model results
summary_mods_even_30 <- map(mods_even_30,
                            ~summary(.x))
save(summary_mods_even_30,
     file = paste0("~/phase2b/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-30_even-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_even_30)

# Save the MCMC chains
mcmc_mods_even_30 <- map(mods_even_30,
                         ~mcmc_estimates_function(.x))
save(mcmc_mods_even_30,
     file = paste0("~/phase2b/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-30_even-condition_mcmc-", max(sims), ".RData"))

rm(mods_even_30, mcmc_mods_even_30, nk_30)

######################
# Sample Size 40
######################

load("~/phase2b/data/2022-01-12_simulated-df_even-increases.RData")

nk_40 <- df_sims_s1[sims] %>% 
  map(~.x[[3]]) %>% 
  map(~mutate(.x, arm = as.factor(arm))) # make the arm a factor variable rather than integer

rm(df_sims_s1)

mods_even_40 <- map(nk_40,
                    ~brm(yij_censored | cens(censored) ~ 1 + week + week:arm + (1 | patient.id),
                         data = .x,
                         prior = set_prior("uniform(-1,1)", lb = -1, ub = 1, class = "b")))
# Save the model results
summary_mods_even_40 <- map(mods_even_40,
                            ~summary(.x))
save(summary_mods_even_40,
     file = paste0("~/phase2b/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-40_even-condition_modresults-", max(sims), ".RData"))

rm(summary_mods_even_40)

# Save the MCMC chains
mcmc_mods_even_40 <- map(mods_even_40,
                         ~mcmc_estimates_function(.x))
save(mcmc_mods_even_40,
     file = paste0("~/phase2b/data/bayes-generated/", Sys.Date(), "_simulated-lmm_intercept-only_lod-25_nk-40_even-condition_mcmc-", max(sims), ".RData"))

rm(mods_even_40, mcmc_mods_even_40, nk_40)
