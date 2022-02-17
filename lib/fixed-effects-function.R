fixed_effects_function <- function(simdata, k = 5, d = c(8,10,12,14,16), nkd = 6, enroll.time.weeks) {
  set.seed(123534)
  # Fixed effects
  fe_df <- data.frame(patient.id = simdata[[1]]$patient.id) %>% 
    distinct() %>% 
    mutate(enroll.day = sample(1:(7*enroll.time.weeks), size = nkd*k*length(d), replace = TRUE),
           duration = rep(d, each = nkd*k))
  
  output <- simdata %>% 
    map(~ungroup(.x) %>% 
          left_join(fe_df) %>% 
          # Change duration to 26 for all people in the control regimen
          rename(regimen = arm) %>% 
          mutate(duration = ifelse(regimen == 1, 26, duration)))  
  
  return(output)
}