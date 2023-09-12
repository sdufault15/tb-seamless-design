##################################
# Steeper than control
# Suzanne Dufault
# July 7, 2022
##################################

source(here("lib", "mcmc-compare-v-control.R"))

compare_null <- future_map(mcmc_null,
                           ~map_dfr(.x, 
                                    ~mcmc_v_control_function(.x),
                                    .id = "sim")) %>% 
  map_dfr(~.x, .id = "nk") %>% 
  mutate(condition = "Null")

compare_even <- future_map(mcmc_even,
                           ~map_dfr(.x, 
                                    ~mcmc_v_control_function(.x),
                                    .id = "sim")) %>% 
  map_dfr(~.x, .id = "nk") %>% 
  mutate(condition = "Even")

compare_highlow <- future_map(mcmc_highlow,
                              ~map_dfr(.x, 
                                       ~mcmc_v_control_function(.x),
                                       .id = "sim")) %>% 
  map_dfr(~.x, .id = "nk") %>% 
  mutate(condition = "High-low")

compare_high <- future_map(mcmc_high,
                           ~map_dfr(.x, 
                                    ~mcmc_v_control_function(.x),
                                    .id = "sim")) %>% 
  map_dfr(~.x, .id = "nk") %>% 
  mutate(condition = "High")

comparisons <- bind_rows(compare_null,
                         compare_even,
                         compare_highlow,
                         compare_high)
save(comparisons, file = here("data", "analyzed", "ranking",
                              paste0(Sys.Date(), "_compare-v-control.RData")))
beepr::beep()
