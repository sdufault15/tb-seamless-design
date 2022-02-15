weibull_survival_function <- function(lambda, p, surv.prop, t){
  # For finding the root of:
  # S(t) = e^{-\lambda t ^ p}
  exp(-lambda*t^p) - surv.prop
}
