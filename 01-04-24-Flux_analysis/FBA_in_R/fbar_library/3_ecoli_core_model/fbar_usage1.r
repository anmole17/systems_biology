###  How to use fbar library for Flux Balance Analysis (FBA)

###  Use "ecoli_core" model inside the library

library(fbar)

## get the data for ecoli_core model inbuilt in fbar packages
data(ecoli_core)

## write the data frame into csv file
## write.csv(ecoli_core, file="ecoli_core.csv", row.names=FALSE)

#### About ecoli_core data
##------------------------------------------------------------------------
##  it is a data frame with 95 rows and 7 columns

## one of the variable, "BIOMASS_Ecoli_core_w_GAM" is defined as the variable to be minimized in FBA.

##Column descriptions:
##  abbreviationan : abbreviated reaction name, acts as the reaction id

##  lowbnd :  lower bound on the reaction rate

## uppbnd :   upper bound on the reaction rate

## obj_coef  :   identifies a reaction (or reactions) for which the maximum possible rate should be found


## officialName  :  full reaction name

## geneAssociation :  a boolean combination of genes which control the reaction

## subsysteman : an indicator of reaction functio


## Note : in "ecoli_core" data frame, the obj_coef=1 for ""BIOMASS_Ecoli_core_w_GAM"", and
##           for every other variable it is zero. This rate is maximized in FBA to get a set of solutions.

### -------------------------------------------------------------------------


library(ROI.plugin.ecos)

## the function "find_fluxes_df(ecoli_core)" calculates the fluxes for the model ecoli_core, and is returned as the same data frame, with fluxes appended.

## reaction_table --> data frame representing metabolic model (for details of columns, see notes above)
## "do_minimization" --> to uniformly minimize all non-objective fluxes after finding the objective. Default is FALSE
ecoli_core_with_flux <- find_fluxes_df(reaction_table=ecoli_core, do_minimization=FALSE)

print(colnames(ecoli_core_with_flux)) 

print(ecoli_core_with_flux$flux) ## fluxes of all species as final solution.


