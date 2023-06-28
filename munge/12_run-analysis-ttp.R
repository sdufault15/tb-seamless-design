###################
# Job for cluster
# Bayes model breaks cluster after more than 100 runs, so separate scripts per hundred runs
# 2023-06-28
###################

library(here)
library(brms)
sims <- c(201:300)
model <- as.formula("yij_censored | cens(censored) ~ 1 + week + week:arm + (1 + week | patient.id)")
priors <- set_prior("normal(0,4)", class = "b")

source(here("munge", "20_perform-ttp-analysis.R"))