###################
# Job for cluster
# Finishing 500 simulations per condition
# 2022-01-19
###################

library(here)

sims <- c(501:1000)
source(here("munge","03_CLUSTER-brms-models-on-sim-data_even-condition.R"))
source(here("munge","04_CLUSTER-brms-models-on-sim-data_clustered-high-condition.R"))
source(here("munge","05_CLUSTER-brms-models-on-sim-data_clustered-highlow-condition.R"))
source(here("munge","02_CLUSTER-brms-models-on-sim-data_null-condition.R"))
