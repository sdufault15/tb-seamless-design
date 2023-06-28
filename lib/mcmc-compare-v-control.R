# Function to evaluate comparison against control
mcmc_v_control_function <- function(mcmc_df){
  output <- mcmc_df %>% 
    summarise(p.regimen.2.v.control = mean(arm2 > arm1), 
              p.regimen.3.v.control = mean(arm3 > arm1), 
              p.regimen.4.v.control = mean(arm4 > arm1), 
              p.regimen.5.v.control = mean(arm5 > arm1),
              chain = n())
  
  return(output)
}