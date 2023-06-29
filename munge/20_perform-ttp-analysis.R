##############################################
# Run BRMS models on simulated data
##############################################
library(dplyr)
library(tidyr)
library(purrr)
library(brms)
library(parallelly)
source(here("lib","df_extract-mcmc-slopes-function.R"))

library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallelly::availableCores())

# Call in simulated TTP data (Don't need the FULL data, because the TTP data is repeated across simulated survival settings)
files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_no-winners-ttp-fe.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_no_winners_fe
rm(file_interest,files)

files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_one-winner-ttp-fe.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_one_winner_fe
rm(file_interest,files)

files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_two-winners-ttp-fe.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_two_winners_fe
rm(file_interest,files)


files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_four-winners-ttp-fe.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_four_winners_fe
rm(file_interest,files)

#########################
# No winners
#########################
# A list of length nsims, where each dataset is [sum(nk*regimen) over all nk] x [9 variables]
df_sims_nk <- df_sims_no_winners_fe[sims] %>% 
  map(~.x %>% # Across the chosen number of simulations
        mutate(arm = as.factor(regimen),
               nk = as.factor(nk)) %>% 
        # Splits data by the nk, resulting in a list of 5 different datasets for 20, 30, 40, 60, 80 
        group_by(nk) %>% 
        group_split(nk,
                    .keep = TRUE)) 

# Run the models on the nk-specific datasets
mods_no_winners <- map(df_sims_nk, # across the chosen number of simulations
                       ~.x %>% # across the nk-specific datasets
                         map(~brm(model, # run the model
                              data = .x,
                              prior = priors)))
# Save the model results
summary_mods_no_winners <- map(mods_no_winners, # across the chosen number of simulations
                               ~.x %>% map(~summary(.x))) # across the nk-specific datasets
save(summary_mods_no_winners,
     file = here("data", "bayes-generated", paste0(Sys.Date(), "_bayes-full-model-results_no-winners_", max(sims), ".RData")))

# Save the MCMC chains
mcmc_mods_no_winners <- map(mods_no_winners, # across the chosen number of simulations
                            ~.x %>% map(~mcmc_estimates_function(.x))) # across the nk-specific datasets
save(mcmc_mods_no_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-mcmc-results_no-winners_", max(sims), ".RData"))

rm(df_sims_nk, mcmc_mods_no_winners, summary_mods_no_winners, df_sims_no_winners_fe)

#########################
# One winner
#########################

df_sims_nk <- df_sims_one_winner_fe[sims] %>% # Across the chosen number of simulated datasets
  map(~.x %>% # Across the chosen number of simulations
        mutate(arm = as.factor(regimen),
               nk = as.factor(nk)) %>% 
        # Splits data by the nk, resulting in a list of 5 different datasets for 20, 30, 40, 60, 80 
        group_by(nk) %>% 
        group_split(nk,
                    .keep = TRUE)) 

# Run the models on the nk-specific datasets
mods_one_winner <- map(df_sims_nk, # across the chosen number of simulations
                       ~.x %>% # across the nk-specific datasets
                         map(~brm(model, # run the model
                                  data = .x,
                                  prior = priors)))
# Save the model results
summary_mods_one_winner <- map(mods_one_winner,
                               ~.x %>% map(~summary(.x)))
save(summary_mods_one_winner,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-full-model-results_one-winner_", max(sims), ".RData"))

# Save the MCMC chains
mcmc_mods_one_winner <- map(mods_one_winner,
                            ~.x %>% map(~mcmc_estimates_function(.x)))
save(mcmc_mods_one_winner,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-mcmc-results_one-winner_", max(sims), ".RData"))

rm(df_sims_nk, mcmc_mods_one_winner, summary_mods_one_winner, df_sims_one_winner_fe)


#########################
# two winners
#########################
# A list of length nsims, where each dataset is [sum(nk*regimen) over all nk] x [9 variables]
df_sims_nk <- df_sims_two_winners_fe[sims] %>% 
  map(~.x %>% # Across the chosen number of simulations
        mutate(arm = as.factor(regimen),
               nk = as.factor(nk)) %>% 
        # Splits data by the nk, resulting in a list of 5 different datasets for 20, 30, 40, 60, 80 
        group_by(nk) %>% 
        group_split(nk,
                    .keep = TRUE)) 

# Run the models on the nk-specific datasets
mods_two_winners <- map(df_sims_nk, # across the chosen number of simulations
                       ~.x %>% # across the nk-specific datasets
                         map(~brm(model, # run the model
                                  data = .x,
                                  prior = priors)))
# Save the model results
summary_mods_two_winners <- map(mods_two_winners,
                               ~.x %>% map(~summary(.x)))
save(summary_mods_two_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-full-model-results_two-winners_", max(sims), ".RData"))

# Save the MCMC chains
mcmc_mods_two_winners <- map(mods_two_winners,
                            ~.x %>% map(~mcmc_estimates_function(.x)))
save(mcmc_mods_two_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-mcmc-results_two-winners_", max(sims), ".RData"))

rm(df_sims_nk, mcmc_mods_two_winners, summary_mods_two_winners, df_sims_two_winners_fe)

#########################
# four winners
#########################
# A list of length nsims, where each dataset is [sum(nk*regimen) over all nk] x [9 variables]
df_sims_nk <- df_sims_four_winners_fe[sims] %>% 
  map(~.x %>% # Across the chosen number of simulations
        mutate(arm = as.factor(regimen),
               nk = as.factor(nk)) %>% 
        # Splits data by the nk, resulting in a list of 5 different datasets for 20, 30, 40, 60, 80 
        group_by(nk) %>% 
        group_split(nk,
                    .keep = TRUE)) 

# Run the models on the nk-specific datasets
mods_four_winners <- map(df_sims_nk, # across the chosen number of simulations
                        ~.x %>% # across the nk-specific datasets
                          map(~brm(model, # run the model
                                   data = .x,
                                   prior = priors)))
# Save the model results
summary_mods_four_winners <- map(mods_four_winners,
                                ~.x %>% map(~summary(.x)))
save(summary_mods_four_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-full-model-results_four-winners_", max(sims), ".RData"))

# Save the MCMC chains
mcmc_mods_four_winners <- map(mods_four_winners,
                             ~.x %>% map(~mcmc_estimates_function(.x)))
save(mcmc_mods_four_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-mcmc-results_four-winners_", max(sims), ".RData"))

rm(df_sims_nk, mcmc_mods_four_winners, summary_mods_four_winners, df_sims_four_winners_fe)