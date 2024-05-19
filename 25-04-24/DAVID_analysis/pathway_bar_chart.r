
library(dplyr)
library(ggplot2)
library("Cairo")
library(tidyverse)


david_data=read.delim("david_analysis.txt", sep='\t')
head(david_data)
#S6_R6_all = read.csv("for_pathway_plot_S6_R6_all.csv")

david_data<-david_data %>% 
  filter(substr(Term,1,2)=="GO", FDR < 0.05) %>% 
  mutate(GO_ID = do.call('rbind', strsplit(Term,'~', fixed=TRUE))[,1],
         Term = do.call('rbind', strsplit(Term,'~', fixed=TRUE))[,2]) %>% 
  arrange(Count)
  
head(david_data)
# volcano
# down_et_C_MW <- subset(et_table_C_MW, et_table_C_MW$logFC <= -1 & et_table_C_MW$PValue <= 0.0001)
# with(et_table_MT_AB, plot(et_table_MT_AB$logFC, -log10(et_table_MT_AB$PValue),
#                           pch=20, main="Cond. A vs Cond. B in MT",ylim=c(0,10)))
# with(subset(et_table_MT_AB, logFC >= 1 & PValue <= 0.001), 
#      points(logFC, -log10(PValue), pch=20, col="red"))
# with(subset(et_table_MT_AB, logFC <= -1 & PValue <= 0.001),
#      points(logFC, -log10(PValue), pch=20, col="blue"))
# S6 Vs R6 all pathways

Cairo(
file="bar_chart_pathways.jpg",
type="jpg",
width = 10,
height = 14,
units = "in",
dpi = 500,
pointsize = 6,
compression = c("lzw")
)



david_data$Term <- factor(david_data$Term, levels = david_data$Term)
ggplot(tail(david_data,20), aes(Term, Count)) + 
ggtitle("Selected Pathways") +
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


## enrich R





