# Phase IIB/C Seamless Design Simulation Study

## lib

| filename | description | input | output | 
|:--------:|:------------|:-----:|:------:|
|coef-function.R | This estimates the coefficient values for the parametric survival model based on the inputs | <ul><li>`s.1` reference survival function</li><li>`s.k` regimen-specific survival function</li><li>`t.1` weeks post-treatment for reference survival function</li><li>`d` duration of regimen</li><li>`max.d.k` maximum duration of regimen</li><li>`p` shape parameter</li><li>`duration.effect` duration effect</li> </ul> | $\lambda_1, \lambda_k, \log HR, g(d), \beta_k$ |