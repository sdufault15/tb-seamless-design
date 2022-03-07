library(here)
library(tidyverse)
library(furrr)

pi_fun <- function(dfmcmc, alpha1 = 0.95, alpha2 = 0.8){
  ###########################################################################
  # How confident are we that each arm is better than the control?
  ############################################################################
  pws_comp <- apply(dfmcmc,1,function(x){x > x[1]})
  p_better <- rowMeans(pws_comp)
  ###########################################################################
  # How confident are we that each arm is in the top 2?
  ############################################################################
  rnks <- apply(dfmcmc, 1, rank) # rank by mcmc step
  p_intop2 <- rowMeans(rnks >= 4) 
  
  #######################
  # Combine
  #######################
  temp <- data.frame(p_better, p_intop2) %>% 
    rownames_to_column("arm") %>% 
    rowwise() %>% 
    mutate(continues.2criteria = as.numeric(p_better >= alpha1)*as.numeric(p_intop2 >= alpha2),
           continues.1criteria.80 = as.numeric(p_better >= 0.8),
           continues.1criteria.90 = as.numeric(p_better >= 0.9),
           continues.1criteria.95 = as.numeric(p_better >= 0.95))
  
  return(temp)
}

plan(multisession)
even_ttp <- mcmc_mods_even  %>% 
  future_map_dfr(~pi_fun(dfmcmc = .x,
                  alpha1 = 0.8,
                  alpha2 = 0.8),
          .id = "sim")
high_ttp <- mcmc_mods_high  %>% 
  future_map_dfr(~pi_fun(dfmcmc = .x,
                         alpha1 = 0.8,
                         alpha2 = 0.8),
                 .id = "sim")
highlow_ttp <- mcmc_mods_highlow  %>% 
  future_map_dfr(~pi_fun(dfmcmc = .x,
                         alpha1 = 0.8,
                         alpha2 = 0.8),
                 .id = "sim")

### save these results
simlevel_ttp <- list(even_ttp = even_ttp,
                     high_ttp = high_ttp,
                     highlow_ttp = highlow_ttp)
save(simlevel_ttp,
     file = here("data","analyzed", paste0(Sys.Date(), "_sim-level-ttp-results_", identifier, ".RData")))
############

even_ttp_results <- even_ttp %>% 
  group_by(arm) %>% 
  summarise(P.continues.2criteria = mean(continues.2criteria),
            P.continues.1criteria.80 = mean(continues.1criteria.80),
            P.continues.1criteria.90 = mean(continues.1criteria.90),
            P.continues.1criteria.95 = mean(continues.1criteria.95),
            nsims = n_distinct(sim)) %>% 
  mutate(ttp.condition = "even",
         nk = nk)

high_ttp_results <- high_ttp %>% 
  group_by(arm) %>% 
  summarise(P.continues.2criteria = mean(continues.2criteria),
            P.continues.1criteria.80 = mean(continues.1criteria.80),
            P.continues.1criteria.90 = mean(continues.1criteria.90),
            P.continues.1criteria.95 = mean(continues.1criteria.95),
            nsims = n_distinct(sim)) %>% 
  mutate(ttp.condition = "high",
         nk = nk)

highlow_ttp_results <- highlow_ttp %>% 
  group_by(arm) %>% 
  summarise(P.continues.2criteria = mean(continues.2criteria),
            P.continues.1criteria.80 = mean(continues.1criteria.80),
            P.continues.1criteria.90 = mean(continues.1criteria.90),
            P.continues.1criteria.95 = mean(continues.1criteria.95),
            nsims = n_distinct(sim)) %>% 
  mutate(ttp.condition = "highlow",
         nk = nk)

output_ttp <- bind_rows(even_ttp_results,
                        high_ttp_results,
                        highlow_ttp_results)

save(output_ttp, file = here("data", "analyzed", 
                             paste0(Sys.Date(), "_advancing-based-on-ttp-alone_",identifier,".RData")))
