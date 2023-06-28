#################################
# Simulate unfavorable outcome data
# Initiated: June 27, 2023
# Updated: June 27, 2023
#################################

source(here("lib", "df-sim-wrapper-function_random-slope.R"))
source(here("lib", "df-sim-function_random-slope.R"))

ncores <- parallelly::availableCores()
plan(future::multisession(workers = ncores))

# Call in model being used as "truth"
files <- file.info(list.files("data/bayes-generated", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "remox-lmm-short_lower-detection-25"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

# Pull out coefficients
s <- summary(fit.cens.ld.25)
betas <- c(s$fixed$Estimate)[1:2] # (just the intercept and control group slope for now)

# Pull out individual-level SD
sd_id <- s$random$trial_no$Estimate[1]
# Pull out slope-level SD
sd_slope <- s$random$trial_no$Estimate[2]
# Random effects correlation
rho <- s$random$trial_no$Estimate[3]
# Pull out residual SD
sd_randomnoise <- s$spec_pars$Estimate[1]


#################################
# Slopes - No Winners
# All 0%
#################################
df_sims_no_winners <- df_sim_wrapper_function(n_sims = nsims,
                                              betas = betas, 
                                              slopes = rep(0,4), 
                                              weeks = 8, 
                                              nk = as.list(nkd), 
                                              sd_id = sd_id, 
                                              sd_slope = sd_slope,
                                              rho = rho,
                                              sd_randomnoise = sd_randomnoise, 
                                              lod = 25)

# Output: [[nsims]] [[nk]] [n x 5] 
save(df_sims_no_winners,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_no-winners-ttp.RData")))


#################################
# Slopes - 1 Winner
# 10%,20%,30%,40%
#################################
df_sims_one_winner <- df_sim_wrapper_function(n_sims = nsims,
                                              betas = betas, 
                                              slopes = seq(from = 0.1,to = 0.4,by=0.1), 
                                              weeks = 8, 
                                              nk = as.list(nkd), 
                                              sd_id = sd_id, 
                                              sd_slope = sd_slope,
                                              rho = rho,
                                              sd_randomnoise = sd_randomnoise, 
                                              lod = 25)
# Output: [[nsims]] [[nk]] [n x 5]
save(df_sims_one_winner,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_one-winner-ttp.RData")))

#################################
# Slopes - 2 Winners
# -10%,10%,35%,40
#################################
df_sims_two_winners <- df_sim_wrapper_function(n_sims = nsims,
                                               betas = betas, 
                                               slopes = c(-.10,.10,.35,.40),                                                
                                               weeks = 8, 
                                               nk = as.list(nkd), 
                                               sd_id = sd_id, 
                                               sd_slope = sd_slope,
                                               rho = rho,
                                               sd_randomnoise = sd_randomnoise, 
                                               lod = 25)
# Output: [[nsims]] [[nk]] [n x 5]
save(df_sims_two_winners,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_two-winners-ttp.RData")))

#################################
# Slopes - 4 Winners
# 35%, 37%, 39%, 41%
#################################
df_sims_four_winners <- df_sim_wrapper_function(n_sims = nsims,
                                               betas = betas, 
                                               slopes = seq(.35,.41,by = 0.02),                                                
                                               weeks = 8, 
                                               nk = as.list(nkd), 
                                               sd_id = sd_id, 
                                               sd_slope = sd_slope,
                                               rho = rho,
                                               sd_randomnoise = sd_randomnoise, 
                                               lod = 25)
# Output: [[nsims]] [[nk]] [n x 5]
save(df_sims_four_winners,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_four-winners-ttp.RData")))
