df_sim_wrapper_function <- function(n_sims, betas, slopes, weeks = 8, nk = 20, sd_id, sd_slope, rho, 
                                    sd_randomnoise, lod = 42){
  # betas is the pre-specified intercept and control group slope
  # slopes is a vector of length K-1 containing the %change in slope for treatment arm k compared to control
  # weeks is an integer refering to the duration of follow-up (assumed visits occur once per week, approximately)
  # nk is a list or integer of sample sizes per arm
  # sd_id is a numeric reflecting the standard deviation of the repeated measures by individual
  # sd_slope is a numeric reflecting the standard deviation of the individual-level slopes
  # rho is the correlation between the random intercept and the random slopes
  # sd_randomnoise is the random error/noise associated with each observation (epsilon_it) 
  # lod is the limit of detection
  
  beta_arms <- betas[2]*slopes # multiplying the control group slope by the a priori %change
  betas <- c(betas, beta_arms) # length k+1 (intercept + slopes per K arms)
  k <- length(betas) - 1 # number of regimens (minus intercept)
    
  df_list <- future_map(1:n_sims, 
                        ~map(nk, ~df_sim_fun(nk = .x,
                                             k = k,
                                             betas = betas,
                                             weeks = weeks,
                                             sd_id = sd_id,
                                             sd_slope = sd_slope, 
                                             rho = rho,
                                             sd_randomnoise = sd_randomnoise,
                                             lod = lod)),
                        .options = furrr_options(seed = 123534))
  return(df_list)
  
}
