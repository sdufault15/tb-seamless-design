##################################
# Run Ranking
# Suzanne Dufault
# July 7, 2022
##################################
source(here("lib","mcmc-rank-function.R"))
# Data

# Even
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-20_even.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-30_even.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-40_even.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-60_even.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-80_even.RData"))

# High
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-20_high.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-30_high.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-40_high.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-60_high.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-80_high.RData"))

# High-Low
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-20_highlow.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-30_highlow.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-40_highlow.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-60_highlow.RData"))
load(here("data","cleaned","2022-06-22_mcmc_random-intercept-random-slope_nk-80_highlow.RData"))

mcmc_even <- list(nk20 = mcmc_mods_even_20,
                  nk30 = mcmc_mods_even_30,
                  nk40 = mcmc_mods_even_40,
                  nk60 = mcmc_mods_even_60,
                  nk80 = mcmc_mods_even_80)

mcmc_high <- list(nk20 = mcmc_mods_high_20,
                  nk30 = mcmc_mods_high_30,
                  nk40 = mcmc_mods_high_40,
                  nk60 = mcmc_mods_high_60,
                  nk80 = mcmc_mods_high_80)

mcmc_highlow <- list(nk20 = mcmc_mods_highlow_20,
                     nk30 = mcmc_mods_highlow_30,
                     nk40 = mcmc_mods_highlow_40,
                     nk60 = mcmc_mods_highlow_60,
                     nk80 = mcmc_mods_highlow_80)
rm(list = ls(pattern = "mcmc_mods_"))

###################
# Run analyses
###################

library(furrr)
plan(multisession)
ranking_output_even <- future_map(mcmc_even, # mcmc_even has 5 slots (one per sample size)
                                  ~map(.x, # within each sample size, there are 1,000 simulated mcmc chains 
                                       ~mcmc_rank_function(.x)),
                                  .id = "nk")

ranking_output_high <- future_map(mcmc_high, 
                                  ~map(.x, 
                                       ~mcmc_rank_function(.x)),
                                  .id = "nk")

ranking_output_highlow <- future_map(mcmc_highlow, 
                                     ~map(.x, 
                                          ~mcmc_rank_function(.x)),
                                     .id = "nk")
beepr::beep()

####################
# Combine results
####################
even_full <- bind_rows(
  mutate(map_dfr(ranking_output_even$nk20,
                 ~.x,
                 .id = "sim"), nk = 20),
  mutate(map_dfr(ranking_output_even$nk30,
                 ~.x,.id = "sim"), nk = 30), 
  mutate(map_dfr(ranking_output_even$nk40,
                 ~.x,.id = "sim"), nk = 40),
  mutate(map_dfr(ranking_output_even$nk60,
                 ~.x,.id = "sim"), nk = 60),
  mutate(map_dfr(ranking_output_even$nk80,
                 ~.x,.id = "sim"), nk = 80)) 

high_full <- bind_rows(
  mutate(map_dfr(ranking_output_high$nk20,
                 ~.x,
                 .id = "sim"), nk = 20),
  mutate(map_dfr(ranking_output_high$nk30,
                 ~.x,.id = "sim"), nk = 30), 
  mutate(map_dfr(ranking_output_high$nk40,
                 ~.x,.id = "sim"), nk = 40),
  mutate(map_dfr(ranking_output_high$nk60,
                 ~.x,.id = "sim"), nk = 60),
  mutate(map_dfr(ranking_output_high$nk80,
                 ~.x,.id = "sim"), nk = 80)) 

highlow_full <- bind_rows(
  mutate(map_dfr(ranking_output_highlow$nk20,
                 ~.x,
                 .id = "sim"), nk = 20),
  mutate(map_dfr(ranking_output_highlow$nk30,
                 ~.x,.id = "sim"), nk = 30), 
  mutate(map_dfr(ranking_output_highlow$nk40,
                 ~.x,.id = "sim"), nk = 40),
  mutate(map_dfr(ranking_output_highlow$nk60,
                 ~.x,.id = "sim"), nk = 60),
  mutate(map_dfr(ranking_output_highlow$nk80,
                 ~.x,.id = "sim"), nk = 80)) 

ranking_probabilities <- list(even_probabilities = even_full,
                              highlow_probabilities = highlow_full,
                              high_probabilities = high_full)
save(ranking_probabilities, file = here("data", "analyzed", "ranking", 
                                        paste0(Sys.Date(), "_ranking-probabilities.RData")))
