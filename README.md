# Phase IIB/C Seamless Design Simulation Study

## Files included in repository

### lib

| filename | description | input | output | 
|:--------:|:------------|:------|:-------|
|coef-function.R | This estimates the coefficient values for the parametric survival model based on the inputs | <ul><li>`s.1` reference survival function</li><li>`s.k` regimen-specific survival function</li><li>`t.1` weeks post-treatment for reference survival function</li><li>`d` duration of regimen</li><li>`max.d.k` maximum duration of regimen</li><li>`p` shape parameter</li><li>`duration.effect` duration effect</li></ul> | <ul><li>reference lambda</li><li>regimen k lambda</li><li>log HR</li><li>g(d)</li><li>beta_k</li></ul> |
|log-hazard-function.R | This takes the data `x` (dataframe), coefficients `betas` (named vector), and time `t` (numeric) and returns the log-hazard |  <ul><li>`t`</li><li>`betas`</li><li>`x`</li></ul> | log-hazard. Used by the `simsurv` function to simulate survival data.| 
| df-sim-function.R | This function simulates a dataset based on a random intercept model. | <li>`nk` number per regimen </li><li> `k` number of regimens </li><li> `betas` main effects </li><li> `weeks` number of weeks under observation </li><li> `sd_id` standard deviation of the random intercepts </li><li> `sd_randomnoise` measurement error </li><li> `lod` limit of detection | `df_temp` a simulated data frame |

## Files excluded in repository
