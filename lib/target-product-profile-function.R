decision_function <- function(mcmc_list, nk, theta_lrv, theta_tv, tau_lrv, tau_tv){
  out <- map_dfr(mcmc_list,  
                 # Convert to % relative to control
                 ~mutate(.x, 
                         `Allocation 2` = ((alloc2/alloc1) - 1)*100,
                         `Allocation 3` = ((alloc3/alloc1) - 1)*100,) %>% 
                   dplyr::select(`Allocation 2`:`Allocation 3`) %>% 
                   pivot_longer(cols = 1:2,
                                names_to = "Allocation",
                                values_to = "Slope, %") %>% 
                   group_by(Allocation) %>% 
                   summarise(CI.025 = quantile(`Slope, %`, probs = tau_lrv),
                             CI.975 = quantile(`Slope, %`, probs = 1-tau_tv)) %>% 
                   mutate(Decision = case_when(CI.975 < theta_tv ~ "NO-GO", # If it doesn't have hope of reaching target value, it's stopped
                                               ((CI.025 > theta_lrv) & (CI.975 > theta_tv)) ~ "GO", # if the CI includes TV and is entirely above the LRV, then it goes
                                               TRUE ~ "Continue")),
                 .id = "sim") %>% 
    mutate(nk = nk)
  return(out)
}
