# Basic SIR model is solved numerically
# dS/dt=-beta*I*S
# dI/dt= beta*I*S - gamma*I
# dR/dt= gamma*I
# S= fraction of susceptibility indiv
# I= fraction of infectious indiv
# R= fraction of recovered/removed indiv
# beta = transmission rate per inf. indiv 
# gamma = recovery rate
# solve  for: beta = 8.0; gamma=4.3; S(0)=0.99; I(O)=0.01; R(0)=0 
#====================================================
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

initial<-c(y1=0.99, y2=0.1, y3=0.0)

# parameters  beta = 8.0; gamma=4.3
beta <- 8.0
gamma <- 4.3
params<-c(beta,gamma)

times<-seq(from=0, to=4.0, by=0.01)

x11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=SIR_model)
#par(mfrow = c(1, 2))
plot(out[,1],out[,2], type='line')
lines(out[,1],out[,3])
lines(out[,1],out[,4])
print(out[,4])

#scatterplot3d(out[,c(1,2,3)])
# params 2 
# initial value S(0)=0.99; I(O)=0.01; R(0)=0 

initial<-c(y1=0.99, y2=0.01, y3=0.0)

# parameters  beta = 8.0; gamma=4.3
beta <- 7.0
gamma <- 4.3
params<-c(beta,gamma)

times<-seq(from=0, to=10.0, by=0.01)

x11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=SIR_model)
#par(mfrow = c(1, 2))
plot(x=out[,1],y=out[,2], type='line')
lines(x=out[,1],y=out[,3])
lines(x=out[,1],y=out[,4])

#scatterplot3d(out[,c(1,2,3)])
# params 3 
# initial value S(0)=0.99; I(O)=0.01; R(0)=0 

initial<-c(y1=0.99, y2=0.1, y3=0.0)

# parameters  beta = 8.0; gamma=4.3
beta <- 3.0
gamma <- 4.3
params<-c(beta,gamma)

times<-seq(from=0, to=10.0, by=0.01)

x11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=SIR_model)
#par(mfrow = c(1, 2))
plot(x=out[,1],y=out[,2], type='line')
lines(x=out[,1],y=out[,3])
lines(x=out[,1],y=out[,4])
print(out)
#scatterplot3d(out[,c(1,2,3)])

# params 3 
# initial value S(0)=0.99; I(O)=0.01; R(0)=0 

initial<-c(y1=0.99, y2=0.1, y3=0.0)

# parameters  beta = 8.0; gamma=4.3
beta <- 8.0
gamma <- 4.5
params<-c(beta,gamma)

times<-seq(from=0, to=10.0, by=0.01)

x11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=SIR_model)
#par(mfrow = c(1, 2))
plot(x=out[,1],y=out[,2], type='line')
lines(x=out[,1],y=out[,3])
lines(x=out[,1],y=out[,4])
print(out)
#scatterplot3d(out[,c(1,2,3)])

# params 3 
# initial value S(0)=0.99; I(O)=0.01; R(0)=0 

initial<-c(y1=0.99, y2=0.01, y3=0.0)

# parameters  beta = 8.0; gamma=4.3
beta <- 8.0
gamma <- 2
params<-c(beta,gamma)

times<-seq(from=0, to=10.0, by=0.01)

x11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=SIR_model)
#par(mfrow = c(1, 2))
plot(x=out[,1],y=out[,2], type='line')
lines(x=out[,1],y=out[,3])
lines(x=out[,1],y=out[,4])
print(out)
#scatterplot3d(out[,c(1,2,3)])

# params 3 
# initial value S(0)=0.99; I(O)=0.01; R(0)=0 

initial<-c(y1=0.99, y2=0.01, y3=0.0)

# parameters  beta = 8.0; gamma=4.3
beta <- 8.0
gamma <- 2
params<-c(beta,gamma)

times<-seq(from=0, to=10.0, by=0.01)

x11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=SIR_model)
#par(mfrow = c(1, 2))
plot(x=out[,1],y=out[,2], type='line')
lines(x=out[,1],y=out[,3])
lines(x=out[,1],y=out[,4])
print(out)
#scatterplot3d(out[,c(1,2,3)])

# params 3 
# initial value S(0)=0.99; I(O)=0.01; R(0)=0 

initial<-c(y1=0.99, y2=0.01, y3=0.0)

# parameters  beta = 8.0; gamma=4.3
beta <- 8.0
gamma <- 2
params<-c(beta,gamma)

times<-seq(from=0, to=4.0, by=0.01)

x11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=SIR_model)
#par(mfrow = c(1, 2))
plot(x=out[,1],y=out[,2], type='line')
lines(x=out[,1],y=out[,3])
lines(x=out[,1],y=out[,4])
print(out)
#scatterplot3d(out[,c(1,2,3)])