x=rnorm(50,mean=c(rep(0,25),rep(0,30)))
p=2*pnorm(sort(-abs(x)))
p.corrected=p.adjust(p,method="fdr")