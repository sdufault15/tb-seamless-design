###################
# Job for cluster
# Finishing 500 simulations per condition
# 2022-01-19
###################

library(here)
library(brms)
sims <- c(601:700)
model <- as.formula("yij_censored | cens(censored) ~ 1 + week + week:arm + (1 + week | patient.id)")
priors <- set_prior("normal(0,4)", class = "b")

source(here("munge","32_analyze-ttp-slope","36_CLUSTER-brms-models-on-sim-data_even-condition.R"))
source(here("munge","32_analyze-ttp-slope","37_CLUSTER-brms-models-on-sim-data_clustered-high-condition.R"))
source(here("munge","32_analyze-ttp-slope","38_CLUSTER-brms-models-on-sim-data_clustered-highlow-condition.R"))
