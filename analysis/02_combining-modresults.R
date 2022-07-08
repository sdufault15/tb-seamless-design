#####################
# Combining separate datasets
# Suzanne Dufault
#####################
library(here)
library(tidyverse)
library(assertthat) # for defensive programming


############  EVEN ############################################################
# Nk = 20
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-100.RData"))
summary_100 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-200.RData"))
summary_200 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-300.RData"))
summary_300 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-400.RData"))
summary_400 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-500.RData"))
summary_500 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-600.RData"))
summary_600 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-700.RData"))
summary_700 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-800.RData"))
summary_800 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-900.RData"))
summary_900 <- summary_mods_even_20; rm(summary_mods_even_20)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-20_even-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_even_20; rm(summary_mods_even_20)

summary_mods_even_20 <- c(summary_100, 
                          summary_200, 
                          summary_300,
                          summary_400,
                          summary_500, 
                          summary_600,
                          summary_700,
                          summary_800,
                          summary_900,
                          summary_1000) 

assert_that(length(summary_mods_even_20) == 1000)

save(summary_mods_even_20,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-20_even.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 30
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-100.RData"))
summary_100 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-200.RData"))
summary_200 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-300.RData"))
summary_300 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-400.RData"))
summary_400 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-500.RData"))
summary_500 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-600.RData"))
summary_600 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-700.RData"))
summary_700 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-800.RData"))
summary_800 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-900.RData"))
summary_900 <- summary_mods_even_30; rm(summary_mods_even_30)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-30_even-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_even_30; rm(summary_mods_even_30)

summary_mods_even_30 <- c(summary_100, 
                       summary_200, 
                       summary_300,
                       summary_400,
                       summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000) 

assert_that(length(summary_mods_even_30) == 1000)

save(summary_mods_even_30,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-30_even.RData")))


rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 


# Nk = 40
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-100.RData"))
summary_100 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-200.RData"))
summary_200 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-300.RData"))
summary_300 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-400.RData"))
summary_400 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-500.RData"))
summary_500 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-600.RData"))
summary_600 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-700.RData"))
summary_700 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-800.RData"))
summary_800 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-900.RData"))
summary_900 <- summary_mods_even_40; rm(summary_mods_even_40)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-40_even-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_even_40; rm(summary_mods_even_40)

summary_mods_even_40 <- c(summary_100, 
                       summary_200, 
                       summary_300,
                       summary_400,
                       summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000) 

assert_that(length(summary_mods_even_40) == 1000)

save(summary_mods_even_40,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-40_even.RData")))


rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 60
load(here("data", "bayes-generated", "2022-06-07_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-100.RData"))
summary_100 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-200.RData"))
summary_200 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-300.RData"))
summary_300 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-400.RData"))
summary_400 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-500.RData"))
summary_500 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-600.RData"))
summary_600 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-700.RData"))
summary_700 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-800.RData"))
summary_800 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-900.RData"))
summary_900 <- summary_mods_even_60; rm(summary_mods_even_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_even-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_even_60; rm(summary_mods_even_60)

summary_mods_even_60 <- c(summary_100, 
                       summary_200, 
                       summary_300,
                       summary_400,
                       summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000) 

assert_that(length(summary_mods_even_60) == 1000)

save(summary_mods_even_60,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-60_even.RData")))
rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 80
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-80_even-condition_modresults-500.RData"))
summary_500 <- summary_mods_even_80; rm(summary_mods_even_80)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-80_even-condition_modresults-600.RData"))
summary_600 <- summary_mods_even_80; rm(summary_mods_even_80)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-80_even-condition_modresults-700.RData"))
summary_700 <- summary_mods_even_80; rm(summary_mods_even_80)
load(here("data", "bayes-generated", "2022-06-18_simulated-lmm_random-slope_lod-25_nk-80_even-condition_modresults-800.RData"))
summary_800 <- summary_mods_even_80; rm(summary_mods_even_80)
load(here("data", "bayes-generated", "2022-06-18_simulated-lmm_random-slope_lod-25_nk-80_even-condition_modresults-900.RData"))
summary_900 <- summary_mods_even_80; rm(summary_mods_even_80)
load(here("data", "bayes-generated", "2022-06-18_simulated-lmm_random-slope_lod-25_nk-80_even-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_even_80; rm(summary_mods_even_80)

summary_mods_even_80 <- c(summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000)

assert_that(length(summary_mods_even_80) == 1000)

save(summary_mods_even_80,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-80_even.RData")))

rm(summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 
rm(summary_mods_even_20,summary_mods_even_30,summary_mods_even_40,summary_mods_even_60,summary_mods_even_80)

############  HIGH ############################################################
# Nk = 20
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-100.RData"))
summary_100 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-200.RData"))
summary_200 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-300.RData"))
summary_300 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-400.RData"))
summary_400 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-500.RData"))
summary_500 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-600.RData"))
summary_600 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-700.RData"))
summary_700 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-800.RData"))
summary_800 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-900.RData"))
summary_900 <- summary_mods_high_20; rm(summary_mods_high_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_high-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_high_20; rm(summary_mods_high_20)

summary_mods_high_20 <- c(summary_100, 
                       summary_200, 
                       summary_300,
                       summary_400,
                       summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000)

assert_that(length(summary_mods_high_20) == 1000)

save(summary_mods_high_20,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-20_high.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 30
load(here("data", "bayes-generated", "2022-06-20_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-100.RData"))
summary_100 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-200.RData"))
summary_200 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-300.RData"))
summary_300 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-400.RData"))
summary_400 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-500.RData"))
summary_500 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-600.RData"))
summary_600 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-700.RData"))
summary_700 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-800.RData"))
summary_800 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-900.RData"))
summary_900 <- summary_mods_high_30; rm(summary_mods_high_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_high-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_high_30; rm(summary_mods_high_30)

summary_mods_high_30 <- c(summary_100, 
                       summary_200, 
                       summary_300,
                       summary_400,
                       summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000)

assert_that(length(summary_mods_high_30) == 1000)

save(summary_mods_high_30,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-30_high.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 40
load(here("data", "bayes-generated", "2022-06-20_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-100.RData"))
summary_100 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-200.RData"))
summary_200 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-300.RData"))
summary_300 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-400.RData"))
summary_400 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-500.RData"))
summary_500 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-18_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-600.RData"))
summary_600 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-18_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-700.RData"))
summary_700 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-800.RData"))
summary_800 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-900.RData"))
summary_900 <- summary_mods_high_40; rm(summary_mods_high_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_high-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_high_40; rm(summary_mods_high_40)

summary_mods_high_40 <- c(summary_100, 
                       summary_200,
                       summary_300,
                       summary_400,
                       summary_500,
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000)

assert_that(length(summary_mods_high_40) == 1000)

save(summary_mods_high_40,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-40_high.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 60
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-100.RData"))
summary_100 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-200.RData"))
summary_200 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-300.RData"))
summary_300 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-400.RData"))
summary_400 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-500.RData"))
summary_500 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-600.RData"))
summary_600 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-700.RData"))
summary_700 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-800.RData"))
summary_800 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-900.RData"))
summary_900 <- summary_mods_high_60; rm(summary_mods_high_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_high-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_high_60; rm(summary_mods_high_60)

summary_mods_high_60 <- c(summary_100, 
                       summary_200, 
                       summary_300,
                       summary_400,
                       summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000) 

assert_that(length(summary_mods_high_60) == 1000)

save(summary_mods_high_60,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-60_high.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 80
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-100.RData"))
summary_100 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-200.RData"))
summary_200 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-300.RData"))
summary_300 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-400.RData"))
summary_400 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-08_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-500.RData"))
summary_500 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-600.RData"))
summary_600 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-700.RData"))
summary_700 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-800.RData"))
summary_800 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-900.RData"))
summary_900 <- summary_mods_high_80; rm(summary_mods_high_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_high-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_high_80; rm(summary_mods_high_80)

summary_mods_high_80 <- c(summary_100, 
                       summary_200, 
                       summary_300,
                       summary_400,
                       summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000) 

assert_that(length(summary_mods_high_80) == 1000)

save(summary_mods_high_80,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-80_high.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

############  HIGH-LOW ############################################################
# Nk = 20
load(here("data", "bayes-generated", "2022-06-20_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-100.RData"))
summary_100 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-200.RData"))
summary_200 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-300.RData"))
summary_300 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-400.RData"))
summary_400 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-500.RData"))
summary_500 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-600.RData"))
summary_600 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-700.RData"))
summary_700 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-800.RData"))
summary_800 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-900.RData"))
summary_900 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-20_highlow-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_highlow_20; rm(summary_mods_highlow_20)

summary_mods_highlow_20 <- c(summary_100, 
                          summary_200,
                          summary_300,
                          summary_400,
                          summary_500, 
                          summary_600,
                          summary_700,
                          summary_800,
                          summary_900,
                          summary_1000)

assert_that(length(summary_mods_highlow_20) == 1000)

save(summary_mods_highlow_20,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-20_highlow.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 30
load(here("data", "bayes-generated", "2022-06-20_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-100.RData"))
summary_100 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-200.RData"))
summary_200 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-300.RData"))
summary_300 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-400.RData"))
summary_400 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-500.RData"))
summary_500 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-600.RData"))
summary_600 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-700.RData"))
summary_700 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-800.RData"))
summary_800 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-900.RData"))
summary_900 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-30_highlow-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_highlow_30; rm(summary_mods_highlow_30)

summary_mods_highlow_30 <- c(summary_100, 
                          summary_200,
                          summary_300,
                          summary_400,
                          summary_500, 
                          summary_600,
                          summary_700,
                          summary_800,
                          summary_900,
                          summary_1000)

assert_that(length(summary_mods_highlow_30) == 1000)

save(summary_mods_highlow_30,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-30_highlow.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 40
load(here("data", "bayes-generated", "2022-06-20_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-100.RData"))
summary_100 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-21_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-200.RData"))
summary_200 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-300.RData"))
summary_300 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-400.RData"))
summary_400 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-500.RData"))
summary_500 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-600.RData"))
summary_600 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-700.RData"))
summary_700 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-800.RData"))
summary_800 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-21_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-900.RData"))
summary_900 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)
load(here("data", "bayes-generated", "2022-06-18_simulated-lmm_random-slope_lod-25_nk-40_highlow-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_highlow_40; rm(summary_mods_highlow_40)

summary_mods_highlow_40 <- c(summary_100, 
                          summary_200,
                          summary_300,
                          summary_400,
                          summary_500, 
                          summary_600,
                          summary_700,
                          summary_800,
                          summary_900,
                          summary_1000)

assert_that(length(summary_mods_highlow_40) == 1000)

save(summary_mods_highlow_40,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-40_highlow.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 60
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-100.RData"))
summary_100 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-200.RData"))
summary_200 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-300.RData"))
summary_300 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-13_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-400.RData"))
summary_400 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-500.RData"))
summary_500 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-17_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-600.RData"))
summary_600 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-15_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-700.RData"))
summary_700 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-800.RData"))
summary_800 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-900.RData"))
summary_900 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-60_highlow-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_highlow_60; rm(summary_mods_highlow_60)

summary_mods_highlow_60 <- c(summary_100, 
                       summary_200, 
                       summary_300,
                       summary_400,
                       summary_500, 
                       summary_600,
                       summary_700,
                       summary_800,
                       summary_900,
                       summary_1000) 

assert_that(length(summary_mods_highlow_60) == 1000)

save(summary_mods_highlow_60,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-60_highlow.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 

# Nk = 80
load(here("data", "bayes-generated", "2022-06-20_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-100.RData"))
summary_100 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-200.RData"))
summary_200 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-300.RData"))
summary_300 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-400.RData"))
summary_400 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-09_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-500.RData"))
summary_500 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-18_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-600.RData"))
summary_600 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-16_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-700.RData"))
summary_700 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-800.RData"))
summary_800 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-900.RData"))
summary_900 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)
load(here("data", "bayes-generated", "2022-06-14_simulated-lmm_random-slope_lod-25_nk-80_highlow-condition_modresults-1000.RData"))
summary_1000 <- summary_mods_highlow_80; rm(summary_mods_highlow_80)

summary_mods_highlow_80 <- c(summary_100, 
                          summary_200, 
                          summary_300,
                          summary_400,
                          summary_500, 
                          summary_600,
                          summary_700,
                          summary_800,
                          summary_900,
                          summary_1000) 

assert_that(length(summary_mods_highlow_80) == 1000)

save(summary_mods_highlow_80,
     file = here("data", "cleaned", paste0(Sys.Date(), "_summary_random-intercept-random-slope_nk-80_highlow.RData")))

rm(summary_100, summary_200, summary_300,summary_400,summary_500, summary_600,summary_700,summary_800,summary_900,summary_1000) 
