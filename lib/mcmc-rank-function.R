# Function to evaluate MCMC rank
mcmc_rank_function <- function(mcmc_df){
  rnks <- apply(mcmc_df, 1, rank)
  
  output <- data.frame(p.subset.1 = apply(rnks,1, function(x){sum(x>4)}), # best
                       p.subset.2 = apply(rnks,1, function(x){sum(x>3)}), # top 2
                       p.subset.3 = apply(rnks,1, function(x){sum(x>2)}),
                       p.subset.4 = apply(rnks,1, function(x){sum(x>1)}),
                       nsims = apply(rnks,1,length)) %>% 
    mutate(p.subset.1 = p.subset.1/nsims,
           p.subset.2 = p.subset.2/nsims,
           p.subset.3 = p.subset.3/nsims,
           p.subset.4 = p.subset.4/nsims) %>% 
    rownames_to_column(var = "regimen")
  
  return(output)
}