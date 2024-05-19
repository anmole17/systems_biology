# to create a volcano plot 

down_et_C_MW <- subset(et_table_C_MW, et_table_C_MW$logFC <= -1 & et_table_C_MW$PValue <= 0.0001)

with(et_table_MT_AB, plot(et_table_MT_AB$logFC, -log10(et_table_MT_AB$PValue),
                          pch=20, main="Cond. A vs Cond. B in MT",ylim=c(0,10)))
with(subset(et_table_MT_AB, logFC >= 1 & PValue <= 0.001), 
     points(logFC, -log10(PValue), pch=20, col="red"))
with(subset(et_table_MT_AB, logFC <= -1 & PValue <= 0.001),
     points(logFC, -log10(PValue), pch=20, col="blue"))