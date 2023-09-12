##################################
# Run Target Product Profile
# Suzanne Dufault
# Aug 21, 2023
##################################

source(here("lib", "target-product-profile-function.R"))

# Data

# Null
load(here("data","cleaned","2023-09-12_mcmc_random-intercept-random-slope_nk-no-winners.RData"))

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

########################
# Wrangling
########################
mcmc_null <- list(nk20 = map(mcmc_mods_no_winners, ~.x[[1]]),
                  nk30 = map(mcmc_mods_no_winners, ~.x[[2]]),
                  nk40 = map(mcmc_mods_no_winners, ~.x[[3]]),
                  nk60 = map(mcmc_mods_no_winners, ~.x[[4]]),
                  nk80 = map(mcmc_mods_no_winners, ~.x[[5]]))

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

########################
# Run decisions
########################
plan(multisession)
decisions_null <- future_map2_dfr(mcmc_null, nk, ~decision_function(.x,
                                                                    nk = .y,
                                                                    theta_lrv = theta_lrv, # in %
                                                                    theta_tv = theta_tv, # in % 
                                                                    tau_lrv = tau_lrv, 
                                                                    tau_tv = tau_tv))
decisions_even <- future_map2_dfr(mcmc_even, nk, ~decision_function(.x,
                                                                    nk = .y,
                                                                    theta_lrv = theta_lrv, # in %
                                                                    theta_tv = theta_tv, # in % 
                                                                    tau_lrv = tau_lrv, 
                                                                    tau_tv = tau_tv))

decisions_highlow <- future_map2_dfr(mcmc_highlow, nk, ~decision_function(.x,
                                                                          nk = .y,
                                                                          theta_lrv = theta_lrv, # in %
                                                                          theta_tv = theta_tv, # in % 
                                                                          tau_lrv = tau_lrv, 
                                                                          tau_tv = tau_tv))

decisions_high <- future_map2_dfr(mcmc_high, nk, ~decision_function(.x,
                                                                    nk = .y,
                                                                    theta_lrv = theta_lrv, # in %
                                                                    theta_tv = theta_tv, # in % 
                                                                    tau_lrv = tau_lrv, 
                                                                    tau_tv = tau_tv))

decisions <- list(decisions_null = decisions_null,
                  decisions_even = decisions_even,
                  decisions_highlow = decisions_highlow,
                  decisions_high = decisions_high)
save(decisions, file = here("data", "analyzed", "target-product-profile", 
                            paste0(Sys.Date(), "_tpp-decisions.RData")))

rm(list = ls(pattern = "decisions"))
rm(list = ls(pattern = "mcmc"))
