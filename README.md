# Phase IIB/C Seamless Design Simulation Study

## lib

| filename | description | input | output | 
|:--------:|:------------|:-----:|:------:|
|coef-function.R | This estimates the coefficient values for the parametric survival model based on the inputs | reference survival function `s.1` = $S_1(t)$, regimen-specific survival function `s.k` = $S_k(t)$, weeks post-treatment for reference survival function `t.1`, duration of regimen `d`, maximum duration of regimen `max.d.k`, shape parameter `p`, and duration effect. | $\lambda_1, \lambda_k, \log HR, g(d), \beta_k$ |