###  How to use fbar library for Flux Balance Analysis (FBA)

###  Use "ecoli_core" model inside the library

library(fbar)

library(ROI.plugin.ecos)

#-------------------------------------------------


## the function "find_fluxes_df(model)" calculates the fluxes for the model, and is returned as the same data frame, with fluxes appended.

## reaction_table --> data frame representing metabolic model (for details of columns, see notes above)
## "do_minimization" --> to uniformly minimize all non-objective fluxes after finding the objective. Default is FALSE


dummy_model2_table=read.csv("dummy_model-2.csv", header=TRUE)


dummy_model2_table$lowbnd = as.numeric(dummy_model2_table$lowbnd)
dummy_model2_table$uppbnd = as.numeric(dummy_model2_table$uppbnd)
dummy_model2_table$obj_coef = as.numeric(dummy_model2_table$obj_coef)


dummy_model2_with_flux =  find_fluxes_df(reaction_table=dummy_model2_table, do_minimization=FALSE)

print(dummy_model2_with_flux)



