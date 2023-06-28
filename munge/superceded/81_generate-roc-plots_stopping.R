roc_function <- function(df_proc, relapse_rate_limit, n_relapse, ttp_rate_limit = 0.15, p_confidence_limit){
  temp <- df_proc %>% 
    # Removing the reference group since we wouldn't drop the control for futility
    filter(!is.na(`TTP Slope`)) %>% 
    # Estimating the true positives based on true, underlying conditions
    mutate(true.positives = as.numeric(`TTP Slope` < ttp_rate_limit | `Relapse rate` %in% relapse_rate_limit),
           # Estimating empirical positives based on observed estimates
           empirical.positives = as.numeric(p_better < p_confidence_limit | n_relapse_interim1 >= n_relapse)) %>% 
    # False positives are all cases that are flagged positive that shouldn't be based on truth
    mutate(false.positives = case_when(empirical.positives == 1 & true.positives == 0 ~ 1,
                                       TRUE ~ 0),
           false.negatives = case_when(empirical.positives == 0 & true.positives == 1 ~ 1,
                                       TRUE ~ 0),
           # True negatives are all cases that are flagged negative that are actually negative based on truth
           true.negatives = case_when(empirical.positives == 0 & true.positives == 0 ~ 1,
                                      TRUE ~ 0))
  
  temp %>% 
    group_by(nk, ttp.condition) %>% 
    summarise(true.positive.rate = sum(true.positives)/sum(c(true.positives, false.negatives)),
              false.positive.rate = sum(false.positives)/sum(c(false.positives, true.negatives))) %>% 
    mutate(relapse_rate_limit = relapse_rate_limit,
           n_relapse = n_relapse,
           ttp_rate_limit = ttp_rate_limit,
           p_confidence_limit = p_confidence_limit)
}

temp_mixed_unproc <- bind_rows(df_30) %>% #,
                               # df_40,
                               # df_60,
                               # df_80) %>% 
  mutate("TTP Slope" = case_when(#regimen == 1 ~ "ref",
    (ttp.condition == "even" & regimen == 2) | (ttp.condition == "highlow" & regimen == 3) ~ .1,
    ttp.condition == "even" & regimen == 3 ~ .2,
    ttp.condition == "even" & regimen == 4 ~ .3,
    (ttp.condition == "even" & regimen == 5) | 
      (ttp.condition == "highlow" & regimen == 5) ~ .4,
    ttp.condition == "highlow" & regimen == 2 ~ -.1,
    (ttp.condition == "highlow" & regimen == 4) | 
      (ttp.condition == "high" & regimen == 2) ~ .35,
    ttp.condition == "high" & regimen == 3 ~ .37,
    ttp.condition == "high" & regimen == 4 ~ .39,
    ttp.condition == "high" & regimen == 5 ~ .41),
    .before = 1) %>%
  mutate("Relapse rate" = case_when(regimen == 1 ~ "5%",
                                    regimen == 2 ~ "10%",
                                    regimen %in% c(3,4) ~ "5%",
                                    regimen == 5 ~ "2.5%"),
         .before = 2) 

relapse_rate_limit <- "10%" # these are the relapse rates we want to drop (TRUTH)
ttp_rate_limit <- 0.15 # we want to drop any TTP slopes below this limit (TRUTH)
p_confidence_limit <- 0.8 # this is the level of confidence we require to keep in study (EMPIRICAL)
n_relapse <- c(0,1,2,3) # these are the number of relapses required to drop (EMPIRICAL)

t1 <- map_dfr(n_relapse, ~roc_function(df_proc = temp_mixed_unproc,
                                       relapse_rate_limit = relapse_rate_limit,
                                       ttp_rate_limit = ttp_rate_limit,
                                       p_confidence_limit = p_confidence_limit,
                                       n_relapse = .x))
t1 %>% 
  mutate(n_relapse = factor(n_relapse)) %>% 
  filter(nk == 30) %>%
  ggplot(aes(x = false.positive.rate, y = true.positive.rate)) + 
  geom_line(aes(group=ttp.condition, col = ttp.condition)) +
  scale_color_manual("TTP Simulation Condition",
                     values = ucsf_col_pal) + 
  geom_point(aes(shape = n_relapse)) +
  scale_shape_manual("Threshold: No. relapses",
                     values = c(16, 17, 15, 8)) +
  # facet_wrap(~nk) +
  coord_equal(xlim = c(0,1), ylim = c(0,1)) + 
  ggpubr::theme_pubr() +
  geom_abline(slope = 1, lty = 2) + 
  ggtitle("HRZE relapse rate = 5%",
          subtitle = "nk = 30") + 
  theme(legend.position = "right") + 
  scale_x_continuous("False Positive Rate",
                     breaks = seq(0,1,by = 0.2),
                     labels = seq(0,1,by = 0.2)) + 
  scale_y_continuous("True Positive Rate",
                     breaks = seq(0,1,by = 0.2),
                     labels = seq(0,1,by = 0.2))

ggsave(filename = here("graphs","simulation-results",
                       paste0(Sys.Date(), "_roc-futility_relapse-rate-5.png")),
       device = "png",
       units = "in",
       height = 4,
       width = 6)
