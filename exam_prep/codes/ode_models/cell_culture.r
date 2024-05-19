# problem 4
# dN/dt=(kb-kd)*N-R

library(deSolve)

model<-function(times,y,params){
  N<-y
  kb<-params[1]
  kd<-params[2]
  R<-params[3]
  dN<-(kb-kd)*N-R
  return(list(dN))
}


# initial value 
y<-1000000
# parameters
kd<-0.005
kb<-0.015
r<-5000
params<-c(kb,kd,r)

# time range for solution
times<-seq(0,10,1)

# call 'ode' function from library "deSolve"
out<-ode(y,times,model,params)

#par(mfrow = c(2, 2))
# overloaded function for ode
plot(out, xlab="Time(t)", ylab="N(t)", color='red', main="Numerically Solve dN/dt= (kb-kd)N-R")

#summary
print(out)
print(summary(out))
