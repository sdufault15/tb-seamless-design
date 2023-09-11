decision_function <- function(mcmc_list, nk, theta_lrv, theta_tv, tau_lrv, tau_tv){
  out <- map_dfr(mcmc_list,  
                 # Convert to % relative to control
                 ~mutate(.x, 
                         `Regimen 1` = ((arm2/arm1) - 1)*100,
                         `Regimen 2` = ((arm3/arm1) - 1)*100,
                         `Regimen 3` = ((arm4/arm1) - 1)*100,
                         `Regimen 4` = ((arm5/arm1) - 1)*100) %>% 
                   dplyr::select(`Regimen 1`:`Regimen 4`) %>% 
                   pivot_longer(cols = 1:4,
                                names_to = "Regimen",
                                values_to = "Slope, %") %>% 
                   group_by(Regimen) %>% 
                   summarise(CI.025 = quantile(`Slope, %`, probs = tau_lrv),
                             CI.975 = quantile(`Slope, %`, probs = 1-tau_tv)) %>% 
                   mutate(Decision = case_when(CI.975 < theta_tv ~ "NO-GO", # If it doesn't have hope of reaching target value, it's stopped
                                               ((CI.025 > theta_lrv) & (CI.975 > theta_tv)) ~ "GO", # if the CI includes TV and is entirely above the LRV, then it goes
                                               TRUE ~ "Continue")),
                 .id = "sim") %>% 
    mutate(nk = nk)
  return(out)
}
