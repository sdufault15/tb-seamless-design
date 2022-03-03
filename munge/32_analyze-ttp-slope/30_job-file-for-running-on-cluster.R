###################
# Job for cluster
# Finishing 500 simulations per condition
# 2022-01-19
###################

library(here)

sims <- c(1:200)
source(here("munge","33_CLUSTER-brms-models-on-sim-data_even-condition.R"))
source(here("munge","34_CLUSTER-brms-models-on-sim-data_clustered-high-condition.R"))
source(here("munge","35_CLUSTER-brms-models-on-sim-data_clustered-highlow-condition.R"))
