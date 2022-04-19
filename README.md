# Phase IIB/C Seamless Design Simulation Study

## Files included in repository

### lib

| filename | description | input | output | 
|:--------:|:------------|:------|:-------|
|coef-function.R | This estimates the coefficient values for the parametric survival model based on the inputs | <ul><li>`s.1` reference survival function</li><li>`s.k` regimen-specific survival function</li><li>`t.1` weeks post-treatment for reference survival function</li><li>`d` duration of regimen</li><li>`max.d.k` maximum duration of regimen</li><li>`p` shape parameter</li><li>`duration.effect` duration effect</li></ul> | <ul><li>reference lambda</li><li>regimen k lambda</li><li>log HR</li><li>g(d)</li><li>beta_k</li></ul> |
| df_extract-mcmc-slopes-function.R | This function extracts the MCMC parameter estimates from the brms model output and converts them all into stand-alone slopes. | `modresults` a brms model object | a (`n_chains` x `n_iterations`) x 5 regimens dataframe with credible slope estimates |
| df-sim-function.R | This function simulates a dataset based on a random intercept model. | <li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_temp` a simulated data frame |
| df-sim-wrapper-function.R | This function wraps around the previous and generates as many simulated datasets as requested. | <li> `n_sims` number of simulated datasets required </li><li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_list` a list of simulated dataframes |
|log-hazard-function.R | This takes the data `x` (dataframe), coefficients `betas` (named vector), and time `t` (numeric) and returns the log-hazard |  <ul><li>`t`</li><li>`betas`</li><li>`x`</li></ul> | log-hazard. Used by the `simsurv` function to simulate survival data.| 
| weibull-survival-function.R | The Weibull survival function (used for root-finding) | <li>`lambda`</li><li> `p`  </li><li> `surv.prop` proportion survived </li><li> `t` time t | |

## Files excluded in repository
