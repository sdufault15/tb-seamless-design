df_sim_fun <- function(nk, k, betas, weeks, sd_id, sd_randomnoise, lod){
  df_temp <- data.frame(
    # Generate repeated measures patient ids
    patient.id = rep(paste0("id", 1:(nk*k)), 
                     each = weeks + 1),
    # Generate the index for weeks under observation
    week = rep(0:weeks, nk*k),
    # Generate the arm ID
    arm = rep(1:k, each = (weeks + 1)*nk)) %>% 
    # Generate a random effect for each individual(b_i) which is a draw from the normal distribution with mean 0 and SD = individual-level variability
    mutate(bi = rep(rnorm(nk*k, mean = 0, sd = sd_id), each = weeks + 1)) %>% 
    # Generate residual error term for each time, eij, which is a draw from a normal distribution with mean 0 and SD equal to residual variability
    mutate(eij = rep(rnorm(nk*k*(weeks + 1), mean = 0, sd = sd_randomnoise))) %>% 
    # Jitter weeks
    mutate(week = ifelse(week > 0, week + runif(nk*k,-0.3,0.3), week)) %>% 
    # rowwise() %>% 
    # simulate outcome for each patient at each time
    mutate(yij = betas[1] + # intercept 
             betas[2]*week + # control group 
             bi + eij) %>% # random intercept and noise
    mutate(yij = ifelse(arm > 1, yij + betas[arm + 1]*week, yij)) %>%  # relative % change for arm k) %>%  
    # betas[3]*weeks*(arm == 2) + 
    # betas[4]*weeks*(arm == 3) + 
    # betas[5]*weeks*(arm == 4) + 
    # betas[6]*weeks*(arm == 5) + 
    mutate(censored = ifelse(yij > log10(lod), "right", "none"),
           yij_censored = ifelse(yij > log10(lod), log10(lod), yij)) %>% 
    mutate(arm = as.factor(arm))
  
  return(df_temp)
}

