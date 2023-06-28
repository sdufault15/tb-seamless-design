log_haz_1 <- function(t, x, betas){
  lhaz <- log(betas[["shape"]]*(t ^(betas[["shape"]] - 1))) + 
    betas[["Intercept"]] +  
    betas[["regimen2"]]*x[["regimen2"]] +
    betas[["regimen3"]]*x[["regimen3"]] +
    betas[["regimen4"]]*x[["regimen4"]] +
    betas[["regimen5"]]*x[["regimen5"]] +
    betas[["duration.fun"]]*x[["duration.fun"]] # fixed duration effect
  
  return(lhaz)
}