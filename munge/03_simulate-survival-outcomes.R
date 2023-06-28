#################################
# Simulate unfavorable outcome data
# Initiated: June 27, 2023
# Updated: June 27, 2023
#################################

source(here("lib", "coef-function.R"))
source(here("lib", "weibull-survival-function.R"))
source(here("lib", "log-hazard-function.R"))
source(here("lib","log-hazard-function.R"))

# Call in simulated TTP + FE data
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


s.1 <- list(0.97, 0.95, 0.9) # survival at the end of follow-up (26 weeks) for the control arm

###################
# Regimen characteristics
###################

# A mixture of suboptimal, minimal, and desirable regimens
mixture <- lapply(s.1, function(xx){
  beta1 <- coef.function(s.1 = xx, s.k = 1-(1-xx)*2, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta2 <- coef.function(s.1 = xx, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta3 <- coef.function(s.1 = xx, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta4 <- coef.function(s.1 = xx, s.k = 1-(1-xx)/2, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  
  beta0 <- log(uniroot(weibull_survival_function,
                       p = 0.425,
                       surv.prop = xx,
                       t = 26,
                       interval = c(0,10))$root)
  
  output <- cbind(coef = c("beta0", "beta1", "beta2", "beta3", "beta4"),
                  bind_rows(data.frame(main.eff = beta0), beta1, beta2, beta3, beta4))
  return(output)}
)

# All are desirable
all_desirable <- lapply(s.1, function(xx){
  beta1 <- coef.function(s.1 = 1-(1-xx)/2, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta2 <- coef.function(s.1 = 1-(1-xx)/2, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta3 <- coef.function(s.1 = 1-(1-xx)/2, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta4 <- coef.function(s.1 = 1-(1-xx)/2, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  
  beta0 <- log(uniroot(weibull_survival_function,
                       p = 0.425,
                       surv.prop = xx,
                       t = 26,
                       interval = c(0,10))$root)
  
  output <- cbind(coef = c("beta0", "beta1", "beta2", "beta3", "beta4"),
                  bind_rows(data.frame(main.eff = beta0), beta1, beta2, beta3, beta4))
  return(output)}
)

# All are minimal
all_minimal <- lapply(s.1, function(xx){
  beta1 <- coef.function(s.1 = xx, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta2 <- coef.function(s.1 = xx, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta3 <- coef.function(s.1 = xx, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta4 <- coef.function(s.1 = xx, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  
  beta0 <- log(uniroot(weibull_survival_function,
                       p = 0.425,
                       surv.prop = xx,
                       t = 26,
                       interval = c(0,10))$root)
  
  output <- cbind(coef = c("beta0", "beta1", "beta2", "beta3", "beta4"),
                  bind_rows(data.frame(main.eff = beta0), beta1, beta2, beta3, beta4))
  return(output)}
)

# All sub-optimal
all_suboptimal <- lapply(s.1, function(xx){
  beta1 <- coef.function(s.1 = xx, s.k = 1-(1-xx)*2, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta2 <- coef.function(s.1 = xx, s.k = 1-(1-xx)*2, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta3 <- coef.function(s.1 = xx, s.k = 1-(1-xx)*2, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta4 <- coef.function(s.1 = xx, s.k = 1-(1-xx)*2, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  
  beta0 <- log(uniroot(weibull_survival_function,
                       p = 0.425,
                       surv.prop = xx,
                       t = 26,
                       interval = c(0,10))$root)
  
  output <- cbind(coef = c("beta0", "beta1", "beta2", "beta3", "beta4"),
                  bind_rows(data.frame(main.eff = beta0), beta1, beta2, beta3, beta4))
  return(output)}
)

###################
# Regimen coefficients
###################
true.coefs <- list(
  s97.mixture = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = mixture[[1]]$main.eff[1],
    regimen2 = mixture[[1]]$main.eff[2],
    regimen3 = mixture[[1]]$main.eff[3],
    regimen4 = mixture[[1]]$main.eff[4],
    regimen5 = mixture[[1]]$main.eff[5],
    duration.fun = log(1.05)),
  s95.mixture = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = mixture[[2]]$main.eff[1],
    regimen2 = mixture[[2]]$main.eff[2],
    regimen3 = mixture[[2]]$main.eff[3],
    regimen4 = mixture[[2]]$main.eff[4],
    regimen5 = mixture[[2]]$main.eff[5],
    duration.fun = log(1.05)),
  s90.mixture = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = mixture[[3]]$main.eff[1],
    regimen2 = mixture[[3]]$main.eff[2],
    regimen3 = mixture[[3]]$main.eff[3],
    regimen4 = mixture[[3]]$main.eff[4],
    regimen5 = mixture[[3]]$main.eff[5],
    duration.fun = log(1.05)),
  s97.all_desirable = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_desirable[[1]]$main.eff[1],
    regimen2 = all_desirable[[1]]$main.eff[2],
    regimen3 = all_desirable[[1]]$main.eff[3],
    regimen4 = all_desirable[[1]]$main.eff[4],
    regimen5 = all_desirable[[1]]$main.eff[5],
    duration.fun = log(1.05)),
  s95.all_desirable = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_desirable[[2]]$main.eff[1],
    regimen2 = all_desirable[[2]]$main.eff[2],
    regimen3 = all_desirable[[2]]$main.eff[3],
    regimen4 = all_desirable[[2]]$main.eff[4],
    regimen5 = all_desirable[[2]]$main.eff[5],
    duration.fun = log(1.05)),
  s90.all_desirable = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_desirable[[3]]$main.eff[1],
    regimen2 = all_desirable[[3]]$main.eff[2],
    regimen3 = all_desirable[[3]]$main.eff[3],
    regimen4 = all_desirable[[3]]$main.eff[4],
    regimen5 = all_desirable[[3]]$main.eff[5],
    duration.fun = log(1.05)),
  s97.all_minimal = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_minimal[[1]]$main.eff[1],
    regimen2 = all_minimal[[1]]$main.eff[2],
    regimen3 = all_minimal[[1]]$main.eff[3],
    regimen4 = all_minimal[[1]]$main.eff[4],
    regimen5 = all_minimal[[1]]$main.eff[5],
    duration.fun = log(1.05)),
  s95.all_minimal = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_minimal[[2]]$main.eff[1],
    regimen2 = all_minimal[[2]]$main.eff[2],
    regimen3 = all_minimal[[2]]$main.eff[3],
    regimen4 = all_minimal[[2]]$main.eff[4],
    regimen5 = all_minimal[[2]]$main.eff[5],
    duration.fun = log(1.05)),
  s90.all_minimal = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_minimal[[3]]$main.eff[1],
    regimen2 = all_minimal[[3]]$main.eff[2],
    regimen3 = all_minimal[[3]]$main.eff[3],
    regimen4 = all_minimal[[3]]$main.eff[4],
    regimen5 = all_minimal[[3]]$main.eff[5],
    duration.fun = log(1.05)),
  s97.all_suboptimal = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_suboptimal[[1]]$main.eff[1],
    regimen2 = all_suboptimal[[1]]$main.eff[2],
    regimen3 = all_suboptimal[[1]]$main.eff[3],
    regimen4 = all_suboptimal[[1]]$main.eff[4],
    regimen5 = all_suboptimal[[1]]$main.eff[5],
    duration.fun = log(1.05)),
  s95.all_suboptimal = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_suboptimal[[2]]$main.eff[1],
    regimen2 = all_suboptimal[[2]]$main.eff[2],
    regimen3 = all_suboptimal[[2]]$main.eff[3],
    regimen4 = all_suboptimal[[2]]$main.eff[4],
    regimen5 = all_suboptimal[[2]]$main.eff[5],
    duration.fun = log(1.05)),
  s90.all_suboptimal = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = all_suboptimal[[3]]$main.eff[1],
    regimen2 = all_suboptimal[[3]]$main.eff[2],
    regimen3 = all_suboptimal[[3]]$main.eff[3],
    regimen4 = all_suboptimal[[3]]$main.eff[4],
    regimen5 = all_suboptimal[[3]]$main.eff[5],
    duration.fun = log(1.05))
  
)


###################
# Setting up indicator functions
##################

df_sims_no_winners_fe <- df_sims_no_winners_fe %>% 
  map(~mutate(.x,
              regimen2 = ifelse(regimen == 2, 1, 0),
              regimen3 = ifelse(regimen == 3, 1, 0),
              regimen4 = ifelse(regimen == 4, 1, 0),
              regimen5 = ifelse(regimen == 5, 1, 0),
              # Set up duration function
              duration.fun = ifelse(regimen == 1, 0, 16 - duration)))

df_sims_one_winner_fe <- df_sims_one_winner_fe %>% 
  map(~mutate(.x,
              regimen2 = ifelse(regimen == 2, 1, 0),
              regimen3 = ifelse(regimen == 3, 1, 0),
              regimen4 = ifelse(regimen == 4, 1, 0),
              regimen5 = ifelse(regimen == 5, 1, 0),
              # Set up duration function
              duration.fun = ifelse(regimen == 1, 0, 16 - duration)))

df_sims_two_winners_fe <- df_sims_two_winners_fe %>% 
  map(~mutate(.x,
              regimen2 = ifelse(regimen == 2, 1, 0),
              regimen3 = ifelse(regimen == 3, 1, 0),
              regimen4 = ifelse(regimen == 4, 1, 0),
              regimen5 = ifelse(regimen == 5, 1, 0),
              # Set up duration function
              duration.fun = ifelse(regimen == 1, 0, 16 - duration)))

df_sims_four_winners_fe <- df_sims_four_winners_fe %>% 
  map(~mutate(.x,
              regimen2 = ifelse(regimen == 2, 1, 0),
              regimen3 = ifelse(regimen == 3, 1, 0),
              regimen4 = ifelse(regimen == 4, 1, 0),
              regimen5 = ifelse(regimen == 5, 1, 0),
              # Set up duration function
              duration.fun = ifelse(regimen == 1, 0, 16 - duration)))

####################
# Simulating survival times 
####################

maxt <- 52

simsurv_wrapper <- function(simdf, betas, loghaz, maxt){
  
  tempdf <- simdf %>% 
    # Only want 1 row per person
    dplyr::select(patient.id, duration, regimen, nk, regimen2:duration.fun) %>% 
    distinct()
  
  assertthat::assert_that(nrow(tempdf) == sum(nkd)*k)
  
  temp <- map(betas,
              ~simsurv(dist = "weibull",
                       betas = .x,
                       loghazard = log_haz_1,
                       x = tempdf,
                       maxt = maxt,
                       #seed = TRUE, # IMPROPER - FORCES SAME SIMULATED DATA FOR ALL ITERATIONS
                       rootsolver = "uniroot",
                       interval = c(1e-32, maxt + 2)))
  output <- temp %>% 
    map(~bind_cols(.x, tempdf) %>%
          full_join(simdf) %>% 
          mutate(regimen = factor(regimen, levels = 1:5)))
  
  return(output)
}

ncores <- parallelly::availableCores()
plan(future::multisession(workers = ncores))

# A list of length [nsims] x list of length [12 survival settings] x dataframe of [nkd*k*(0-8 weeks of ttp) rows x 17 variables]
df_sims_no_winners_fe_surv <- df_sims_no_winners_fe %>% 
  future_map(~simsurv_wrapper(.x,
                              betas = true.coefs,
                              loghaz = log_haz_1,
                              maxt = maxt),
             .options = furrr_options(seed = TRUE))
save(df_sims_no_winners_fe,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_no-winners-ttp-fe-survival.RData")))

df_sims_one_winner_fe_surv <- df_sims_one_winner_fe %>% 
  future_map(~simsurv_wrapper(.x,
                              betas = true.coefs,
                              loghaz = log_haz_1,
                              maxt = maxt),
             .options = furrr_options(seed = TRUE))
save(df_sims_one_winner_fe,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_one-winner-ttp-fe-survival.RData")))

df_sims_two_winners_fe_surv <- df_sims_two_winners_fe %>% 
  future_map(~simsurv_wrapper(.x,
                              betas = true.coefs,
                              loghaz = log_haz_1,
                              maxt = maxt),
             .options = furrr_options(seed = TRUE))
save(df_sims_two_winners_fe,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_two-winners-ttp-fe-survival.RData")))

df_sims_four_winners_fe_surv <- df_sims_four_winners_fe %>% 
  future_map(~simsurv_wrapper(.x,
                              betas = true.coefs,
                              loghaz = log_haz_1,
                              maxt = maxt),
             .options = furrr_options(seed = TRUE))
save(df_sims_four_winners_fe,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_four-winners-ttp-fe-survival.RData")))

