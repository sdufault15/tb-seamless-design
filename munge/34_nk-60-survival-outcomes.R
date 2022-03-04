###########################################################################
# Call in survival characteristics and generate survival outcomes
# Separate file per sample size
###########################################################################

files <- file.info(list.files(here("data", "simulated-datasets/"), full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "log10ttp-fixed-effects-simulated-data-nk60.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)])
rm(file_interest,files)

source(here("lib", "weibull-survival-function.R"))
source(here("lib", "coef-function.R"))
library(simsurv)

s.1 <- list(0.97, 0.95, 0.9) # survival at the end of follow-up (26 weeks) for the control arm

###################
# Regimen characteristics
###################

# A mixture of suboptimal, minimal, and desirable regimens
situation1 <- lapply(s.1, function(xx){
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
situation2 <- lapply(s.1, function(xx){
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
situation3 <- lapply(s.1, function(xx){
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

source(here("lib","log-hazard-function.R"))


###################
# Regimen coefficients
###################
true.coefs <- list(
  s97.situation1 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation1[[1]]$main.eff[1],
    regimen2 = situation1[[1]]$main.eff[2],
    regimen3 = situation1[[1]]$main.eff[3],
    regimen4 = situation1[[1]]$main.eff[4],
    regimen5 = situation1[[1]]$main.eff[5],
    duration.fun = log(1.05)),
  s95.situation1 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation1[[2]]$main.eff[1],
    regimen2 = situation1[[2]]$main.eff[2],
    regimen3 = situation1[[2]]$main.eff[3],
    regimen4 = situation1[[2]]$main.eff[4],
    regimen5 = situation1[[2]]$main.eff[5],
    duration.fun = log(1.05)),
  s90.situation1 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation1[[3]]$main.eff[1],
    regimen2 = situation1[[3]]$main.eff[2],
    regimen3 = situation1[[3]]$main.eff[3],
    regimen4 = situation1[[3]]$main.eff[4],
    regimen5 = situation1[[3]]$main.eff[5],
    duration.fun = log(1.05)),
  s97.situation2 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation2[[1]]$main.eff[1],
    regimen2 = situation2[[1]]$main.eff[2],
    regimen3 = situation2[[1]]$main.eff[3],
    regimen4 = situation2[[1]]$main.eff[4],
    regimen5 = situation2[[1]]$main.eff[5],
    duration.fun = log(1.05)),
  s95.situation2 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation2[[2]]$main.eff[1],
    regimen2 = situation2[[2]]$main.eff[2],
    regimen3 = situation2[[2]]$main.eff[3],
    regimen4 = situation2[[2]]$main.eff[4],
    regimen5 = situation2[[2]]$main.eff[5],
    duration.fun = log(1.05)),
  s90.situation2 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation2[[3]]$main.eff[1],
    regimen2 = situation2[[3]]$main.eff[2],
    regimen3 = situation2[[3]]$main.eff[3],
    regimen4 = situation2[[3]]$main.eff[4],
    regimen5 = situation2[[3]]$main.eff[5],
    duration.fun = log(1.05)),
  s97.situation3 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation3[[1]]$main.eff[1],
    regimen2 = situation3[[1]]$main.eff[2],
    regimen3 = situation3[[1]]$main.eff[3],
    regimen4 = situation3[[1]]$main.eff[4],
    regimen5 = situation3[[1]]$main.eff[5],
    duration.fun = log(1.05)),
  s95.situation3 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation3[[2]]$main.eff[1],
    regimen2 = situation3[[2]]$main.eff[2],
    regimen3 = situation3[[2]]$main.eff[3],
    regimen4 = situation3[[2]]$main.eff[4],
    regimen5 = situation3[[2]]$main.eff[5],
    duration.fun = log(1.05)),
  s90.situation3 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation3[[3]]$main.eff[1],
    regimen2 = situation3[[3]]$main.eff[2],
    regimen3 = situation3[[3]]$main.eff[3],
    regimen4 = situation3[[3]]$main.eff[4],
    regimen5 = situation3[[3]]$main.eff[5],
    duration.fun = log(1.05))
  
)


###################
# Setting up indicator functions
##################

nk_60_ind <- nk_60_fixed_effects %>%
  map(~map(.x,
             # set up indicator functions
             ~mutate(.x, 
                     regimen2 = ifelse(regimen == 2, 1, 0),
                     regimen3 = ifelse(regimen == 3, 1, 0),
                     regimen4 = ifelse(regimen == 4, 1, 0),
                     regimen5 = ifelse(regimen == 5, 1, 0),
                     # Set up duration function
                     duration.fun = ifelse(regimen == 1, 0, 16 - duration))))

####################
# Simulating survival times 
####################

maxt <- 48

simsurv_wrapper <- function(simdf, betas, loghaz, maxt){
  
  tempdf <- simdf %>% 
    # Only want 1 row per person
    dplyr::select(patient.id, duration, regimen, regimen2:duration.fun) %>% 
    distinct()
  
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

true.coefs.sub <- true.coefs
library(furrr)
plan(multisession)
nk_60_outcome_1 <- nk_60_ind %>% 
  future_map(~map(.x, 
                  ~simsurv_wrapper(.x, 
                                   betas = true.coefs.sub,
                                   loghaz = log_haz_1,
                                   maxt = maxt)),
             .options = furrr_options(seed = TRUE))

save(nk_60_outcome_1,
     file = here("data","simulated-datasets",
                 paste0(Sys.Date(), "_full-data-nk60-survival-97.RData")))
