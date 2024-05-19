## problem 2
## dM=-e*M
## dB= e*M-c*B
## dL=c*B-delta*L
library("deSolve")
library("scatterplot3d")
model<-function(times,y,params){
  e<-params[1]
  c<-params[2]
  delta<-params[3]
  dM=-e*y[1]
  dB= e*y[1]-c*y[2]
  dL=c*y[2]-delta*y[3]
  return(list(c(dM,dB,dL)))
}
initial<-c(y1=315, y2=0, y3=0)
# parameters
e <- 0.5
c <- 0.3
delta <- 0.4
params<-c(e,c,delta)
times<-seq(from=0, to=24, by=0.01)
# ODE calculation 
out<- ode(times=times,y=initial ,parms=params,func=model)
# par(mfrow = c(2, 2))
# part a
X11()
plot(out[,1], out[,2], xlab="Times(hours)", ylab="Amount of anaesthesia in mg", 
     main="Time vs M(t) and B(t)", type='l', col='blue')
lines(out[,1], out[,3], col='red')
# to observe 3D scatter plot
# x11()
# scatterplot3d(out[,c(1,2,3)])
head(out)
out<-data.frame(out)
# part b
time<-head(out[which(out[,2]<=(initial[1]/2)),], n=1)
time[,1] # 1.39 hr
# part c
# parameters 1
e <- 0.5
c <- 0.3
delta <- 0
params<-c(e,c,delta)
x11()
# ODE calculation using function from deSolve
out2<- ode(times=times,y=initial ,parms=params,func=model)
par(mfrow = c(2, 2))
plot(out2)
tail(out2) # ans : 314.4150 mg ends up in liver after 24 hrs

