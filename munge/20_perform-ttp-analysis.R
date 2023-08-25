##############################################
# Run BRMS models on simulated data
##############################################
library(dplyr)
library(tidyr)
library(purrr)
library(brms)
library(parallelly)
library(cmdstanr)
# set_cmdstan_path(path = "/home/sdufault/.cmdstan/cmdstan-2.32.2") # had to run this to get cmdstanr to work initially, no need to rerun once working
source(here("lib","df_extract-mcmc-slopes-function.R"))

library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallelly::availableCores())

#########################
# No winners
#########################
# These lines ensure I'm calling the most recent, most up-to-date version of the simulated dataset
files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_no-winners-ttp-fe.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_no_winners_fe
rm(file_interest,files)

# A list of length nsims, where each dataset is [sum(nk*regimen) over all nk] x [9 variables]
df_sims_nk <- df_sims_no_winners_fe[sims] %>% 
  map(~.x %>% # Across the chosen number of simulations
        mutate(arm = as.factor(regimen),
               nk = as.factor(nk)) %>% 
        # Splits data by the nk, resulting in a list of 5 different datasets for 20, 30, 40, 60, 80 
        group_by(nk) %>% 
        group_split(nk,
                    .keep = TRUE)) 

rm(df_sims_no_winners_fe)

# Run the models on the nk-specific datasets
mods_no_winners <- map(df_sims_nk, # across the chosen number of simulations
                       ~.x %>% # across the nk-specific datasets
                         map(~brm(model, # run the model
                                  data = .x,
                                  init = 0,
                                  backend = "cmdstanr", # attempt to improve convergence speed
                                  save_pars=save_pars(group=FALSE), # attempt to decrease file size
                                  normalize = FALSE, # attempt to improve speed of convergence (https://discourse.mc-stan.org/t/faster-convergence/21532)
                                  prior = priors)))
rm(df_sims_nk)

# Save the model results
summary_mods_no_winners <- map(mods_no_winners, # across the chosen number of simulations
                               ~.x %>% map(~summary(.x))) # across the nk-specific datasets
save(summary_mods_no_winners,
    file = here("data", "bayes-generated", paste0(Sys.Date(), "_bayes-full-model-results_no-winners_", max(sims), ".RData")))

rm(summary_mods_no_winners)

# Save the MCMC chains
mcmc_mods_no_winners <- map(mods_no_winners, # across the chosen number of simulations
                           ~.x %>% map(~mcmc_estimates_function(.x))) # across the nk-specific datasets
save(mcmc_mods_no_winners,
    file = here("data", "bayes-generated", paste0(Sys.Date(), "_bayes-mcmc-results_no-winners_", max(sims), ".RData")))

rm(mcmc_mods_no_winners)

#########################
# One winner
#########################

files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_one-winner-ttp-fe.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_one_winner_fe
rm(file_interest,files)

df_sims_nk <- df_sims_one_winner_fe[sims] %>% # Across the chosen number of simulated datasets
  map(~.x %>% # Across the chosen number of simulations
        mutate(arm = as.factor(regimen),
               nk = as.factor(nk)) %>%
        # Splits data by the nk, resulting in a list of 5 different datasets for 20, 30, 40, 60, 80
        group_by(nk) %>%
        group_split(nk,
                    .keep = TRUE))

rm(df_sims_one_winner_fe)

# Run the models on the nk-specific datasets
mods_one_winner <- map(df_sims_nk, # across the chosen number of simulations
                       ~.x %>% # across the nk-specific datasets
                         map(~brm(model, # run the model
                                  data = .x,
                                  save_pars=save_pars(group=FALSE),	# attempt to decrease file size
				  backend = "cmdstanr", # attempt to improve convergence speed
				  normalize = FALSE, # attempt to improve speed of convergence (https://discourse.mc-stan.org/t/faster-convergence/21532)
                                  prior = priors)))
rm(df_sims_nk)

# Save the model results
summary_mods_one_winner <- map(mods_one_winner,
                               ~.x %>% map(~summary(.x)))
save(summary_mods_one_winner,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-full-model-results_one-winner_", max(sims), ".RData"))

rm(summary_mods_one_winner)

# Save the MCMC chains
mcmc_mods_one_winner <- map(mods_one_winner,
                            ~.x %>% map(~mcmc_estimates_function(.x)))
save(mcmc_mods_one_winner,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-mcmc-results_one-winner_", max(sims), ".RData"))

rm(mcmc_mods_one_winner)


#########################
# two winners
#########################
files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_two-winners-ttp-fe.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_two_winners_fe
rm(file_interest,files)

# A list of length nsims, where each dataset is [sum(nk*regimen) over all nk] x [9 variables]
df_sims_nk <- df_sims_two_winners_fe[sims] %>%
  map(~.x %>% # Across the chosen number of simulations
        mutate(arm = as.factor(regimen),
               nk = as.factor(nk)) %>%
        # Splits data by the nk, resulting in a list of 5 different datasets for 20, 30, 40, 60, 80
        group_by(nk) %>%
        group_split(nk,
                    .keep = TRUE))

rm(df_sims_two_winners_fe)

# Run the models on the nk-specific datasets
mods_two_winners <- map(df_sims_nk, # across the chosen number of simulations
                       ~.x %>% # across the nk-specific datasets
                         map(~brm(model, # run the model
                                  data = .x,
				  save_pars=save_pars(group=FALSE),	# attempt to decrease file size
                                  backend = "cmdstanr",	# attempt to improve convergence speed
                                  normalize = FALSE, # attempt to improve speed	of convergence (https://discourse.mc-stan.org/t/faster-convergence/21532)
                                  prior = priors)))
rm(df_sims_nk)

# Save the model results
summary_mods_two_winners <- map(mods_two_winners,
                               ~.x %>% map(~summary(.x)))
save(summary_mods_two_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-full-model-results_two-winners_", max(sims), ".RData"))

rm(summary_mods_two_winners)

# Save the MCMC chains
mcmc_mods_two_winners <- map(mods_two_winners,
                            ~.x %>% map(~mcmc_estimates_function(.x)))
save(mcmc_mods_two_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-mcmc-results_two-winners_", max(sims), ".RData"))

rm(mcmc_mods_two_winners)

#########################
# four winners
#########################
files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_four-winners-ttp-fe.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_four_winners_fe
rm(file_interest,files)

# A list of length nsims, where each dataset is [sum(nk*regimen) over all nk] x [9 variables]
df_sims_nk <- df_sims_four_winners_fe[sims] %>%
  map(~.x %>% # Across the chosen number of simulations
        mutate(arm = as.factor(regimen),
               nk = as.factor(nk)) %>%
        # Splits data by the nk, resulting in a list of 5 different datasets for 20, 30, 40, 60, 80
        group_by(nk) %>%
        group_split(nk,
                    .keep = TRUE))

rm(df_sims_four_winners_fe)

# Run the models on the nk-specific datasets
mods_four_winners <- map(df_sims_nk, # across the chosen number of simulations
                        ~.x %>% # across the nk-specific datasets
                          map(~brm(model, # run the model
                                   data = .x,
                                   save_pars=save_pars(group=FALSE),     # attempt to decrease file size
                                   backend = "cmdstanr",	# attempt to improve convergence speed
                                   normalize = FALSE, # attempt to improve speed	of convergence (https://discourse.mc-stan.org/t/faster-convergence/21532)
                                   prior = priors)))
rm(df_sims_nk)

# Save the model results
summary_mods_four_winners <- map(mods_four_winners,
                                ~.x %>% map(~summary(.x)))
save(summary_mods_four_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-full-model-results_four-winners_", max(sims), ".RData"))

rm(summary_mods_four_winners)

# Save the MCMC chains
mcmc_mods_four_winners <- map(mods_four_winners,
                             ~.x %>% map(~mcmc_estimates_function(.x)))
save(mcmc_mods_four_winners,
     file = paste0("~/tb-seamless/data/bayes-generated/", Sys.Date(), "_bayes-mcmc-results_four-winners_", max(sims), ".RData"))

rm(mcmc_mods_four_winners)
