
library(dplyr)
library(ggplot2)
library("Cairo")


# in_6_not_in_24 = read.csv("for_pathway_plot_genes_in_6_not_in_24.csv")

# in_24_not_in_6 = read.csv("for_pathway_plot_genes_in_24_not_in_6.csv")

# common_6_24 = read.csv("for_pathway_plot_genes_common_6_24.csv")

S6_R6_all = read.csv("for_pathway_plot_S6_R6_all.csv")

# S24_R24_all = read.csv("for_pathway_plot_S24_R24_all.csv")

# poonam_selected_in_6_not_in_24 = read.csv("for_pathway_plot_poonam_selected_genes_in_6_not_in_24.csv")

# poonam_selected_in_24_not_in_6 = read.csv("for_pathway_plot_poonam_selected_genes_in_24_not_in_6.csv")

# poonam_selected_6_and_24 = read.csv("for_pathway_plot_poonam_selected_genes_common_6_24.csv")


# upregulated_24 = read.csv("selected pathways_for_S24_R24_upreg_genes_FC_2_adj_pval_0.1.csv")

# upregulated_6 = read.csv("selected pathways_for_S6_R6_upreg_genes_FC_2_adj_pval_0.1.csv")




###  for 6 not in 24

# 
# Cairo(
# file="bar_chart_pathways_in_6_not_in_24.jpg",
# type="jpg",
# width = 10,
# height = 10,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# df <- arrange(in_6_not_in_24, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + ggtitle("Regulated Pathways for genes in 6h not in 24h") + 
# geom_bar(stat="identity", color="blue", fill="blue")+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12) )
# 
# dev.off()
# 
# 
# 
# 
# 
# 
# 
# ###  for 24 not in 6
# 
# 
# Cairo(
# file="bar_chart_pathways_in_24_not_in_6.jpg",
# type="jpg",
# width = 10,
# height = 14,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# df <- arrange(in_24_not_in_6, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + 
# ggtitle("Regulated Pathways for genes in 24h not in 6h") + 
# geom_bar(stat="identity", color="blue", fill="blue")+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12),
# 	  plot.title = element_text("bar plot", face="bold", size=12) )
# 
# dev.off()
# 
# 
# # common to 6 and 24
# 
# Cairo(
# file="bar_chart_pathways_common_to_6_and_24.jpg",
# type="jpg",
# width = 10,
# height = 10,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# 
# df <- arrange(common_6_24, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + 
# ggtitle("Regulated Pathways for genes common in 24h and in 6h") +
# geom_bar(stat="identity", color="blue", fill="blue")+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12) )
# 
# dev.off()
# 




# S6 Vs R6 all pathways

Cairo(
file="bar_chart_S6_R6_all_pathways.jpg",
type="jpg",
width = 10,
height = 14,
units = "in",
dpi = 500,
pointsize = 6,
compression = c("lzw")
)



df <- arrange(S6_R6_all, Count)
df$Term <- factor(df$Term, levels = df$Term)
ggplot(df, aes(Term, Count)) + 
ggtitle("Selected Pathways among regulated for genes in S6 and R6") +
geom_bar(stat="identity", color="blue", fill="blue")+	
coord_flip() +
theme(axis.text.x = element_text(face="bold", color="#993333", 
                           size=14),
          axis.text.y = element_text(face="bold", color="#993333", 
                           size=12),
	  legend.text = element_text(face="bold"),
	  axis.title.x = element_text(face="bold", size=12),
	  axis.title.y = element_text(face="bold", size=12) )

dev.off()




# S24 Vs R24 selected pathways
# 
# Cairo(
# file="bar_chart_S24_R24_all_pathways.jpg",
# type="jpg",
# width = 10,
# height = 14,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# 
# df <- arrange(S24_R24_all, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + 
# ggtitle("Selected Pathways among regulated for genes in S24 and R24") +
# geom_bar(stat="identity", color="blue", fill="blue")+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12) )
# 
# dev.off()
# 
# 
# 
# 
# 
# ### Poonam selected in 6 not in 24
# 
# 
# Cairo(
# file="bar_chart_pathways_poonam_selected_in_6_not_in_24.jpg",
# type="jpg",
# width = 10,
# height = 10,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# df <- arrange(poonam_selected_in_6_not_in_24, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + ggtitle("Regulated Pathways for genes in 6h not in 24h") + 
# geom_bar(stat="identity", color="blue", fill="blue")+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12) )
# 
# dev.off()
# 
# 
# 
# ##
# ### Poonam selected in 24 not in 6
# 
# 
# Cairo(
# file="bar_chart_pathways_poonam_selected_in_24_not_in_6.jpg",
# type="jpg",
# width = 10,
# height = 14,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# df <- arrange(poonam_selected_in_24_not_in_6, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + ggtitle("Regulated Pathways for genes in 6h not in 24h") + 
# geom_bar(stat="identity", color="blue", fill="blue")+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12) )
# 
# dev.off()
# 
# 
# 
# 
# ## Poonam selected common to 6 and 24
# Cairo(
# file="bar_chart_pathways_poonam_selected_in_6_and_24.jpg",
# type="jpg",
# width = 10,
# height = 14,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# df <- arrange(poonam_selected_in_6_and_24, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + ggtitle("Regulated Pathways for genes in 6h not in 24h") + 
# geom_bar(stat="identity", color="blue", fill="blue")+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12) )
# 
# dev.off()
# 
# 
# 
# 
# 
# 
# ### enriched pathways for genes up regulated at 6h
# 
# 
# Cairo(
# file="bar_chart_pathways_for_upregulated_genes_in_6h.jpg",
# type="jpg",
# width = 10,
# height = 14,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# df <- arrange(upregulated_6, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + ggtitle("pathways for genes upregulated in 6h") + 
# geom_bar(stat="identity", color="black", fill="black", width=0.5)+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12) )
# 
# dev.off()
# 
# 
# 
# ### enriched pathways for genes up regulated at 24h
# 
# 
# Cairo(
# file="bar_chart_pathways_for_upregulated_genes_in_24h.jpg",
# type="jpg",
# width = 10,
# height = 14,
# units = "in",
# dpi = 500,
# pointsize = 6,
# compression = c("lzw")
# )
# 
# 
# df <- arrange(upregulated_24, Count)
# df$Term <- factor(df$Term, levels = df$Term)
# ggplot(df, aes(Term, Count)) + ggtitle("pathways for genes upregulated in 24h") + 
# geom_bar(stat="identity", color="black", fill="black", width=0.2)+	
# coord_flip() +
# theme(axis.text.x = element_text(face="bold", color="#993333", 
#                            size=14),
#           axis.text.y = element_text(face="bold", color="#993333", 
#                            size=12),
# 	  legend.text = element_text(face="bold"),
# 	  axis.title.x = element_text(face="bold", size=12),
# 	  axis.title.y = element_text(face="bold", size=12) )
# 
# dev.off()





