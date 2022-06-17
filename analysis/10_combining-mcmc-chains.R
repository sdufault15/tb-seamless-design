#####################
# Combining separate datasets
# Suzanne Dufault
#####################
library(here)
library(tidyverse)
library(assertthat) # for defensive programming


############  EVEN ############################################################
# Nk = 20
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_even_20; rm(mcmc_mods_even_20)

mcmc_mods_even_20 <- c(mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000) 

assert_that(length(mcmc_mods_even_20) == 1000)

save(mcmc_mods_even_20,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-20_even.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 30
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_even_30; rm(mcmc_mods_even_30)

mcmc_mods_even_30 <- c(#mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000) 

assert_that(length(mcmc_mods_even_30) == 1000)

save(mcmc_mods_even_30,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-30_even.RData")))


rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 


# Nk = 40
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_even-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_even_40; rm(mcmc_mods_even_40)

mcmc_mods_even_40 <- c(mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000) 

assert_that(length(mcmc_mods_even_40) == 1000)

save(mcmc_mods_even_40,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-40_even.RData")))


rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 60
load(here("data", "bayes-generated", "2022-06-07_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_even_60; rm(mcmc_mods_even_60)

mcmc_mods_even_60 <- c(mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000) 

assert_that(length(mcmc_mods_even_60) == 1000)

save(mcmc_mods_even_60,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-60_even.RData")))
rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 80
# load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-100.RData"))
# mcmc_100 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
# load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-200.RData"))
# mcmc_200 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
# load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-300.RData"))
# mcmc_300 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
# load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-400.RData"))
# mcmc_400 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_even-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_even_80; rm(mcmc_mods_even_80)

mcmc_mods_even_80 <- c(#mcmc_100, 
#                        mcmc_200, 
#                        mcmc_300,
#                        mcmc_400,
                       mcmc_500, 
                       mcmc_600) #,
                       # mcmc_700,
                       # mcmc_800,
                       # mcmc_900,
                       # mcmc_1000) 

assert_that(length(mcmc_mods_even_80) == 1000)

save(mcmc_mods_even_80,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-80_even.RData")))
rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

############  HIGH ############################################################
# Nk = 20
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-201.RData"))
mcmc_200 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_high_20; rm(mcmc_mods_high_20)

mcmc_mods_high_20 <- c(mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000)

assert_that(length(mcmc_mods_high_20) == 1000)

save(mcmc_mods_high_20,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-20_high.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 30
# load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-100.RData"))
# mcmc_100 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-201.RData"))
mcmc_200 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_high_30; rm(mcmc_mods_high_30)

mcmc_mods_high_30 <- c(#mcmc_100, 
  mcmc_200, 
  # mcmc_300,
  mcmc_400,
  mcmc_500, 
  mcmc_600,
  mcmc_700,
 # mcmc_800,
  mcmc_900)#,
# mcmc_1000) 

assert_that(length(mcmc_mods_high_30) == 1000)

save(mcmc_mods_high_30,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-30_high.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 40
# load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-100.RData"))
# mcmc_100 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
# load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-201.RData"))
# mcmc_200 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
# load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-400.RData"))
# mcmc_400 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
# load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-500.RData"))
# mcmc_500 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
# load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-600.RData"))
# mcmc_600 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
# load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-700.RData"))
# mcmc_700 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
# load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-900.RData"))
# mcmc_900 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_high_40; rm(mcmc_mods_high_40)

mcmc_mods_high_40 <- c(#mcmc_100, 
                       # mcmc_200, 
                       mcmc_300,
                       # mcmc_400,
                       # mcmc_500, 
                       # mcmc_600,
                       # mcmc_700,
                       mcmc_800,
                       # mcmc_900,
                       mcmc_1000)

assert_that(length(mcmc_mods_high_40) == 1000)

save(mcmc_mods_high_40,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-40_high.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 60
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_high-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_high_60; rm(mcmc_mods_high_60)

mcmc_mods_high_60 <- c(mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000) 

assert_that(length(mcmc_mods_high_60) == 1000)

save(mcmc_mods_high_60,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-60_high.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 80
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_high-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_high_80; rm(mcmc_mods_high_80)

mcmc_mods_high_80 <- c(mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000) 

assert_that(length(mcmc_mods_high_80) == 1000)

save(mcmc_mods_high_80,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-80_high.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 


############  HIGH-LOW ############################################################
# Nk = 20
# load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-100.RData"))
# mcmc_100 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
# load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-201.RData"))
# mcmc_200 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_highlow_20; rm(mcmc_mods_highlow_20)

mcmc_mods_highlow_20 <- c(#mcmc_100, 
  # mcmc_200, 
  mcmc_300,
  mcmc_400,
  mcmc_500, 
  mcmc_600,
  mcmc_700,
  mcmc_800,
  mcmc_900,
  mcmc_1000)

assert_that(length(mcmc_mods_highlow_20) == 1000)

save(mcmc_mods_highlow_20,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-20_highlow.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 30
# load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-100.RData"))
# mcmc_100 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
# load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-201.RData"))
# mcmc_200 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
# load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-900.RData"))
# mcmc_900 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_highlow_30; rm(mcmc_mods_highlow_30)

mcmc_mods_highlow_30 <- c(#mcmc_100, 
  # mcmc_200, 
  mcmc_300,
  mcmc_400,
  mcmc_500, 
  mcmc_600,
  mcmc_700,
  mcmc_800,
  # mcmc_900,
  mcmc_1000)

assert_that(length(mcmc_mods_highlow_30) == 1000)

save(mcmc_mods_highlow_30,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-30_highlow.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 40
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-201.RData"))
mcmc_200 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_highlow_40; rm(mcmc_mods_highlow_40)

mcmc_mods_highlow_40 <- c(mcmc_100, 
                       mcmc_200, 
                       # mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       mcmc_600,
                       mcmc_700,
                       # mcmc_800,
                       mcmc_900)#,
# mcmc_1000) 

assert_that(length(mcmc_mods_highlow_40) == 1000)

save(mcmc_mods_highlow_40,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-40_highlow.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 60
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_highlow_60; rm(mcmc_mods_highlow_60)

mcmc_mods_highlow_60 <- c(mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                      # mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000) 

assert_that(length(mcmc_mods_highlow_60) == 1000)

save(mcmc_mods_highlow_60,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-60_highlow.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 

# Nk = 80
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-100.RData"))
mcmc_100 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-200.RData"))
mcmc_200 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-300.RData"))
mcmc_300 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-400.RData"))
mcmc_400 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-500.RData"))
mcmc_500 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-600.RData"))
mcmc_600 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-700.RData"))
mcmc_700 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-800.RData"))
mcmc_800 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-900.RData"))
mcmc_900 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_mcmc-1000.RData"))
mcmc_1000 <- mcmc_mods_highlow_80; rm(mcmc_mods_highlow_80)

mcmc_mods_highlow_80 <- c(#mcmc_100, 
                       mcmc_200, 
                       mcmc_300,
                       mcmc_400,
                       mcmc_500, 
                       # mcmc_600,
                       mcmc_700,
                       mcmc_800,
                       mcmc_900,
                       mcmc_1000) 

assert_that(length(mcmc_mods_highlow_80) == 1000)

save(mcmc_mods_highlow_80,
     file = here("data", "cleaned", paste0(Sys.Date(), "_mcmc_random-intercept-random-slope_nk-80_highlow.RData")))

rm(mcmc_100, mcmc_200, mcmc_300,mcmc_400,mcmc_500, mcmc_600,mcmc_700,mcmc_800,mcmc_900,mcmc_1000) 
