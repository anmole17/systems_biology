###  How to use fbar library for Flux Balance Analysis (FBA)

###  Use "ecoli_core" model inside the library

library(fbar)

library(ROI.plugin.ecos)

#-------------------------------------------------


## the function "find_fluxes_df(model)" calculates the fluxes for the model, and is returned as the same data frame, with fluxes appended.

## reaction_table --> data frame representing metabolic model (for details of columns, see notes above)
## "do_minimization" --> to uniformly minimize all non-objective fluxes after finding the objective. Default is FALSE


penthose_phosphate_table=read.csv("penthose_phosphate_pathway.csv", header=TRUE)


penthose_phosphate_table$lowbnd = as.numeric(penthose_phosphate_table$lowbnd)
penthose_phosphate_table$uppbnd = as.numeric(penthose_phosphate_table$uppbnd)
penthose_phosphate_table$obj_coef = as.numeric(penthose_phosphate_table$obj_coef)


penthose_pathway_with_flux =  find_fluxes_df(reaction_table=penthose_phosphate_table, do_minimization=FALSE)

print(penthose_pathway_with_flux)



