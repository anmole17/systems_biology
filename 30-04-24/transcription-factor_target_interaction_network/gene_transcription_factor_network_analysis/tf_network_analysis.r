# create a directed network of transcription factor - target interactions 
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3079585/


## The following three data sets from ENCODE project repositories are used in this analysis.
## They were downloaded from Harmonizome data base at 
#      "https://maayanlab.cloud/Harmonizome/dataset/ENCODE+Transcription+Factor+Targets"
##  Following three files were downloaded from the above page:

##  1. "gene_list_terms.txt" has a list of 22449 human genes from encode project
##  2. "attribute_list_entries.txt" has a list of 181 transcription factors
##  3. "gene_attribute_edges.txt" has a list of 1651393 gene-transcription factor associations

## This web page has a detailed description of all these 181 trandscription factors.

#######################################################################################################

# load igraph
library(igraph)

## read data files into data frames

## 22449 genes in the human genome
gene_data = read.table("./transcription-factor_target_interaction_network/gene_transcription_factor_network_analysis/gene_list_terms.txt", sep = "\t", header = T)

## 181 Trandscription Factors 
tf_data = read.table("./transcription-factor_target_interaction_network/gene_transcription_factor_network_analysis/attribute_list_entries.txt", sep = "\t", header = T)

## 1651393 gene_tf interaction network data
gene_tf_network_data =  read.table("./transcription-factor_target_interaction_network/gene_transcription_factor_network_analysis/gene_attribute_edges.txt", sep = "\t", header = T)

## read a list of genes from hyper methylation data. There are 351 genes in this data.
df_hyp = read.csv("./transcription-factor_target_interaction_network/gene_transcription_factor_network_analysis/GSE42861_TSS_hypermethylated.csv", header=TRUE)
meth1_genes = df_hyp$gene_name

## create a vector of genes
genevec = gene_data$GeneSym

## create a vector of Transcription Factors
tfvec = tf_data$GeneSym

# create a new dataframe with two columns: "TF" and "GENE"
gene_tf_table = data.frame(TF = gene_tf_network_data$target, GENE = gene_tf_network_data$source)

#gene_tf_table = data.frame(GENE = gene_tf_network_data$source, TF = gene_tf_network_data$target)


# create graph from table. Use igraph libeary "graph_from_data_frame"
gene_tf_graph = graph_from_data_frame(d=gene_tf_table, directed = T)
print(gene_tf_graph)

## 1. returns nodes connected one step away from a transcription factor node.
res_tf = adjacent_vertices(gene_tf_graph, tfvec, "out")
## res[[1]], res[[2]], etc are vector of genes one connection away for genes 1,2,3,  in tfvec
for(i in 1:length(res_tf))
{
 print(length(res_tf[[i]]))
}

print(res_tf[[14]])


##2. Create a graph connecting transcription factors to hypermethylated genes in RA
 hyper_meth_gene_tf_table = gene_tf_table[gene_tf_table$GENE %in% meth1_genes, ] 
 hyper_meth_gene_tf_graph = graph_from_data_frame(d=hyper_meth_gene_tf_table, directed = T)
 print(hyper_meth_gene_tf_graph)

## TF directly connected to specific genes in ypermethylated list
  neighbors(hyper_meth_gene_tf_graph, "BCL9L", mode="in")

  neighbors(hyper_meth_gene_tf_graph, "FOXN2", mode="in")


## not working ... check
## returns nodes connected one step away from a transcription factor to hypermethylated node.
res_hyper_tf = adjacent_vertices(hyper_meth_gene_tf_graph, tfvec, "out")
## res[[1]], res[[2]], etc are vector of genes one connection away for genes 1,2,3,  in tfvec
for(i in 1:length(res_hyper_tf))
{
 print(length(res_hyper_tf[[i]]))
}

print(res_hyper_tf[[14]])

###---------------------------------------------------------------------------------------------------
## testing some functions

  #gr1_dir = graph(c("T1","N1","T1","N2","T1","N3","T2","N1","T2","N2","T3","N2","N4","T1"))
  #plot(gr1_dir)

#We can also easily identify the immediate neighbors of a vertex. The neighbors function finds all
#nodes one step out from the focal actor.To find the neighbors for multiple nodes,
#use adjacent_vertices() instead of neighbors(). 
#To find node neighborhoods going more than one step out, use function ego() with parameter order set to
#the number of steps out to go from the focal node(s).

  #neighbors(gr1_dir, "T1", mode="out")

## Now we have source and target nodes indifferent vectors
  #asource = c("T1","T1","T1","T2","T2","T3","N4")
  #atarget = c("N1","N2","N3","N1","N2","N2","T1")

  #tab = data.frame(asource, atarget)  ## Arrow goes from source to target

## graph is from source to target
  #dgraph = graph_from_data_frame(d=tab, directed = T)

  #aa = as_edgelist(dgraph, names = TRUE)

  #bb = as.data.frame(aa)

  #cc = subset(bb, bb$V1=="T1")  ## gives targets coonected to source "T1".

  #print(cc$V2)  ## vector with elements "N1","N2","N3" connected to "T1","T2","T3"


#The neighbors function finds all
#nodes one step out from the focal actor.To find the neighbors for multiple nodes,
#use adjacent_vertices() instead of neighbors(). 
#To find node neighborhoods going more than one step out, use function ego() with parameter order set to
#the number of steps out to go from the focal node(s).

#nn = neighbors(dgraph, "T1", mode="out")  # list of direct nodes connected from "T1" 

#alis = V(dgraph)$name[nn] #list of direct nodes connected from "T1" 

#nrs = neighbors(gene_tf_graph, "ATF1", mode="out")  ## 

## returns the dircect connections of all nodes in the graph
#aa = as_edgelist(gene_tf_graph, names = TRUE)

#bb = as.data.frame(aa)

#cc = subset(bb, bb$V1=="ARID3A")

#neigh.nodes <- neighbors(gene_tf_graph, V(gene_tf_graph)[names=="ARID3A"], mode="in")

#alis = transcribed_genes(gene_tf_graph,"ARID3A","in")
#print(alis)


#------------------------------------------------------------------------------------------------------



