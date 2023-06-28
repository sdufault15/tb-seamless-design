#################################
# Simulate fixed effect data
# Initiated: June 27, 2023
# Updated: June 27, 2023
#################################

source(here("lib", "fixed-effects-function.R"))


# Call in simulated TTP data
files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_no-winners-ttp.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_no_winners
rm(file_interest,files)

files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_one-winner-ttp.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_one_winner
rm(file_interest,files)

files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_two-winners-ttp.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_two_winners
rm(file_interest,files)


files <- file.info(list.files("data/simulated-datasets", full.names = T))
file_interest <- files[stringr::str_detect(rownames(files), "_simulated-df_four-winners-ttp.RData"),]
load(rownames(file_interest)[which.max(file_interest$mtime)]) # Object name: df_sims_four_winners
rm(file_interest,files)

# Fixed effects data
fixed_wrapper <- function(nkdata, d, k = 5){
  
  output_full <- NULL
  
  for (nk in 1:length(nkdata)){
    
    nkd <- n_distinct(nkdata[[nk]]$patient.id)/5 # extract the number of patients per arm in this dataset
    enroll.time.weeks <- (nkd*k*length(d))/10 # enrolling 10 participants per day, aiming for total sample size of nkd*k*d 
    
    temp <- fixed_effects_function(simdata = nkdata[[nk]],
                                   d = d,
                                   nkd = nkd,
                                   enroll.time.weeks = enroll.time.weeks)
    
    output_full <- bind_rows(output_full,
                             mutate(temp, nk = nkd))
  }
  return(output_full)
}

# A list of length nsims, where each dataset is [sum(nk*regimen) over all nk] x [9 variables]
df_sims_no_winners_fe <- map(df_sims_no_winners,
                             ~fixed_wrapper(.x, 
                                            d = 16, 
                                            k = 5))
save(df_sims_no_winners_fe,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_no-winners-ttp-fe.RData")))

df_sims_one_winner_fe <- map(df_sims_one_winner,
                             ~fixed_wrapper(.x, 
                                            d = 16, 
                                            k = 5))
save(df_sims_one_winner_fe,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_one-winner-ttp-fe.RData")))

df_sims_two_winners_fe <- map(df_sims_two_winners,
                              ~fixed_wrapper(.x, 
                                             d = 16, 
                                             k = 5))
save(df_sims_two_winners_fe,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_two-winners-ttp-fe.RData")))

df_sims_four_winners_fe <- map(df_sims_four_winners,
                               ~fixed_wrapper(.x, 
                                              d = 16, 
                                              k = 5))
save(df_sims_four_winners_fe,
     file = here("data",
                 paste0("simulated-datasets/", Sys.Date(), "_simulated-df_four-winners-ttp-fe.RData")))
