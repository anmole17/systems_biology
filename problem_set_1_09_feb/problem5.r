# problem 5
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

#out[1,1,1,1]
# initial value y1(0)=1, y2(0)=0, y3(0)=0.9

initial<-c(y1=315, y2=0, y3=0)

# parameters 1
e <- 0.5
c <- 0.3
delta <- 0.4
params<-c(e,c,delta)

times<-seq(from=0, to=24, by=0.01)

x11()
# ODE calculation using function from deSolve
out<- ode(times=times,y=initial ,parms=params,func=model)
par(mfrow = c(2, 2))
plot(out)
scatterplot3d(out[,c(1,2,3)])

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
tail(out2) # ans : 313.0694 mg ends up in liver after 24 hrs

