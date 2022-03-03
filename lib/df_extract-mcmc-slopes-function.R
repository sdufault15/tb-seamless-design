mcmc_estimates_function <- function(modresults){
  # extract the MCMC regression coefficients
  mcmc_regcoef <- brms::as_draws_df(modresults)
  
  # estimate the MCMC slopes
  fit2 <- mcmc_regcoef %>% 
    transmute(
      arm1 = `b_week`,
      arm2 = `b_week` + `b_week:arm2`,
      arm3 = `b_week` + `b_week:arm3`,
      arm4 = `b_week` + `b_week:arm4`,
      arm5 = `b_week` + `b_week:arm5`
  )
  return(fit2)
}

