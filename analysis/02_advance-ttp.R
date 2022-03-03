library(here)
library(tidyverse)
library(furrr)

load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-even-30.RData") 
load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-high-30.RData") 
load("~/OneDrive - University of California, San Francisco/Research/phase2b-simstudy/data/cleaned-results/2022-02-25_mcmc-mods-highlow-30.RData") 

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
even_30_ttp <- mcmc_mods_even_30 %>% 
  future_map_dfr(~pi_fun(dfmcmc = .x,
                  alpha1 = 0.8,
                  alpha2 = 0.8),
          .id = "sim")
high_30_ttp <- mcmc_mods_high_30 %>% 
  future_map_dfr(~pi_fun(dfmcmc = .x,
                         alpha1 = 0.8,
                         alpha2 = 0.8),
                 .id = "sim")
highlow_30_ttp <- mcmc_mods_highlow_30 %>% 
  future_map_dfr(~pi_fun(dfmcmc = .x,
                         alpha1 = 0.8,
                         alpha2 = 0.8),
                 .id = "sim")

### save these results
simlevel_ttp <- list(even_30_ttp = even_30_ttp,
                     high_30_ttp = high_30_ttp,
                     highlow_30_ttp = highlow_30_ttp)
save(simlevel_ttp,
     file = here("data","analyzed", paste0(Sys.Date(), "_sim-level-ttp-results_nk30_", identifier, ".RData")))
############

even_30_ttp_results <- even_30_ttp %>% 
  group_by(arm) %>% 
  summarise(P.continues.2criteria = mean(continues.2criteria),
            P.continues.1criteria.80 = mean(continues.1criteria.80),
            P.continues.1criteria.90 = mean(continues.1criteria.90),
            P.continues.1criteria.95 = mean(continues.1criteria.95),
            nsims = n_distinct(sim)) %>% 
  mutate(ttp.condition = "even",
         nk = 30)

high_30_ttp_results <- high_30_ttp %>% 
  group_by(arm) %>% 
  summarise(P.continues.2criteria = mean(continues.2criteria),
            P.continues.1criteria.80 = mean(continues.1criteria.80),
            P.continues.1criteria.90 = mean(continues.1criteria.90),
            P.continues.1criteria.95 = mean(continues.1criteria.95),
            nsims = n_distinct(sim)) %>% 
  mutate(ttp.condition = "high",
         nk = 30)

highlow_30_ttp_results <- highlow_30_ttp %>% 
  group_by(arm) %>% 
  summarise(P.continues.2criteria = mean(continues.2criteria),
            P.continues.1criteria.80 = mean(continues.1criteria.80),
            P.continues.1criteria.90 = mean(continues.1criteria.90),
            P.continues.1criteria.95 = mean(continues.1criteria.95),
            nsims = n_distinct(sim)) %>% 
  mutate(ttp.condition = "highlow",
         nk = 30)

output_ttp <- bind_rows(even_30_ttp_results,
                        high_30_ttp_results,
                        highlow_30_ttp_results)

# output_ttp_min <- bind_rows(summarize(group_by(even_30_ttp, arm), 
#                                       P.continues = mean(p_better),
#                                       condition = "even"),
#                             summarize(group_by(high_30_ttp, arm), 
#                                       P.continues = mean(p_better),
#                                       condition = "high"),
#                             summarize(group_by(highlow_30_ttp, arm), 
#                                       P.continues = mean(p_better),
#                                       condition = "highlow"))
save(output_ttp, file = here("data", "analyzed", 
                             paste0(Sys.Date(), "_advancing-based-on-ttp-alone_",identifier,".RData")))

# save(output_ttp_min,
#      file = here("data", "analyzed", 
#                  paste0(Sys.Date(), "_advancing-based-on-ttp-alone_min-requirements.RData")))
# 
# 
# plan(multisession)
# even_30_ttp_min <- mcmc_mods_even_30 %>% 
#   future_map_dfr(~pi_fun_min(dfmcmc = .x,
#                          alpha1 = 0.8,
#                          alpha2 = 0.8),
#                  .id = "sim")
# high_30_ttp_min <- mcmc_mods_high_30 %>% 
#   future_map_dfr(~pi_fun_min(dfmcmc = .x,
#                          alpha1 = 0.8,
#                          alpha2 = 0.8),
#                  .id = "sim")
# highlow_30_ttp_min <- mcmc_mods_highlow_30 %>% 
#   future_map_dfr(~pi_fun_min(dfmcmc = .x,
#                          alpha1 = 0.8,
#                          alpha2 = 0.8),
#                  .id = "sim")
# 
# even_30_ttp_results_min <- even_30_ttp_min %>% 
#   group_by(arm) %>% 
#   summarise(P.continues = mean(continues),
#             nsims = n_distinct(sim)) %>% 
#   mutate(ttp.condition = "even",
#          nk = 30)
# 
# high_30_ttp_results_min <- high_30_ttp_min %>% 
#   group_by(arm) %>% 
#   summarise(P.continues = mean(continues),
#             nsims = n_distinct(sim)) %>% 
#   mutate(ttp.condition = "high",
#          nk = 30)
# 
# highlow_30_ttp_results_min <- highlow_30_ttp_min %>% 
#   group_by(arm) %>% 
#   summarise(P.continues = mean(continues),
#             nsims = n_distinct(sim)) %>% 
#   mutate(ttp.condition = "highlow",
#          nk = 30)

output_ttp <- bind_rows(even_30_ttp_results,
                        high_30_ttp_results,
                        highlow_30_ttp_results)
save(output_ttp, file = here("data", "analyzed", 
                             paste0(Sys.Date(), "_advancing-based-on-ttp-alone",identifier,".RData")))
