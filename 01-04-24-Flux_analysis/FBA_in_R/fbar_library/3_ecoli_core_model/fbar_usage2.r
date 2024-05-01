
library(dplyr)
library(purrr)
library(stringr)
library(fbar)

#--------------------------------------------
evaluation_function <- function(genome){
  
  res <- model %>%
    mutate(activation = gene_eval(geneAssociation, names(genome), genome),
           activation = coalesce(activation, 1),
           uppbnd = uppbnd*activation,
           lowbnd = lowbnd*activation) %>%
    find_fluxes_df(do_minimization = FALSE) %>%
    mutate(lowbnd = ifelse(abbreviation=='BIOMASS_Ecoli_core_w_GAM', flux*0.99, lowbnd),
           uppbnd = ifelse(abbreviation=='BIOMASS_Ecoli_core_w_GAM', flux*1.01, uppbnd),
           obj_coef = 1*(abbreviation=='EX_ac_e')) %>%
    find_fluxes_df(do_minimization = FALSE)
  
  return(list(bm = filter(res, abbreviation=='BIOMASS_Ecoli_core_w_GAM')$flux, 
              synth = filter(res, abbreviation=='EX_ac_e')$flux))
}
#----------------------------------------------------


data(ecoli_core)

res = evalution_function(ecoli_core)




