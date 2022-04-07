poly_reject <- data.frame(xx = c(-0.15,-0.15,0.15,0.15),
                          yy = c(0.8,1.1,1.1,0.8))
poly_accept <- data.frame(xx = c(0.2,0.2,0.45,0.45),
                          yy = c(0,0.2,0.2,0))

temp_mixed <- bind_rows(df_30,
                        df_40,
                        df_60,
                        df_80) %>% 
  group_by(ttp.condition, regimen, nk) %>% 
  summarise(`P(confidence < 0.8 OR >= 1 relapse)` = mean(continues.1criteria.80 == 0 | n_relapse_interim1 >= 1, na.rm = TRUE),
            `P(confidence < 0.8 OR >= 2 relapse)` = mean(continues.1criteria.80 == 0 | n_relapse_interim1 >= 2, na.rm = TRUE),
            `P(confidence < 0.8 OR >= 3 relapse)` = mean(continues.1criteria.80 == 0 | n_relapse_interim1 >= 3, na.rm = TRUE)) %>% 
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
  mutate("Relapse rate" = case_when(regimen == 1 ~ "3%",
                                    regimen == 2 ~ "6%",
                                    regimen %in% c(3,4) ~ "3%",
                                    regimen == 5 ~ "1.5%"),
         .before = 2) %>% 
  pivot_longer(cols = 6:8,
               names_to = "threshold",
               values_to = "probability") %>% 
  mutate(`Relapse rate` = factor(`Relapse rate`, levels = c("6%", "3%", "1.5%"))) 


r1 <- temp_mixed %>% 
  filter(threshold == "P(confidence < 0.8 OR >= 1 relapse)",
         !is.na(`TTP Slope`)) %>% 
  ggplot() + 
  facet_wrap(~nk, nrow = 1) +
  geom_polygon(aes(x = xx, y = yy),
               data = poly_reject,
               fill = "red",
               alpha = 0.2) +
  geom_polygon(aes(x = xx, y = yy),
               data = poly_accept,
               fill = "green",
               alpha = 0.2) + 
  geom_point(aes(x = `TTP Slope`, col = `Relapse rate`, y = probability),
             alpha = 0.6) +
  scale_color_manual(values = c("red", "orange", "green")) +
  ggpubr::theme_pubr() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank()) +
  coord_cartesian(ylim = c(0,1)) +
  ylab("P(stopped)") +
  scale_x_continuous("TTP slope (%) relative to control",
                     breaks = c(0,0.2,0.4),
                     labels = c(0,0.2,0.4)*100) +
  ggtitle("P(confidence < 0.8 OR >= 1 relapse)")



r2 <- temp_mixed %>% 
  filter(threshold == "P(confidence < 0.8 OR >= 2 relapse)",
         !is.na(`TTP Slope`)) %>% 
  ggplot() + 
  facet_wrap(~nk, nrow = 1) +
  geom_polygon(aes(x = xx, y = yy),
               data = poly_reject,
               fill = "red",
               alpha = 0.2) +
  geom_polygon(aes(x = xx, y = yy),
               data = poly_accept,
               fill = "green",
               alpha = 0.2) + 
  geom_point(aes(x = `TTP Slope`, col = `Relapse rate`, y = probability),
             alpha = 0.6) +
  scale_color_manual(values = c("red", "orange", "green")) +
  ggpubr::theme_pubr() +
  coord_cartesian(ylim = c(0,1)) +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank()) +
  ylab("P(stopped)") +
  scale_x_continuous("TTP slope (%) relative to control",
                     breaks = c(0,0.2,0.4),
                     labels = c(0,0.2,0.4)*100) +
  ggtitle("P(confidence < 0.8 OR >= 2 relapse)")

r3 <- temp_mixed %>% 
  filter(threshold == "P(confidence < 0.8 OR >= 3 relapse)",
         !is.na(`TTP Slope`)) %>% 
  ggplot() + 
  facet_wrap(~nk, nrow = 1) +
  geom_polygon(aes(x = xx, y = yy),
               data = poly_reject,
               fill = "red",
               alpha = 0.2) +
  geom_polygon(aes(x = xx, y = yy),
               data = poly_accept,
               fill = "green",
               alpha = 0.2) + 
  geom_point(aes(x = `TTP Slope`, col = `Relapse rate`, y = probability),
             alpha = 0.6) +
  scale_color_manual(values = c("red", "orange", "green")) +
  ggpubr::theme_pubr() +
  coord_cartesian(ylim = c(0,1)) +
  ylab("P(stopped)") +
  scale_x_continuous("TTP slope (%) relative to control",
                     breaks = c(0,0.2,0.4),
                     labels = c(0,0.2,0.4)*100) +
  ggtitle("P(confidence < 0.8 OR >= 3 relapse)")

ggpubr::ggarrange(r1, r2, r3, 
                  ncol = 1, 
                  common.legend = TRUE,
                  legend = "right")
ggsave(filename = here("graphs","simulation-results",
                       paste0(Sys.Date(), "_point-plot_prob-stop-for-futility_relapse-rate-3perc.png")),
       units = "in",
       height = 8,
       width = 9,
       device = "png")
beepr::beep()
