# Phase IIB/C Seamless Design Simulation Study

## Files included in repository

### munge

This folder contains all of the code necessary to simulate the TTP and survival data and perform the Bayesian estimation on the simulated TTP data. 

Note: I had to run the following in order to use the `cmdstanr` backend:

```
# we recommend running this is a fresh R session or restarting your current session
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
```

+ `00_run-file.R` - This file sets up the global conditions for the simulation study (e.g., number of simulations, number of arms, number of participants, etc.) and calls in the subsequent three scripts:
  + `01_simulate-ttp-data.R` - Simulates the time-to-positivity data based on estimated parameters from a Bayesian hierarchical linear model applied to the REMoxTB TTP data. 
  + `02_add-fixed-effects.R` - Adds the fixed effects including the simulated enrollment day such that 10 participants are enrolled per week
  + `03_simulate-survival-outcomes.R` - Simulates the survival outcomes for each simulated TTP dataset. We have assumed there is no direct link between TTP and survival, hence the simulated survival data only relies on regimen. Because there are 12 survival settings we are interested in, we append each of those simulated endpoints to each simulated TTP dataset. 

+ `1*_run-analysis-ttp.R` - The Bayesian analysis is computationally expensive and therefore management of the analysis is split across 10 files such that 100 simulated datasets for each TTP setting and sample size are analyzed at one time. Therefore, file `10_run-analysis-ttp.R` corresponds to the first 100 simulated datasets and file `19_run-analysis-ttp.R` corresponds to the 900th-1000th simulated datasets.

+ `20_perform-ttp-analysis.R` - The previous files "manage" the distribution of simulated datasets such that the computational cost can be distributed. This file contains the actual script for applying the `brms` model to the simulated dataset. 

<!-- + `0*_nk-30_*.R` these files take the sample size of 30 and add simulated survival data to the already existing log10(TTP) simulated data at this sample size. *These scripts correspond to a duration-randomized design such that 6 participants per regimen are assigned to 8, 10, 12, 14, or 16 weeks of treatment. Survival outcomes are specified with respect to particular durations.* 
+ `2*_nk-30_*_fixed-duration.R` these files take the sample size of 30 and add simulated survival data to the already existing log10(TTP) simulated data at this sample size. *These scripts correspond to a fixed 4 month duration of each novel treatment.*
+ `3*` these files simulate TTP and survival outcomes for sample sizes of 60 and 80 per regimen. These scripts correspond to a fixed 4 month duration of each novel treatment.
+ `4*` these files take the sample size of 40 and add simulated survival data to the already existing log10(TTP) simulated data at this sample size. These scripts correspond to a fixed 4 month duration of each novel treatment.
+ `80_generate-pointplots_prob-stopping.R` [TEMPORARY] file for generating point plot with probability of stopping versus true TTP and true relapse rate
+ `81_generate-roc-plots_stopping.R` [TEMPORARY] file for generating pseudo-ROC plots with operating characteristics when a threshold has been set on the observed and true "futility" criteria.
+ `99_saving-smaller-bayes-objects.R` file for taking some of the earlier model results (quite big) and extracting the smaller components needed for analysis.-->

### analysis

+ `00_run-performance-analyses.R` This script sets up the analysis of the survival and TTP data for the 30, 40, 60, and 80 participant per arm datasets. In particular, this script is important to set up the target product profile thresholds, which will be used in the following scripts. 
    + `01_combining-mcmc-chains` Because the Bayesian analysis of the simulated data was split into 10 segments, this script simply takes those separate MCMC results and combines them into a more convenient object.
      + input: `data/bayes-generated/[DATE]_simulated-lmm_random-slope_lod-25_nk-*_mcmc-*.RData`, or for the null TTP setting, `data/bayes-generated/[DATE]_bayes-mcmc-results_no-winners_*.RData`
      + output: `data/cleaned/[DATE]_mcmc_random-intercept-random-slope_nk-*.RData`
    + `02_combining-modresults` Because the Bayesian analysis of the simulated data was split into 10 segments, this script simply takes those separate model results and combines them into a more convenient object.
      + input: `data/bayes-generated/[DATE]_simulated-lmm_random-slope_lod-25_nk-*_modresults-*.RData`
      + output: `data/cleaned/[DATE]_summary_random-intercept-random-slope_nk-*.RData`
    + `03_tpp-decisions.R` This applies the target product profile framework to the posterior results (captured in the MCMC objects) and returns decisions for each of the arms in each simulated dataset.
      + input: `data/cleaned/[DATE]_mcmc_random-intercept-random-slope_nk-*.RData`
      + output:`data/analyzed/target-product-profile/[DATE]_tpp-decisions.RData`
    + `04_ranking-probabilities.R` This estimates the posterior probability of ranking based on the TTP MCMC results. 
      + input: `data/cleaned/[DATE]_mcmc_random-intercept-random-slope_nk-*.RData`
      + output: `data/analyzed/ranking/[DATE]_ranking-probabilities.RData`
    + `05_compare-v-control.R` This estimates the posterior probability that each novel arm is better than the control.
      + input: `data/cleaned/[DATE]_mcmc_random-intercept-random-slope_nk-*.RData`
      + output: `data/analyzed/ranking/[DATE]_compare-v-control.RData`
    + `06_relapse-counts.R` This script counts the number of relapses that have occurred by the first interim analysis.
      + input: 
      + output: `analyzed/[DATE]_relapse-counts-by-simulation_[XX].RData`
    
<!-- + `01_relapse-counts.R` This script counts the number of relapses that happen per regimen by the interim analysis (defined within) for each simulation. All results are stored in the `data/analyzed` folder with `[DATE]_relapse-counts-by-simulation_[nk]` included in the filename. 
+ `02_advance-ttp.R` This script examines the TTP MCMC chains and estimates 1) the probability that each novel regimen is better than the control (% confidence), and 2) the probability that each novel regimen is one of the top 2 regimens. It returns a list of dataframes containing the probability that each novel regimen would advance on the basis of meeting a particular threshold set on estimates 1 and 2. All results are stored in the `data/analyzed` folder with `[DATE]_sim-level-ttp-results_[nk]` in the filename.
+ `03_advance-relapse.R` This script is very similar to `01_relapse-counts.R`. **Will need to review.** All results are stored in the `data/analyzed` folder with `[DATE]_s9*-situation*-results_` in the filename.
+ `survival-curves_situation-fixed-duration*` files to generate the figures for each survival setting (e.g. mixed, all minimal, all desirable). -->

### docs

+ `simulation-results_full.Rmd` contains the simulation results for the random intercept, random slope simulated datasets. Also includes code for generating figures for the manuscript.
<!--
     OUT OF DATE
+ `sample-study-design.html` describes the set-up for the simulated datasets
+ `simulation-overview.html` [NEEDS UPDATING] should contain an ADEMP map of the project
+ `walkthrough_target-product-profile.html` describes the use of the target product profile framework in this setting-->

### lib

| filename | description | input | output | 
|:--------:|:------------|:------|:-------|
|coef-function.R | This estimates the coefficient values for the parametric survival model based on the inputs | <ul><li>`s.1` reference survival function</li><li>`s.k` regimen-specific survival function</li><li>`t.1` weeks post-treatment for reference survival function</li><li>`d` duration of regimen</li><li>`max.d.k` maximum duration of regimen</li><li>`p` shape parameter</li><li>`duration.effect` duration effect</li></ul> | <ul><li>reference lambda</li><li>regimen k lambda</li><li>log HR</li><li>g(d)</li><li>beta_k</li></ul> |
| df_extract-mcmc-slopes-function.R | This function extracts the MCMC parameter estimates from the brms model output and converts them all into stand-alone slopes. | `modresults` a brms model object | a (`n_chains` x `n_iterations`) x 5 regimens dataframe with credible slope estimates |
| df-sim-function.R | This function simulates a dataset based on a random intercept model. | <li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_temp` a simulated data frame |
| df-sim-wrapper-function.R | This function wraps around the previous and generates as many simulated datasets as requested. | <li> `n_sims` number of simulated datasets required </li><li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_list` a list of simulated dataframes |
| df-sim-function_random-slope.R | This function simulates a dataset based on a random intercept, random slope model. | <li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_slope` standard deviation of the random slopes </li><li> `rho` correlation of random effects </li><li> `sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_temp` a simulated data frame |
| df-sim-wrapper-function_random-slope.R | This function wraps around the previous and generates as many simulated datasets as requested. | <li> `n_sims` number of simulated datasets required </li><li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_slope` standard deviation of the random slopes </li><li> `rho` correlation of random effects </li><li>`sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_list` a list of simulated dataframes |
|log-hazard-function.R | This takes the data `x` (dataframe), coefficients `betas` (named vector), and time `t` (numeric) and returns the log-hazard |  <ul><li>`t`</li><li>`betas`</li><li>`x`</li></ul> | log-hazard. Used by the `simsurv` function to simulate survival data.| 
| mcmc-compare-v-control.R | This is used in `analysis/05_compare-v-control.R` to estimate posterior probability that a given arm has steeper TTP slope than control | `mcmc_df` data frame of MCMC credible estimates of TTP slopes | `output` dataframe |
| mcmc-rank-function.R | This is used in `analysis/04_ranking-probabilities.R` to estimate the posterior probability associated with ranking TTP | `mcmc_df` data frame of MCMC credible estimates of TTP slopes | `output` dataframe |
| target-product-profile-function.R | This is used in `analysis/03_tpp-decisions.R` to return TPP decisions | <li>`mcmc_list` list of dataframes containing MCMC credible estimates for TTP slope</li><li> `nk` number per regimen </li><li> `theta_lrv` minimum acceptable value on TTP slope (%)</li><li> `theta_tv` target value for TTP slope (%)</li><li>`tau_lrv` maximum allowable risk that an arm is advanced that does not reach the minimal level of acceptable efficacy</li><li>`tau_tv` maximum allowable risk that an arm is issued a NO-GO decision when it has an unequivocal improvement in efficacy </li> | `out` dataframe | 
| weibull-survival-function.R | The Weibull survival function (used for root-finding) | <li>`lambda`</li><li> `p`  </li><li> `surv.prop` proportion survived </li><li> `t` time t | |

### reports

<!--+ `sample-study-design.Rmd` describes the set-up for the simulated datasets-->
+ `simulation-results_full.Rmd` is the larger comprehensive file containing all analysis results from all simulated datasets
<!--+ `simulation-overview.Rmd` [NEEDS UPDATING] should contain an ADEMP map of the project-->

### graphs

The figures included in the manuscript are under the folder `submission`. Otherwise, includes a random assortment of figures generated by (analyses of) the simulated data. 

## Files excluded from repository

### data

+ `analyzed`
  + `2022-03-07_sim-level-ttp-results_nk*_4mo-duration.RData` - contains log10(TTP) metric estimates for each arm for each setting
+ `bayes-generated`
+ `simulated-datasets`

### sandbox

+ `2022-03-selecting-from-three.*` the Rmd and html walking through how we expect things to change given we were using 3 novel regimens rather than four. Can be moved to main folders, but will need to be de-identified first
+ Brainstorming of seamless study with collaborators (.docx)
+ PPTX walking through the more complex survival scenarios when multiple durations were being considered
+ draft tables for presenting results (.docx)

