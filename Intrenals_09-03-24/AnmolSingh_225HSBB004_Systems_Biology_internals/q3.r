## problem 3
# pt-> prey; Pt-> predator
# dprey/dt= bp*pt-d*pt-e*pt*Pt
# dpred/dt= bP*Pt*pt-dP*Pt

library("deSolve")
library("scatterplot3d")
model<-function(times,y,params){
  bp<-params[1] # birth rate per capita
  dp<-params[2] # death rate per capita
  ep<-params[3] # prey eaten rate per capita
  # predator
  bP<-params[4] # growth rate per capita
  dP<-params[5] # death rate per capita
  dPrey=bp*y[1]-dp*y[1]-ep*y[1]*y[2]
  dPredator= bP*y[2]*y[1]-dP*y[2]
  return(list(c(dPrey,dPredator)))
}
# set initial values
initial<-c(y1=15, y2=7)
# parameters
# for prey
bp<-3.5 # birth rate per capita
dp<-0.5 # death rate per capita
ep<-1 # prey eaten rate per capita
# predator
bP<-1 # growth rate per capita
dP<-3.2 # death rate per capita
params<-c(bp,dp,ep,bP,dP)

times<-seq(from=0, to=20, by=0.01)
# ODE calculation 
out<- ode(times=times,y=initial ,parms=params,func=model)
# a. number of predator and prey as function of time.
X11()
plot(out[,1], out[,2], xlab="Times", ylab="Number of organisms", 
     main="Time vs Prey(t) and Predator(t)", type='l', col='blue')
lines(out[,1], out[,3], col='red')

# c. setting initial to 0 of prey or predator
# setting prey as 0
X11()
par(mfrow = c(1, 2))
initial<-c(y1=0, y2=7)
out_p0<- ode(times=times,y=initial ,parms=params,func=model)
plot(out_p0[,1], out_p0[,2], xlab="Times", ylab="Number of organisms", 
     main="Time vs Prey(t) and Predator(t); Prey(0)=0", type='l', col='blue')
lines(out_p0[,1], out_p0[,3], col='red')
# setting predator as 0
initial<-c(y1=15, y2=0) 
out_P0<- ode(times=times,y=initial ,parms=params,func=model)
plot(out_P0[,1], out_P0[,2], xlab="Times", ylab="Number of organisms", 
     main="Time vs Prey(t) and Predator(t); Predator(0)=0", type='l', col='blue')
lines(out_P0[,1], out_P0[,3], col='red')



