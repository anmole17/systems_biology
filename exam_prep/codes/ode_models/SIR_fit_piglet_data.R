# # Basic SIR model is solved numerically
# dS/dt=-beta*I*S
# dI/dt= beta*I*S - gamma*I
# dR/dt= gamma*I
# S= fraction of susceptibility indiv
# I= fraction of infectious indiv
# R= fraction of recovered/removed indiv
# beta = transmission rate per inf. indiv 
# gamma = recovery rate
t<-c(2,7,8,12,15,16,20,26,29,33,38,43,48)
infected_proportion<-c(0.012,0.06,0.23,0.39,0.56,0.41,0.29,
                0.2,0.1,0.02,0.05,0.015,0.02)
beta=0.83
gamma=1/0.2
S_ini=1
I_ini=1/1000
R_ini=0


library("deSolve")
library("scatterplot3d")
SIR_model<-function(times,y,params){
  beta<-params[1]
  gamma<-params[2]
  
  dS=-beta*y[1]*y[2]
  dI= beta*y[1]*y[2]-gamma*y[2]
  dR= gamma*y[2]
  
  return(list(c(dS,dI,dR)))
}

#out[1,1,1,1]
# initial value S(0)=0.99; I(O)=0.01; R(0)=0 

initial<-c(y1=1, y2=1/1000, y3=0.0)

# parameters  beta = 8.0; gamma=4.3
beta <- 7.48
gamma <- (1/0.88)
params<-c(beta,gamma)

times<-seq(from=0, to=5.0, by=0.1)

X11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=SIR_model)
#par(mfrow = c(1, 2))
#plot(out[,1],out[,2], type='line')
#lines(out[,1],out[,3], col='blue')
#lines(out[,1],out[,4])
par(mfrow=c(1,2))
plot(out[,1],out[,2], type='l',col="blue")
lines(out[,1],out[,3], type='l', col="red")
lines(out[,1],out[,4], type='l',col="green",)
lines(t/10,infected_proportion, col='red',type='l' ,lty=2)
legend(x="topright",legend=c("S","I","R","I_data"),col=c("blue","red","green","red"),lty=c(1,1,1,2),xpd=TRUE)

plot(out[,1],out[,3], type='l',col="blue")
lines(t/10,infected_proportion, col='red',type='l' ,lty=2)
print(out[,4])
legend(x="topright",legend=c("I_pred","I_data"),col=c("blue","red"),lty=c(1,2),xpd=TRUE)
