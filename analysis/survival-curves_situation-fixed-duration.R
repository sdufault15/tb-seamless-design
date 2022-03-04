library(here)
library(tidyverse)
library(ggpubr)
source(here("lib", "weibull-survival-function.R"))
source(here("lib", "coef-function.R"))
source(here("lib", "log-hazard-function.R"))

s1 <- c(0.97, 0.95, 0.9)
situation1 <- lapply(s1[2], function(xx){
  beta1 <- coef.function(s.1 = xx, s.k = 1-(1-xx)*2, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta2 <- coef.function(s.1 = xx, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta3 <- coef.function(s.1 = xx, s.k = xx, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  beta4 <- coef.function(s.1 = xx, s.k = 1-(1-xx)/2, t.1 = 26, d = 16, max.d.k = 16, duration.effect = log(1.05))
  
  beta0 <- log(uniroot(weibull_survival_function,
                       p = 0.425,
                       surv.prop = xx,
                       t = 26,
                       interval = c(0,10))$root)
  
  output <- cbind(coef = c("beta0", "beta1", "beta2", "beta3", "beta4"),
                  bind_rows(data.frame(main.eff = beta0), beta1, beta2, beta3, beta4))
  return(output)}
)

true.coefs <- list(
  s97.situation1 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation1[[1]]$main.eff[1],
    regimen2 = situation1[[1]]$main.eff[2],
    regimen3 = situation1[[1]]$main.eff[3],
    regimen4 = situation1[[1]]$main.eff[4],
    regimen5 = situation1[[1]]$main.eff[5],
    duration.fun = log(1.05)),
    s95.situation1 = c(
      shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
      Intercept = situation1[[1]]$main.eff[1],
      regimen2 = situation1[[1]]$main.eff[2],
      regimen3 = situation1[[1]]$main.eff[3],
      regimen4 = situation1[[1]]$main.eff[4],
      regimen5 = situation1[[1]]$main.eff[5],
      duration.fun = log(1.05)),
  s90.situation1 = c(
    shape = 0.425, # fixed p such that F(13) = 0.75*F(26)
    Intercept = situation1[[1]]$main.eff[1],
    regimen2 = situation1[[1]]$main.eff[2],
    regimen3 = situation1[[1]]$main.eff[3],
    regimen4 = situation1[[1]]$main.eff[4],
    regimen5 = situation1[[1]]$main.eff[5],
    duration.fun = log(1.05)))

duration.fun <- c(0)
regimen <- c(2,3,4,5)

xx_df <- expand.grid(duration.fun, regimen) %>% 
  rename(duration.fun = 1, 
         regimen = 2) %>% 
  mutate(regimen2 = ifelse(regimen == 2, 1, 0),
         regimen3 = ifelse(regimen == 3, 1, 0),
         regimen4 = ifelse(regimen == 4, 1, 0),
         regimen5 = ifelse(regimen == 5, 1, 0),
         Intercept = 1,
         shape = 0) %>% 
  dplyr::select(shape, Intercept, regimen2:regimen5, duration.fun)

t1 <- apply(xx_df, 1, function(x){x*true.coefs$s95.situation1})
xx_df$lambdas <- exp(colSums(t1))


# To solve for survival:

t.list <- as.list(1:36)
names(t.list) <- 1:36

surv.ref <- map_dfr(t.list[1:26], 
                    ~uniroot(weibull_survival_function,
                             lambda = uniroot(weibull_survival_function,
                                              t = 26,
                                              p = 0.425,
                                              surv.prop = 0.95,
                                              interval = c(0,10))$root,
                             p = 0.425,
                             t = .x,
                             interval = c(0,1))$root) %>% 
  t() %>% 
  data.frame() %>% 
  rename("Control" = 1) %>% 
  mutate(t = 27:52)

###################
# Regimen 2
###################
surv.k2.d16 <- map_dfr(t.list, 
                       ~uniroot(weibull_survival_function,
                                lambda = xx_df$lambdas[xx_df$regimen2 == 1],
                                p = 0.425,
                                t = .x,
                                interval = c(0,1))$root) %>% 
  t() %>% 
  data.frame() %>% 
  rename("Regimen 2" = 1) %>% 
  mutate(t = 17:52)

###################
# Regimen 3
###################
surv.k3.d16 <- map_dfr(t.list, 
                       ~uniroot(weibull_survival_function,
                                lambda = xx_df$lambdas[xx_df$regimen3 == 1],
                                p = 0.425,
                                t = .x,
                                interval = c(0,1))$root) %>% 
  t() %>% 
  data.frame() %>% 
  rename("Regimen 3" = 1) %>% 
  mutate(t = 17:52)

###################
# Regimen 4
###################
surv.k4.d16 <- map_dfr(t.list, 
                       ~uniroot(weibull_survival_function,
                                lambda = xx_df$lambdas[xx_df$regimen4 == 1],
                                p = 0.425,
                                t = .x,
                                interval = c(0,1))$root) %>% 
  t() %>% 
  data.frame() %>% 
  rename("Regimen 4" = 1) %>% 
  mutate(t = 17:52)

###################
# Regimen 5
###################
surv.k5.d16 <- map_dfr(t.list, 
                       ~uniroot(weibull_survival_function,
                                lambda = xx_df$lambdas[xx_df$regimen5 == 1],
                                p = 0.425,
                                t = .x,
                                interval = c(0,1))$root) %>% 
  t() %>% 
  data.frame() %>% 
  rename("Regimen 5" = 1) %>% 
  mutate(t = 17:52)


###################
# All together
###################

cols <- c("Control" = "turquoise4",
          "Regimen 2" = "black",
          "Regimen 3" = "black",
          "Regimen 4" = "black",
          "Regimen 5" = "black")

full_join(full_join(full_join(surv.k2.d16, surv.k3.d16), surv.k4.d16), surv.k5.d16) %>% 
  bind_rows(tibble(t = 0:16, 
                       "Regimen 2" = 1,
                       "Regimen 3" = 1,
                       "Regimen 4" = 1,
                       "Regimen 5" = 1)) %>% 
  arrange(t) %>% 
  left_join(surv.ref) %>% 
  mutate(Control = ifelse(is.na(Control), 1, Control)) %>% 
  pivot_longer(cols = c(1,3:6),
               values_to = "survival",
               names_to = "regimen") %>%
  ggplot(aes(x = t, y = survival, lty = regimen, col = regimen)) + 
  geom_line(lwd = 1) + 
  theme_bw() + 
  ylab("S(t)") +
  scale_x_continuous("Time since randomization (months)",
                     breaks = c(0,13,26,39,52),
                     labels = c(0,3,6,9,12)) +
  coord_cartesian(xlim = c(0,52), ylim = c(0.9,1)) +
  scale_color_manual(values = cols,
                     guide = "none") +
  ggtitle("",
          subtitle = "Mixed conditions. \nControl survival by end of follow-up set at 95%") + 
  theme_bw() +
  theme(legend.title = element_blank(),
        axis.text = element_text(size = 14),
        axis.title = element_text(size = 16),
        legend.text = element_text(size = 12),
        plot.title = element_text(size = 18),
        plot.subtitle = element_text(size = 13)) 

ggsave(filename = here("graphs", "simulation-settings", 
                       paste0(Sys.Date(),"_survival-curve-mixed.jpg")),
       device = "jpg",
       width = 6,
       height = 8,
       units = "in")
