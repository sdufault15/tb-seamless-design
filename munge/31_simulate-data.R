# SET RandomSeed to #
# FOR Repetition 1 to n_sim by 1
# STORE Repetition and RandomNumberState in StatesData[Repetition]
# GENERATE simulated dataset
# ...
# END FOR
# STORE n_sim+1 and RandomNumberState in StatesData[n_sim+1]
library(tidyverse)
library(here)
library(furrr)
source(here("lib","df-sim-function.R"))
source(here("lib","df-sim-wrapper-function.R"))

plan(multisession)

# Call in model being used as "truth"
files <- file.info(list.files("data/bayes-generated", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "remox-lmm-short_intercept-only_lower-detection-25"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

# Pull out coefficients
s <- summary(fit.cens.intercept.ld.25)
betas <- c(s$fixed$Estimate)[1:2] # (just the intercept and control group slope for now)

# Pull out individual-level SD
sd_id <- s$random$trial_no$Estimate[1]

# Pull out residual SD
sd_randomnoise <- s$spec_pars$Estimate[1]


###############################################################
# WANT:
# FUNCTION THAT TAKES IN VALUES OF:
### Intercept + control group slope
### RELATIVE SLOPE %
### N_K
### WEEKS (JITTERED)

# RETURNS:
### GENERATED DATASET AS AN ELEMENT OF A LIST
### DATA FRAME WITH STATE DATA (INCLUDES SEED)

#################################################################
# Slopes
# 0%,0%,0%,0%
df_sims_s0 <- df_sim_wrapper_function(n_sims = 1000,
                                      betas = betas, 
                                      slopes = rep(0,4), 
                                      weeks = 8, 
                                      nk = as.list(c(20,30,40)), 
                                      sd_id = sd_id, 
                                      sd_randomnoise = sd_randomnoise, 
                                      lod = 25)
save(df_sims_s0,
     file = here("data",
                 paste0("simulated-datasets/",Sys.Date(), "_simulated-df_null.RData")))


# Slopes
# 10%,20%,30%,40%
df_sims_s1 <- df_sim_wrapper_function(n_sims = 1000,
                                      betas = betas, 
                                      slopes = seq(0.1,0.4,by = 0.1), 
                                      weeks = 8, 
                                      nk = as.list(c(20,30,40)), 
                                      sd_id = sd_id, 
                                      sd_randomnoise = sd_randomnoise, 
                                      lod = 25)
save(df_sims_s1,
     file = here("data",
                 paste0("simulated-datasets/",Sys.Date(), "_simulated-df_even-increases.RData")))

# Slopes
# -10%,10%,35%,40
df_sims_s2 <- df_sim_wrapper_function(n_sims = 1000,
                                      betas = betas, 
                                      slopes = c(-.10,.10,.35,.40), 
                                      weeks = 8, 
                                      nk = as.list(c(20,30,40)), 
                                      sd_id = sd_id, 
                                      sd_randomnoise = sd_randomnoise, 
                                      lod = 25)
save(df_sims_s2,
     file = here("data",
                 paste0("simulated-datasets/",Sys.Date(), "_simulated-df_cluster-low-high.RData")))

# Slopes
# 35%, 37%, 39%, 41%
df_sims_s3 <- df_sim_wrapper_function(n_sims = 1000,
                                      betas = betas, 
                                      slopes = seq(.35,.41,by = 0.02),
                                      weeks = 8, 
                                      nk = as.list(c(20,30,40)), 
                                      sd_id = sd_id, 
                                      sd_randomnoise = sd_randomnoise, 
                                      lod = 25)
save(df_sims_s3,
     file = here("data",
                 paste0("simulated-datasets/",Sys.Date(), "_simulated-df_clustered-high.RData")))

