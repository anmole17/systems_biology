# problem 3
# eq 1: dA/dt=Ro-kA - when patch on

library(deSolve)

model1<-function(times,y,params){
  A<-y
  k<-params[1]
  Ro<-params[2]
  dA<-Ro-k*A
  return(list(dA))
}


# initial value 
y<-0
# parameters
k<-0.12
Ro<-1

params<-c(k,Ro)

# time range for solution
times<-seq(0,16,0.1)

# call 'ode' function from library "deSolve"
out1<-ode(y,times,model1,params)

model2<-function(times,y,params){
  A<-y
  k<-params[1]
  dA<--k*A
  return(list(dA))
}


# initial value 
y<-out1[161,2]
print(y)
# parameters
k<-0.12

params<-c(k)

# time range for solution
times<-seq(16,16+8,0.1)

# call 'ode' function from library "deSolve"
out2<-ode(y,times,model2,params)
out=rbind(out1,out2)
print(out)
#par(mfrow = c(2, 2))
# overloaded function for ode
plot(out,type='line', xlab="Time(t)", ylab="N(t)", color='red', main="Numerically Solve Problem 3")

#summary
print(out)
print(summary(out))
