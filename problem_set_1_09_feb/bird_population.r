#problem 1
# model N(t)=1000*e^(0.1*t)
library(deSolve)

model<-function(times,y,params){
  N<-y
  kb<-params[1]
  dN<-kb*N
  return(list(dN))
}


# initial value 
y<-1000
# parameters

kb<-0.1
params<-c(kb)

# time range for solution
times<-seq(0,7,0.1)

# call 'ode' function from library "deSolve"
out<-ode(y,times,model,params)

#par(mfrow = c(2, 2))
# overloaded function for ode
plot(out, xlab="Time(t)", ylab="N(t)", color='red', main="Numerically Solve N(t)=1000*e^(0.1*t)")

#summary
print(out)
print(summary(out))