# Phase IIB/C Seamless Design Simulation Study

## Files included in repository

### analysis

+ `00_run-all.R` This script sets up the analysis of the survival and TTP data for the 30, 40, 60, and 80 participant per arm datasets. The following scripts are written generally as they are specifically written to be run from this base script.
+ `01_relapse-counts.R` This script counts the number of relapses that happen per regimen by the interim analysis (defined within) for each simulation. All results are stored in the `data/analyzed` folder with `[DATE]_relapse-counts-by-simulation_[nk]` included in the filename.
+ `02_advance-ttp.R` This script examines the TTP MCMC chains and estimates 1) the probability that each novel regimen is better than the control (% confidence), and 2) the probability that each novel regimen is one of the top 2 regimens. It returns a list of dataframes containing the probability that each novel regimen would advance on the basis of meeting a particular threshold set on estimates 1 and 2. All results are stored in the `data/analyzed` folder with `[DATE]_sim-level-ttp-results_[nk]` in the filename.
+ `03_advance-relapse.R` This script is very similar to `01_relapse-counts.R`. **Will need to review.** All results are stored in the `data/analyzed` folder with `[DATE]_s9*-situation*-results_` in the filename.
+ `survival-curves_situation-fixed-duration*` files to generate the figures for each survival setting (e.g. mixed, all minimal, all desirable).

### docs

+ `sample-study-design.html` describes the set-up for the simulated datasets
+ `simulation-study-results.html` is the larger comprehensive file containing all analysis results from all simulated datasets
+ `simulation-overview.html` [NEEDS UPDATING] should contain an ADEMP map of the project
+ `2022-03-10_simulation-study-results.html` old report containing information that was lost when OS updated

### lib

| filename | description | input | output | 
|:--------:|:------------|:------|:-------|
|coef-function.R | This estimates the coefficient values for the parametric survival model based on the inputs | <ul><li>`s.1` reference survival function</li><li>`s.k` regimen-specific survival function</li><li>`t.1` weeks post-treatment for reference survival function</li><li>`d` duration of regimen</li><li>`max.d.k` maximum duration of regimen</li><li>`p` shape parameter</li><li>`duration.effect` duration effect</li></ul> | <ul><li>reference lambda</li><li>regimen k lambda</li><li>log HR</li><li>g(d)</li><li>beta_k</li></ul> |
| df_extract-mcmc-slopes-function.R | This function extracts the MCMC parameter estimates from the brms model output and converts them all into stand-alone slopes. | `modresults` a brms model object | a (`n_chains` x `n_iterations`) x 5 regimens dataframe with credible slope estimates |
| df-sim-function.R | This function simulates a dataset based on a random intercept model. | <li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_temp` a simulated data frame |
| df-sim-wrapper-function.R | This function wraps around the previous and generates as many simulated datasets as requested. | <li> `n_sims` number of simulated datasets required </li><li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_list` a list of simulated dataframes |
|log-hazard-function.R | This takes the data `x` (dataframe), coefficients `betas` (named vector), and time `t` (numeric) and returns the log-hazard |  <ul><li>`t`</li><li>`betas`</li><li>`x`</li></ul> | log-hazard. Used by the `simsurv` function to simulate survival data.| 
| weibull-survival-function.R | The Weibull survival function (used for root-finding) | <li>`lambda`</li><li> `p`  </li><li> `surv.prop` proportion survived </li><li> `t` time t | |

### munge

+ `0*_nk-30_*.R` these files take the sample size of 30 and add simulated survival data to the already existing log10(TTP) simulated data at this sample size. *These scripts correspond to a duration-randomized design such that 6 participants per regimen are assigned to 8, 10, 12, 14, or 16 weeks of treatment. Survival outcomes are specified with respect to particular durations.*  
+ `2*_nk-30_*_fixed-duration.R` these files take the sample size of 30 and add simulated survival data to the already existing log10(TTP) simulated data at this sample size. *These scripts correspond to a fixed 4 month duration of each novel treatment.* 
+ `3*` these files simulate TTP and survival outcomes for sample sizes of 60 and 80 per regimen. These scripts correspond to a fixed 4 month duration of each novel treatment.
+ `4*` these files take the sample size of 40 and add simulated survival data to the already existing log10(TTP) simulated data at this sample size. These scripts correspond to a fixed 4 month duration of each novel treatment.
+ `80_generate-pointplots_prob-stopping.R` [TEMPORARY] file for generating point plot with probability of stopping versus true TTP and true relapse rate
+ `81_generate-roc-plots_stopping.R` [TEMPORARY] file for generating pseudo-ROC plots with operating characteristics when a threshold has been set on the observed and true "futility" criteria.
+ `99_saving-smaller-bayes-objects.R` file for taking some of the earlier model results (quite big) and extracting the smaller components needed for analysis.

### reports

+ `sample-study-design.Rmd` describes the set-up for the simulated datasets
+ `simulation-study-results.Rmd` is the larger comprehensive file containing all analysis results from all simulated datasets
+ `simulation-overview.Rmd` [NEEDS UPDATING] should contain an ADEMP map of the project

## Files excluded from repository

### data

+ `analyzed`
+ `bayes-generated`
+ `simulated-datasets`

### sandbox

+ `2022-03-selecting-from-three.*` the Rmd and html walking through how we expect things to change given we were using 3 novel regimens rather than four. Can be moved to main folders, but will need to be de-identified first
+ Brainstorming of seamless study with collaborators (.docx)
+ PPTX walking through the more complex survival scenarios when multiple durations were being considered
+ draft tables for presenting results (.docx)

