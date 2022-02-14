coef.function <- function(s.1, s.k, t.1 = 26, d, max.d.k, p = 0.425, duration.effect = 1.05){
  
  ref.haz <- uniroot(weibull_function,
                     p = p,
                     surv.prop = s.1,
                     t = t.1,
                     interval = c(0,10))$root
  
  k.haz <- uniroot(weibull_function,
                   p = p,
                   surv.prop = s.k,
                   t = 52 - d,
                   interval = c(0,10))$root

  lhs <- log(k.haz/ref.haz)

  main.eff <- ifelse(d == max.d.k, lhs, lhs/(duration.effect*(max.d.k - d)))

  output <- data.frame(ref.haz = ref.haz,
                       k.haz = k.haz,
                       logHR = k.haz,
                       gfun = max.d.k - d,
                       main.eff = main.eff)
  return(output)
}

