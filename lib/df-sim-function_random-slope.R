df_sim_fun <- function(nk, k, betas, weeks, sd_id, sd_slope, rho, sd_randomnoise, lod){
  # Set up random effects
  cormat <- matrix(c(sd_id, # sd random intercept
                     rho, rho, #rho
                     sd_slope), # sd random slope
                   2,2)
  covmat <- lme4::sdcor2cov(cormat) # covariance matrix
  umat <- MASS::mvrnorm(nk*k, 
                        mu = c(0,0),
                        covmat,
                        empirical = TRUE)
  
  Z <- data.frame(umat) %>% 
    rename("random.intercept" = 1, "random.slope" = 2) %>% 
    mutate(patient.id = paste0("id", row_number())) %>% 
    dplyr::select(patient.id, everything())
  
  # Set up fixed effects
  df_temp <- data.frame(
    # Generate repeated measures patient ids
    patient.id = rep(paste0("id", 1:(nk*k)), 
                     each = weeks + 1),
    # Generate the index for weeks under observation
    week = rep(0:weeks, nk*k),
    # Generate the arm ID
    arm = rep(1:k, each = (weeks + 1)*nk)) %>% 
    # Generate residual error term for each time, eij, which is a draw from a normal distribution with mean 0 and SD equal to residual variability
    mutate(eij = rep(rnorm(nk*k*(weeks + 1), mean = 0, sd = sd_randomnoise))) %>% 
    # Jitter weeks
    mutate(week = ifelse(week > 0, week + runif(nk*k,-0.3,0.3), week)) 
  
  # Add fixed and random effects
  df_temp <- df_temp %>% 
    full_join(Z, by = "patient.id") %>% 
    # simulate outcome for each patient at each time
    mutate(intercept = random.intercept + betas[1],
           control.slope = random.slope + betas[2]) %>% # + as.numeric(arm == 2)*betas[3] + as.numeric(arm == 3)*betas[4]) %>% 
    rowwise() %>% 
    mutate(yij = intercept + control.slope*week + eij) %>% 
    mutate(yij = ifelse(arm > 1, yij + betas[arm + 1]*week, yij)) %>% # relative % change for arm k
    mutate(censored = ifelse(yij > log10(lod), "right", "none"),
           yij_censored = ifelse(yij > log10(lod), log10(lod), yij)) %>% 
    mutate(arm = as.factor(arm)) %>% 
    dplyr::select(patient.id, arm, week, yij, censored, yij_censored)
  
  return(df_temp)
}

